# 源码与构建说明

## 这里是什么

`source/` 不是原始 Android 工程，是**从成品 APK 里反编译出来的、被改过的那部分代码**。原工程只有 APK，没有源码。

- `source/assets/webcat/`：App 启动时加载的网页前端，`file:///android_asset/webcat/index.html`
- `source/smali/top/webcat/myapp/`：Java 层被改过的类（smali 汇编格式）

没被改过的类不在里面。想看全部代码，自己把 APK 拖进 jadx / MT / apktool 反编译即可。

## 改过哪些地方

| 类 / 文件 | 改动 | 版本 |
|---|---|---|
| `FirstFragment.smali` | WebView 设置：UA 改成桌面版 Chrome | 1.1.0 之前 |
| `FirstFragment$1.smali` | `onReceivedSslError` 显式 `cancel()` + 日志 | 1.1.1 |
| `FirstFragment$3.smali` | `onProgressChanged` 到 10% 时注入 `perf.js` | 1.1.0 之前 |
| `JmDownloader.smali` | 下载器 WebView 初始化 | 1.1.0 之前 |
| `JmDownloader$1.smali` | 同上，`onReceivedSslError` 显式拒绝 | 1.1.1 |
| `JmZipPacker.smali` | 下载完打 zip、清临时图片 | 1.1.0 之前 |
| `assets/webcat/script.js` | 线路列表只收 https | 1.1.1 |
| `assets/webcat/downloader.html` | 下载请求强制 https | 1.1.1 |
| `assets/webcat/perf.js` | 预连接、图片优先级、提前去广告 | 1.1.0 之前 |
| `MyJavascriptInterface.smali` | 新增 `getVersionName()` 和 `downloadApk(url, fileName)` | 1.1.3 |
| `assets/webcat/update.js` | 检查更新逻辑（新增文件） | 1.1.3 |
| `assets/webcat/update.js` | 检查更新 / 下载改走 GitHub 加速通道，失败回落直连 | 1.1.4 |
| `assets/webcat/index.html` | 首页加「检查更新」按钮、版本号占位、更新弹窗 | 1.1.3 |
| `assets/webcat/ui.css` | 按钮 / 弹窗 / Toast 样式 | 1.1.3 |

> 混合内容（`setMixedContentMode`）在 1.1.2 里从 `0` 改成过 `2`，真机实测会让漫画图片全部无法显示，
> 1.1.3 已改回 `0`，代码里现在就是 `0`。这一项不要再动。

关键片段的含义写在 `CHANGELOG.md` 和每个版本的构建记录里。

## 怎么复现

需要的东西：一个原始 APK、apktool（或 MT 管理器）、一个签名密钥。

1. 反编译：

   ```bash
   apktool d JMway-1.1.2.apk -o work
   ```

2. 改 `work/smali/...` 下对应的类，或者改 `work/assets/webcat/` 下的前端文件。

3. 改 `work/apktool.yml` 里的 `versionName` / `versionCode`。

4. 回编：

   ```bash
   apktool b work -o JMway-unsigned.apk
   ```

5. `zipalign` + 签名：

   ```bash
   zipalign -p 4 JMway-unsigned.apk JMway-aligned.apk
   apksigner sign \
     --ks release.jks --ks-key-alias jmway \
     --min-sdk-version 19 \
     --v1-signing-enabled true --v2-signing-enabled true --v3-signing-enabled true \
     --v4-signing-enabled false \
     --out JMway-1.1.2.apk JMway-aligned.apk
   ```

   注意 `--min-sdk-version 19` 必须写。不写的话 apksigner 可能按高版本处理，导致 Android 4.4 装不上。

6. 校验：

   ```bash
   apksigner verify --verbose --print-certs JMway-1.1.2.apk
   ```

   本仓库所有 1.1.x 版本的证书指纹都是：

   ```
   SHA-256  fa4253c61bbf980bfab56897110b4998a1244011a3bce13ec7fc74bbf37dd654
   SHA-1    d2d99444b38164f77e46d2d08b4de04ff71cb6d8
   ```

## 1.1.4 的构建方式（只换前端，不动 dex）

1.1.4 只改了 `assets/webcat/update.js`，dex 与 1.1.3 逐字节相同。做法是**不解包整个 APK**：

1. 从 1.1.3 成品包里取出 `AndroidManifest.xml`，直接按二进制改 AXML 字符串池和节点
   （versionName `1.1.3` → `1.1.4`、versionCode 数值 + 1、插入一个 `<uses-permission>`）
2. 用 Python `zipfile` 复制原包所有条目，只替换 `AndroidManifest.xml` 和 `assets/webcat/update.js`，
   同时丢掉 `META-INF/*.SF`、`*.RSA`、`MANIFEST.MF`
3. `apksigner` 重新签 V1 + V2 + V3

这样 `resources.arsc`、`classes.dex`、`res/` 全部保持原样，不会有 apktool 回编带来的资源表变化。
（apktool 2.7 解码这个包时会把 PNG 弄坏，`--use-aapt2` 回编会直接失败，所以没走 apktool 那条路。）

## 注意

- 用 apktool 回编有时会改 dex 顺序或资源表，装完可能闪退；更稳的做法是用 MT 管理器直接改 dex 里的类再回填，这也是本项目实际用的方式。
- 签名一旦换了，旧版本就不能覆盖安装，只能卸载重装。
- 仓库里的 APK 是签名过的成品，不是让你自己编的工程；改完必须重新签名才能装。
