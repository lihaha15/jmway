/* ==========================================================
 * JMway 检查更新
 * 依赖原生接口：webcat.getVersionName() / webcat.downloadApk(url, fileName)
 * 兼容老 WebView（Android 4.4 起），所以用 XMLHttpRequest 而不是 fetch
 * ========================================================== */
(function () {
  var REPO = 'lihaha15/jmway';
  var API = 'https://api.github.com/repos/' + REPO + '/releases/latest';
  var TIMEOUT = 16000;
  var busy = false;

  function $(id) { return document.getElementById(id); }

  function currentVersion() {
    try {
      if (window.webcat && window.webcat.getVersionName) {
        var v = window.webcat.getVersionName();
        if (v) return String(v).replace(/^v/i, '');
      }
    } catch (e) {}
    return '1.0.0';
  }

  /* 版本号比较：a 新返回 1，b 新返回 -1，相同返回 0 */
  function compare(a, b) {
    var pa = String(a).replace(/^v/i, '').split(/[.\-+_]/);
    var pb = String(b).replace(/^v/i, '').split(/[.\-+_]/);
    var n = Math.max(pa.length, pb.length);
    for (var i = 0; i < n; i++) {
      var x = parseInt(pa[i], 10);
      var y = parseInt(pb[i], 10);
      if (isNaN(x)) x = 0;
      if (isNaN(y)) y = 0;
      if (x > y) return 1;
      if (x < y) return -1;
    }
    return 0;
  }

  function setBtn(text, disabled, checking) {
    var btn = $('update-btn');
    var label = $('update-btn-text');
    if (label) label.textContent = text;
    if (btn) {
      btn.disabled = !!disabled;
      if (checking) btn.classList.add('is-checking');
      else btn.classList.remove('is-checking');
    }
  }

  function toast(msg) {
    try {
      if (window.webcat && window.webcat.tw) { window.webcat.tw(msg); return; }
    } catch (e) {}
    var t = $('jm-toast');
    if (!t) {
      t = document.createElement('div');
      t.id = 'jm-toast';
      t.className = 'jm-toast';
      document.body.appendChild(t);
    }
    t.textContent = msg;
    t.classList.add('show');
    clearTimeout(t._tid);
    t._tid = setTimeout(function () { t.classList.remove('show'); }, 2400);
  }

  function xhrJSON(url, cb) {
    var xhr = new XMLHttpRequest();
    var done = false;
    function finish(err, data) {
      if (done) return;
      done = true;
      cb(err, data);
    }
    try {
      xhr.open('GET', url, true);
      xhr.timeout = TIMEOUT;
      xhr.onreadystatechange = function () {
        if (xhr.readyState !== 4) return;
        var s = xhr.status;
        if (s >= 200 && s < 300) {
          try { finish(null, JSON.parse(xhr.responseText)); }
          catch (e) { finish(new Error('返回内容格式不对')); }
        } else if (s === 404) {
          finish(new Error('作者还没发布版本'));
        } else if (s === 403) {
          finish(new Error('请求太频繁，过一会儿再试'));
        } else if (s === 0) {
          finish(new Error('网络不通'));
        } else {
          finish(new Error('服务器返回 ' + s));
        }
      };
      xhr.ontimeout = function () { finish(new Error('连接超时')); };
      xhr.onerror = function () { finish(new Error('网络不通')); };
      xhr.send();
    } catch (e) {
      finish(e);
    }
  }

  function check() {
    if (busy) return;
    busy = true;
    setBtn('检查中', true, true);
    var cur = currentVersion();
    var url = API + '?_=' + new Date().getTime();

    xhrJSON(url, function (err, data) {
      busy = false;
      if (err) {
        setBtn('检查更新', false, false);
        toast('检查失败：' + err.message);
        return;
      }
      var raw = (data && (data.tag_name || data.name)) || '';
      var latest = String(raw).replace(/^v/i, '').trim();
      if (!latest) {
        setBtn('检查更新', false, false);
        toast('没有找到版本信息');
        return;
      }
      if (compare(latest, cur) <= 0) {
        setBtn('已是最新', false, false);
        toast('已经是最新版本 v' + cur);
        setTimeout(function () { setBtn('检查更新', false, false); }, 2800);
        return;
      }
      setBtn('发现新版本', false, false);
      openDialog(latest, data);
    });
  }

  function openDialog(latest, data) {
    var mask = $('update-mask');
    if (!mask) return;

    var notes = (data && data.body ? String(data.body) : '').trim();
    if (notes) {
      var lines = notes.split(/\r?\n/).filter(function (l) { return l.trim() !== ''; });
      if (lines.length > 7) notes = lines.slice(0, 7).join('\n') + '\n…';
    } else {
      notes = '修复已知问题，优化使用体验。';
    }

    var verEl = $('update-ver'); if (verEl) verEl.textContent = 'v' + latest;
    var nowEl = $('update-now'); if (nowEl) nowEl.textContent = currentVersion();
    var notesEl = $('update-notes'); if (notesEl) notesEl.textContent = notes;

    var url = '';
    var name = '';
    var assets = (data && data.assets) || [];
    for (var i = 0; i < assets.length; i++) {
      if (/\.apk$/i.test(assets[i].name || '')) {
        url = assets[i].browser_download_url || '';
        name = assets[i].name;
        break;
      }
    }
    if (!url) {
      name = 'JMway-' + latest + '.apk';
      url = 'https://github.com/' + REPO + '/releases/download/v' + latest + '/' + name;
    }

    mask._url = url;
    mask._name = name;

    var go = $('update-go');
    if (go) { go.disabled = false; go.textContent = '立即更新'; }

    mask.classList.add('show');
  }

  function closeDialog() {
    var mask = $('update-mask');
    if (!mask) return;
    mask.classList.remove('show');
  }

  function startDownload() {
    var mask = $('update-mask');
    var url = mask && mask._url;
    var name = mask && mask._name;
    if (!url) return;

    var go = $('update-go');
    if (go) { go.disabled = true; go.textContent = '正在下载…'; }

    var ok = false;
    try {
      if (window.webcat && window.webcat.downloadApk) {
        window.webcat.downloadApk(url, name);
        ok = true;
      }
    } catch (e) {}

    setTimeout(function () {
      if (go) { go.disabled = false; go.textContent = '立即更新'; }
      if (ok) {
        closeDialog();
      } else {
        toast('当前环境不支持直接下载，请到 GitHub 手动下载');
      }
    }, 800);
  }

  function boot() {
    var pill = $('version-pill');
    if (pill) pill.textContent = 'V ' + currentVersion();

    var btn = $('update-btn');
    if (btn) btn.addEventListener('click', check);

    var later = $('update-later');
    if (later) later.addEventListener('click', closeDialog);

    var go = $('update-go');
    if (go) go.addEventListener('click', startDownload);

    var mask = $('update-mask');
    if (mask) {
      mask.addEventListener('click', function (e) {
        if (e.target === mask) closeDialog();
      });
    }
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', boot);
  } else {
    boot();
  }
})();
