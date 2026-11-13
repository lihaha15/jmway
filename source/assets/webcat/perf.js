/*
 * JMway WebView 性能探针 / 图片加载优化
 * 注入时机：onProgressChanged(>=1%) 与 onPageFinished（脚本自带幂等保护）
 *
 * HINTS = false  仅测量，不改页面（用于采集基线）
 * HINTS = true   预连接 + 首屏图片优先级 + 异步解码
 *
 * 日志关键字：[PERF]
 */
(function () {
  try {
    if (window.__jmPerf) return;
    window.__jmPerf = 1;

    var HINTS = true; // diag 基线版；perf 版改为 true
    var doc = document;
    var AD_SEL = '.ae65e2-f_1';

    function hostOf(u) {
      try {
        if (!u) return '';
        var h = new URL(u, location.href).hostname;
        return h || '';
      } catch (e) {
        return '';
      }
    }

    function addLink(rel, h) {
      try {
        if (!h) return;
        if (doc.querySelector('link[rel="' + rel + '"][data-jm="' + h + '"]')) return;
        var l = doc.createElement('link');
        l.rel = rel;
        l.href = 'https://' + h;
        l.setAttribute('data-jm', h);
        (doc.head || doc.documentElement).appendChild(l);
      } catch (e) {}
    }

    function ensureAdStyle(root) {
      try {
        var d = root.ownerDocument || root;
        if (!d || d.getElementById('jm-ad-style')) return;
        var s = d.createElement('style');
        s.id = 'jm-ad-style';
        s.textContent = AD_SEL + '{display:none!important;visibility:hidden!important;}';
        (d.head || d.documentElement).appendChild(s);
      } catch (e) {}
    }

    function removeAdsIn(root) {
      try {
        var els = root.querySelectorAll(AD_SEL);
        var n = els.length;
        for (var i = n - 1; i >= 0; i--) {
          var el = els[i];
          if (el && el.parentNode) el.parentNode.removeChild(el);
        }
        return n;
      } catch (e) {
        return 0;
      }
    }

    function hideAdsIn(root) {
      try {
        var els = root.querySelectorAll(AD_SEL);
        for (var i = 0; i < els.length; i++) {
          var el = els[i];
          if (el && el.style) {
            el.style.setProperty('display', 'none', 'important');
            el.style.setProperty('visibility', 'hidden', 'important');
          }
        }
        return els.length;
      } catch (e) {
        return 0;
      }
    }

    // 新版站点把广告 class 换掉了，旧的 .ae65e2-f_1 已经匹配不到。
    // 新规则：XPath //div[text()='AD']，命中后删掉它的父元素（整块广告位）。
    // 参数 7 = XPathResult.ORDERED_NODE_SNAPSHOT_TYPE，快照可安全边删边读。
    function removeTextAdIn(root) {
      try {
        var d = root.nodeType === 9 ? root : (root.ownerDocument || doc);
        if (!d || typeof d.evaluate !== 'function') return 0;
        var res = d.evaluate("//div[text()='AD']", d, null, 7, null);
        if (!res || !res.snapshotLength) return 0;
        var n = 0;
        for (var i = res.snapshotLength - 1; i >= 0; i--) {
          var node = res.snapshotItem(i);
          var p = node && node.parentElement;
          if (!p || p === d.body || p === d.documentElement) continue;
          try {
            p.parentNode.removeChild(p);
            n++;
          } catch (e) {}
        }
        return n;
      } catch (e) {
        return 0;
      }
    }

    function sweepTextAds() {
      var n = removeTextAdIn(doc);
      try {
        var frames = doc.querySelectorAll('iframe');
        for (var i = 0; i < frames.length; i++) {
          try {
            var d = frames[i].contentDocument;
            if (d) n += removeTextAdIn(d);
          } catch (e) {}
        }
      } catch (e) {}
      if (n > 0) {
        console.log('[去广告] XPath 移除 ' + n + ' 个 AD 块 @ ' + location.href);
      }
      return n;
    }

    function killAds() {
      ensureAdStyle(doc);
      var n = removeAdsIn(doc) + removeTextAdIn(doc);
      try {
        var frames = doc.querySelectorAll('iframe');
        for (var i = 0; i < frames.length; i++) {
          try {
            var d = frames[i].contentDocument;
            if (d) {
              ensureAdStyle(d);
              n += removeAdsIn(d) + removeTextAdIn(d);
            }
          } catch (e) {}
        }
      } catch (e) {}
      if (n > 0) {
        console.log('[去广告] 移除 ' + n + ' 个广告元素 @ ' + location.href);
      }
    }

    function hideAds() {
      hideAdsIn(doc);
      try {
        var frames = doc.querySelectorAll('iframe');
        for (var i = 0; i < frames.length; i++) {
          try {
            var d = frames[i].contentDocument;
            if (d) hideAdsIn(d);
          } catch (e) {}
        }
      } catch (e) {}
    }

    function watchAds() {
      killAds();
      setTimeout(killAds, 1500);
      setTimeout(killAds, 3000);
      try {
        var tick = 0;
        setInterval(function () {
          if (doc.hidden) return;
          hideAds();
          // XPath 全文档扫描开销偏高，每 2 秒跑一次，兼顾后插入的广告
          if ((tick++ & 1) === 0) sweepTextAds();
        }, 1000);
      } catch (e) {}
      window.addEventListener('pageshow', killAds, false);
      window.addEventListener('popstate', killAds, false);
      window.addEventListener('hashchange', killAds, false);
      doc.addEventListener('visibilitychange', function () {
        if (!doc.hidden) killAds();
      }, false);
    }

    // jQuery 3.x 移除了 $(el).load(fn) 事件简写；站点 jquery.photo-0.3.js
    // 仍在用，会报 "e.indexOf is not a function"。这里把函数参数转成
    // .on('load', fn)，不影响正常的 .load(url)。
    function patchJQueryLoad() {
      try {
        var $ = window.jQuery;
        if (!$ || !$.fn || $.fn.__jmLoadFixed) return;
        var orig = $.fn.load;
        $.fn.load = function (url, data, callback) {
          if (typeof url === 'function') return this.on('load', url);
          return orig.apply(this, arguments);
        };
        $.fn.__jmLoadFixed = true;
      } catch (e) {}
    }

    patchJQueryLoad();
    try {
      var jqTimer = setInterval(patchJQueryLoad, 50);
      setTimeout(function () { clearInterval(jqTimer); }, 10000);
    } catch (e) {}

    function scan() {
      try {
        var imgs = doc.images || [];
        var counts = {};
        var hi = 0;
        var vh = window.innerHeight || 800;

        for (var i = 0; i < imgs.length; i++) {
          var img = imgs[i];
          try {
            if (!img.getAttribute('decoding')) img.setAttribute('decoding', 'async');
          } catch (e) {}

          var u = img.currentSrc || img.src ||
            img.getAttribute('data-src') || img.getAttribute('data-original') || '';
          var h = hostOf(u);
          if (h) counts[h] = (counts[h] || 0) + 1;

          if (hi < 4 && i < 20) {
            try {
              var r = img.getBoundingClientRect();
              if (r.bottom > -40 && r.top < vh * 1.2) {
                img.setAttribute('fetchpriority', 'high');
                hi++;
              }
            } catch (e) {}
          }
        }

        var list = [];
        for (var k in counts) list.push([k, counts[k]]);
        list.sort(function (a, b) { return b[1] - a[1]; });

        for (var j = 0; j < list.length && j < 4; j++) {
          addLink('dns-prefetch', list[j][0]);
          if (j < 2) addLink('preconnect', list[j][0]);
        }
      } catch (e) {}
    }

    watchAds();

    if (HINTS) {
      scan();
      setTimeout(scan, 1500);
    }

    try {
      var c = doc.createElement('canvas');
      var avif = c.toDataURL('image/avif').indexOf('data:image/avif') === 0;
      console.log('[PERF] engine avif=' + avif +
        ' lazy=' + ('loading' in HTMLImageElement.prototype) +
        ' fetchpriority=' + ('fetchPriority' in HTMLImageElement.prototype) +
        ' uad=' + (navigator.userAgentData ? 'yes' : 'no') +
        ' aspect=' + (window.CSS && CSS.supports ? CSS.supports('aspect-ratio', '1/1') : 'n/a') +
        ' ua=' + navigator.userAgent);
    } catch (e) {}

    var lcp = 0;
    try {
      new PerformanceObserver(function (list) {
        var es = list.getEntries();
        if (es.length) lcp = Math.round(es[es.length - 1].startTime);
      }).observe({ type: 'largest-contentful-paint', buffered: true });
    } catch (e) {}

    function report(tag) {
      try {
        var nav = (performance.getEntriesByType('navigation') || [])[0] || {};
        var res = performance.getEntriesByType('resource') || [];
        var re = /\.(jpe?g|png|webp|gif|avif|bmp)(\?|#|$)/i;
        var imgs = [];
        var i, e;

        for (i = 0; i < res.length; i++) {
          e = res[i];
          if (e.initiatorType === 'img' || re.test(e.name)) imgs.push(e);
        }

        var durs = [];
        var first = 0;
        var hosts = {};

        for (i = 0; i < imgs.length; i++) {
          e = imgs[i];
          var d = Math.round(e.duration);
          durs.push(d);
          if (!first || e.responseEnd < first) first = Math.round(e.responseEnd);

          var h = hostOf(e.name);
          if (h) {
            if (!hosts[h]) {
              hosts[h] = { n: 1, cold: d, start: e.startTime };
            } else {
              hosts[h].n++;
              if (e.startTime < hosts[h].start) {
                hosts[h].start = e.startTime;
                hosts[h].cold = d;
              }
            }
          }
        }

        durs.sort(function (a, b) { return a - b; });
        var sum = 0;
        for (i = 0; i < durs.length; i++) sum += durs[i];
        var p90 = durs.length ? durs[Math.min(durs.length - 1, Math.floor(durs.length * 0.9))] : 0;

        var slow = imgs.slice().sort(function (a, b) { return b.duration - a.duration; })
          .slice(0, 3)
          .map(function (x) { return hostOf(x.name) + ':' + Math.round(x.duration) + 'ms'; });

        var out = {
          tag: tag,
          url: location.href,
          vw: window.innerWidth + 'x' + window.innerHeight,
          dpr: window.devicePixelRatio || 1,
          nav: {
            dns: Math.round((nav.domainLookupEnd || 0) - (nav.domainLookupStart || 0)),
            tcp: Math.round((nav.connectEnd || 0) - (nav.connectStart || 0)),
            ttfb: Math.round((nav.responseStart || 0) - (nav.requestStart || 0)),
            load: Math.round(nav.loadEventEnd || performance.now())
          },
          img: {
            n: imgs.length,
            first: first,
            avg: durs.length ? Math.round(sum / durs.length) : 0,
            p90: p90,
            slow: slow
          },
          hosts: hosts,
          lcp: lcp
        };

        console.log('[PERF] ' + JSON.stringify(out));
        console.log('[PERF] imgs=' + out.img.n +
          ' first=' + out.img.first + 'ms' +
          ' avg=' + out.img.avg + 'ms' +
          ' p90=' + out.img.p90 + 'ms' +
          ' lcp=' + out.lcp + 'ms' +
          ' dns=' + out.nav.dns + 'ms' +
          ' ttfb=' + out.nav.ttfb + 'ms');
      } catch (e) {
        console.log('[PERF] report error: ' + e);
      }
    }

    var reported = false;
    function later() {
      setTimeout(function () {
        reported = true;
        report('load+2.5s');
      }, 2500);
    }

    if (doc.readyState === 'complete') later();
    else window.addEventListener('load', later, false);

    window.addEventListener('pagehide', function () {
      report(reported ? 'pagehide' : 'pagehide-early');
    }, false);
  } catch (e) {}
})();
