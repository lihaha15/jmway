/**
 * jmsearch😋 - 网络节点探测脚本
 * 
 * 功能：
 * 1. 从 jmcomicne.net 获取节点域名列表
 * 2. 对各节点进行延迟测速
 * 3. 选出最快节点并提供一键跳转
 */

// ==========================================
// 全局状态
// ==========================================

/** 请求头配置（用于 fetch 请求） */
const REQUEST_HEADERS = new Headers({
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',
    'Accept-Encoding': 'gzip, deflate',
    'Accept': '*/*',
    'Connection': 'keep-alive',
    'Accept-Language': 'zh-CN,zh;q=0.9'
});

/** 超时阈值（毫秒） */
const TIMEOUT_MS = 5000;

/** 测速结果汇总：{ url: string, latency: number, success: boolean } */
const speedResults = [];

/** 最快的节点 URL */
let bestUrl = null;

/** 拼接好的完整 URL 列表（协议 + 域名），用于延迟测试 */
let testUrls = [];

// ==========================================
// 步骤一 & 二：获取节点域名列表
// ==========================================

/**
 * 从 jmcomicne.net 获取页面内容，解析出节点域名
 * 目标标签：
 *   <div class="china"><span></span></div>
 *   <div class="second_line"><span></span></div>
 *   <div class="first_line"><span></span></div>
 * 
 * @returns {Promise<string[]>} 解析出的域名列表（如 ['jmcomic1.net', 'jmcomic2.net', ...]）
 */
async function fetchBaseUrls() {
    console.log('[节点探测] 开始获取节点列表...');
    
    try {
        // 使用 CORS 代理以绕过跨域限制
        // 直接 fetch 可能因 CORS 被浏览器拦截，此处尝试多种方式
        const response = await fetchWithTimeout('https://jmcomicne.net', {
            method: 'GET',
            headers: REQUEST_HEADERS,
            mode: 'cors'
        }, TIMEOUT_MS);

        if (!response.ok) {
            throw new Error(`HTTP ${response.status}: ${response.statusText}`);
        }

        const htmlText = await response.text();
        console.log('[节点探测] 页面获取成功，长度:', htmlText.length);

        // 解析 HTML 提取目标 div 中的 span 文本
        const urls = parseDomainFromHTML(htmlText);
        console.log('[节点探测] 解析结果:', urls);

        return urls;

    } catch (error) {
        console.warn('[节点探测] 直连失败，尝试使用备用 CORS 代理...', error.message);
        
        // 尝试通过多个 CORS 代理获取
        const proxyUrls = [
            `https://api.allorigins.win/raw?url=${encodeURIComponent('https://jmcomicne.net')}`,
            `https://corsproxy.io/?${encodeURIComponent('https://jmcomicne.net')}`,
        ];

        for (const proxyUrl of proxyUrls) {
            try {
                console.log('[节点探测] 尝试代理:', proxyUrl);
                const response = await fetchWithTimeout(proxyUrl, {}, TIMEOUT_MS);
                if (!response.ok) continue;

                const htmlText = await response.text();
                const urls = parseDomainFromHTML(htmlText);
                console.log('[节点探测] 代理解析结果:', urls);
                
                if (urls.length > 0) {
                    return urls;
                }
            } catch (e) {
                console.warn('[节点探测] 代理失败:', proxyUrl, e.message);
                continue;
            }
        }

        // 所有尝试均失败，使用默认备用域名
        console.warn('[节点探测] 所有获取方式均失败，使用默认备用域名');
        return getDefaultFallbackUrls();
    }
}

/**
 * 带超时的 fetch 封装
 * 
 * @param {string} url - 请求地址
 * @param {object} options - fetch 选项
 * @param {number} timeout - 超时毫秒数
 * @returns {Promise<Response>}
 */
function fetchWithTimeout(url, options = {}, timeout = TIMEOUT_MS) {
    return new Promise((resolve, reject) => {
        const controller = new AbortController();
        const timeoutId = setTimeout(() => {
            controller.abort();
            reject(new Error(`请求超时: ${url}`));
        }, timeout);

        fetch(url, { ...options, signal: controller.signal })
            .then(response => {
                clearTimeout(timeoutId);
                resolve(response);
            })
            .catch(error => {
                clearTimeout(timeoutId);
                reject(error);
            });
    });
}

/**
 * 从 HTML 文本中解析目标 div 内的 span 文本
 * 查找: .china span, .second_line span, .first_line span
 * 
 * @param {string} html - HTML 文本
 * @returns {string[]} 解析出的文本列表
 */
function parseDomainFromHTML(html) {
    const results = [];

    // 使用 DOMParser 解析 HTML
    const parser = new DOMParser();
    const doc = parser.parseFromString(html, 'text/html');

    // 按顺序提取三个目标元素
    const selectors = ['.china span', '.second_line span', '.first_line span'];

    selectors.forEach(selector => {
        const element = doc.querySelector(selector);
        if (element) {
            const text = element.textContent.trim();
            if (text) {
                results.push(text);
                console.log(`[解析] ${selector} -> "${text}"`);
            } else {
                console.warn(`[解析] ${selector} 存在但内容为空`);
            }
        } else {
            console.warn(`[解析] 未找到 ${selector}`);
        }
    });

    return results;
}

/**
 * 获取默认备用域名列表（当网络获取失败时使用）
 * 
 * @returns {string[]}
 */
function getDefaultFallbackUrls() {
    return [
        '18comic.org',
        '18comic.vip',
        'jmcomic2.mom'
    ];
}

// ==========================================
// 步骤四：节点延迟测速
// ==========================================

/**
 * 对单个 URL 进行延迟测速
 * 在 fetch 前后分别获取时间戳，计算耗时
 * 
 * @param {string} url - 完整 URL（含协议）
 * @param {number} index - 卡片索引（1-based）
 * @returns {Promise<{url: string, latency: number, success: boolean}>}
 */
async function testLatency(url, index) {
    const startTime = performance.now();
    let success = false;
    let latency = 0;

    console.log(`[测速] 开始测试 #${index}: ${url}`);

    try {
        // 使用 HEAD 请求测试连通性（轻量级）
        const response = await fetchWithTimeout(url, {
            method: 'HEAD',
            headers: REQUEST_HEADERS,
            mode: 'no-cors'  // no-cors 可避免 CORS 错误，但无法读取响应状态
        }, TIMEOUT_MS);

        // no-cors 模式下 response.ok 不可用，能到达这里说明请求已发出
        const endTime = performance.now();
        latency = Math.round(endTime - startTime);
        success = true;

        console.log(`[测速] #${index} ${url} -> ${latency}ms ✓`);

    } catch (error) {
        const endTime = performance.now();
        latency = Math.round(endTime - startTime);

        if (error.name === 'AbortError' || latency >= TIMEOUT_MS) {
            console.warn(`[测速] #${index} ${url} -> 超时 (${latency}ms) ✗`);
        } else {
            console.warn(`[测速] #${index} ${url} -> 失败: ${error.message}`);
        }
        success = false;
    }

    return { url, latency, success };
}

/**
 * 更新卡片上的延迟显示和状态图标
 * 
 * @param {number} index - 卡片索引（1-based）
 * @param {number} latency - 延迟毫秒数
 * @param {boolean} success - 是否成功
 */
function updateCardLatency(index, latency, success) {
    const latencySpan = document.getElementById(`detail-card-${index}-latency`);
    const statusSpan = document.getElementById(`detail-card-${index}-status`);

    if (latencySpan) {
        if (success) {
            latencySpan.textContent = `${latency}ms`;
        } else {
            latencySpan.textContent = latency >= TIMEOUT_MS ? '超时' : '失败';
        }
    }

    if (statusSpan) {
        if (success) {
            statusSpan.textContent = '🟩';
        } else {
            statusSpan.textContent = '🟥';
        }
    }
}

/**
 * 对所有节点 URL 执行延迟测速
 * 
 * @param {string[]} urls - URL 列表
 */
async function runSpeedTest(urls) {
    console.log('[测速] 开始对所有节点进行延迟测试...');
    speedResults.length = 0;  // 清空之前的结果

    // 并发测速
    const testPromises = urls.map((url, i) => testLatency(url, i + 1));

    const results = await Promise.allSettled(testPromises);

    results.forEach((result, i) => {
        const index = i + 1;
        if (result.status === 'fulfilled') {
            const { url, latency, success } = result.value;
            speedResults.push({ url, latency, success });

            // 更新卡片 UI
            updateCardLatency(index, latency, success);
        } else {
            console.error(`[测速] #${index} 测速异常:`, result.reason);
            speedResults.push({ url: urls[i], latency: TIMEOUT_MS, success: false });
            updateCardLatency(index, TIMEOUT_MS, false);
        }
    });

    // 找出最快的成功节点
    const successfulResults = speedResults.filter(r => r.success);
    if (successfulResults.length > 0) {
        successfulResults.sort((a, b) => a.latency - b.latency);
        bestUrl = successfulResults[0].url;
        console.log(`[测速] 最快节点: ${bestUrl} (${successfulResults[0].latency}ms)`);
    } else {
        console.warn('[测速] 所有节点均失败，无可用最快节点');
        bestUrl = null;
    }
}

// ==========================================
// 步骤五：最快路线按钮
// ==========================================

/**
 * 创建 / 更新"前往最快路线"按钮
 * 按钮显示在页面最下方
 */
function updateBestRouteButton() {
    const container = document.getElementById('best-route-area');
    if (!container) return;

    // 清空旧内容
    container.innerHTML = '';

    if (!bestUrl) {
        // 无可用节点时显示提示
        const msg = document.createElement('p');
        msg.className = 'best-route-msg';
        msg.textContent = '暂无可用节点';
        container.appendChild(msg);
        return;
    }

    const btn = document.createElement('button');
    btn.className = 'btn btn-primary best-route-btn animate-in';
    btn.id = 'best-route-btn';
    btn.textContent = `前往最快路线 (${bestUrl})`;
    btn.setAttribute('aria-label', `前往最快节点 ${bestUrl}`);
    
    btn.addEventListener('click', () => {
        console.log(`[跳转] 前往最快节点: ${bestUrl}`);
        // 在新窗口打开最快节点
        window.open(bestUrl, '_blank');
    });

    container.appendChild(btn);
}

// ==========================================
// 步骤三：更新卡片域名
// ==========================================

/**
 * 将获取到的 URL 更新到详情页面卡片中
 * 第一个卡片固定不变（18comic.vip），后三个替换为获取的 URL
 * 
 * @param {string[]} fetchedUrls - 从页面解析出的 3 个域名
 */
function updateCardDomains(fetchedUrls) {
    // 确保至少有 3 个 URL，不足则用默认值补齐
    const urls = [...fetchedUrls];
    const defaults = getDefaultFallbackUrls();
    
    // 合并后的完整 URL 列表（用于卡片显示和测速）
    // 第一个固定，后三个用获取的URL（不足则补默认值）
    const displayUrls = ['18comic.vip'];
    for (let i = 0; i < 3; i++) {
        if (i < urls.length) {
            displayUrls.push(urls[i]);
        } else {
            displayUrls.push(defaults[(i + 1) % defaults.length]);
        }
    }

    console.log('[更新] 卡片域名列表:', displayUrls);

    // 更新卡片 UI 中的域名
    displayUrls.forEach((domain, i) => {
        const index = i + 1;
        const domainSpan = document.getElementById(`detail-card-${index}-domain`);
        if (domainSpan) {
            domainSpan.textContent = domain;
        }

        // 同时更新"前往→"按钮的跳转目标
        const card = document.getElementById(`detail-card-${index}`);
        if (card) {
            const actionBtn = card.querySelector('.card-action-btn');
            if (actionBtn) {
                actionBtn.setAttribute('aria-label', `前往 ${domain}`);
                // 更新点击事件
                const newBtn = actionBtn.cloneNode(true);
                actionBtn.parentNode.replaceChild(newBtn, actionBtn);
                newBtn.addEventListener('click', () => {
                    const fullUrl = /^https:\/\//i.test(domain) ? domain : `https://${String(domain).replace(/^http:\/\//i, '')}`;
                    console.log(`前往: ${fullUrl}`);
                    window.open(fullUrl, '_blank');
                });
            }
        }
    });

    // 构建用于测速的完整 URL 列表（添加 https:// 前缀）
    testUrls = displayUrls
        .filter(domain => domain && !/^http:\/\//i.test(domain))
        .map(domain => {
            if (/^https:\/\//i.test(domain)) {
                return domain;
            }
            return `https://${String(domain).replace(/^https?:\/\//i, '')}`;
        });

    console.log('[更新] 测速 URL 列表:', testUrls);
}

// ==========================================
// 主流程
// ==========================================

/**
 * 网络节点探测主流程
 * 1. 获取节点域名
 * 2. 更新卡片
 * 3. 执行测速
 * 4. 显示最快路线按钮
 */
async function initNetworkCheck() {
    console.log('═══════════════════════════════════');
    console.log('[网络探测] 开始执行网络节点探测流程');
    console.log('═══════════════════════════════════');

    try {
        // 步骤一 & 二：获取节点域名
        const fetchedUrls = await fetchBaseUrls();
        console.log('[网络探测] 获取到域名:', fetchedUrls);

        // 步骤三：更新卡片域名（第一个固定，后三个替换）
        updateCardDomains(fetchedUrls);

        // 步骤四：执行延迟测速
        await runSpeedTest(testUrls);

        // 步骤五：显示最快路线按钮
        updateBestRouteButton();

        console.log('═══════════════════════════════════');
        console.log('[网络探测] 流程完成');
        console.log('═══════════════════════════════════');

    } catch (error) {
        console.error('[网络探测] 流程异常:', error);
        
        // 异常情况下也尝试显示按钮（使用默认数据）
        updateCardDomains([]);
        await runSpeedTest(testUrls);
        updateBestRouteButton();
    }
}
