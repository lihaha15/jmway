# 更新记录

每个版本的 APK 都附 SHA-256，下载后可以自己核对（手机上的文件管理器、电脑上的 `sha256sum` 都行）。

## 1.1.4 — 2026-11-14

检查更新和下载改走 GitHub 加速通道，国内网络不用再干等。

- 检查更新改成「先加速、后直连」：依次尝试 `gh-proxy.org`、`gh-proxy.com`，都连不上才回落 GitHub 直连
- 下载 APK 前先用 HEAD 请求探一下通道，哪条通就走哪条；全部不通再直连
- 检查更新成功时记住可用通道，点「立即更新」直接复用，不再重复探测
- 换通道时按钮只显示「正在连接…」「换个通道…」，不出现技术词汇
- 原生方法、界面、dex 与 1.1.3 完全一致，只换了 `assets/webcat/update.js`

| 项 | 值 |
|---|---|
| 文件 | `JMway-1.1.4.apk` |
| 大小 | 3,668,290 字节 |
| SHA-256 | `4dfdbb6278e95d2c2a890a048bb61aabbdabc2da5650d902b32f83e07ad37c4c` |
| versionName / versionCode | 1.1.4 / 101007 |

> versionCode 又跳了一号（101005 → 101007），是因为测试加速下载时打过
> `versionName=1.1.2 / versionCode=101006` 的测试包，正式包必须比它高才能覆盖安装。
> 测试包只在本地用，没有上传。

## 1.1.3 — 2026-11-14

新增应用内检查更新，并撤销 1.1.2 的混合内容改动。

- **撤销 1.1.2 的 `setMixedContentMode(2)`**：真机实测这一改动会让漫画图片全部无法显示，改回原来的 `0`（全部允许）。这一项以后不再动。
- 首页新增「检查更新」按钮：请求 GitHub 的 `releases/latest` 接口比对版本，有新版本弹出提示卡片
- 应用内下载：走系统 `DownloadManager`，文件存到 `Download/` 目录，下载完点通知栏安装
- Android 8 及以上会先检查「允许安装未知应用」，没开会引导到系统设置页
- 首页右上角版本号改为读取真实 `versionName`（以前写死 `V 1.0`）
- manifest 新增 `REQUEST_INSTALL_PACKAGES` 权限（Android 8 起安装 APK 必需）

| 项 | 值 |
|---|---|
| 文件 | `JMway-1.1.3.apk` |
| 大小 | 3,672,386 字节 |
| SHA-256 | `075276b935c53c3ef5e4664919cdab4bdcd8c3e66c97ccfddca2f633bdf352e0` |
| versionName / versionCode | 1.1.3 / 101005 |

> versionCode 比 1.1.2 多跳了两号（101003 → 101005），是因为测试更新流程时中间打过一个
> `versionName=1.1.2 / versionCode=101004` 的测试包，正式包必须比它高才能覆盖安装。

新增的原生方法（`source/smali/top/webcat/myapp/utils/MyJavascriptInterface.smali`）：

- `getVersionName()`：读 `PackageManager` 的 `versionName`，供前端显示和版本比对
- `downloadApk(url, fileName)`：删同名旧文件 → `DownloadManager.enqueue` → Toast 提示

## 1.1.2 — 2026-11-13（已回滚）

混合内容策略收紧，其它不变。

- WebView 的 `setMixedContentMode` 从 `0`（全部允许）改为 `2`（兼容模式）：https 页面里的 http 子资源会先尝试改成 https 再加载，改不了就不加载
- 下载器和线路列表的 https 限制沿用 1.1.1

| 项 | 值 |
|---|---|
| 文件 | `JMway-1.1.2.apk` |
| 大小 | 3,664,125 字节 |
| SHA-256 | `f3f2105245a27383b8932d6fa3dd7ab49a671d4178a60f13bdf766a75e55897c` |
| versionName / versionCode | 1.1.2 / 101002 |

## 1.1.1 — 2026-11-13

传输层收紧。

- 证书错误一律拒绝（`onReceivedSslError` 显式 `cancel()`）
- 下载器只接受 https 地址，http 图片直接拒绝
- 线路列表只收 https 节点

| 项 | 值 |
|---|---|
| 文件 | `JMway-1.1.1.apk`（未单独发布，内容并入 1.1.2） |
| 大小 | 3,668,221 字节 |
| SHA-256 | `71ae561b4f43156fe0fcb2a0de1c24367e842be6c3de5ee4680301cbac7e0768` |
| versionName / versionCode | 1.1.1 / 101001 |

## 1.1.0 — 2026-11-13

换签名 + 关掉几个不必要的功能。

- 换了自己的签名证书，从 1.0.x 升级必须先卸载旧版
- `allowBackup=false`，避免登录 Cookie 被系统备份带走
- 关掉内置自动更新检查（原来走 http 明文，指向官方原版壳）
- vConsole 改为只用 APK 内本地文件，不再从公共 CDN 下载

| 项 | 值 |
|---|---|
| 文件 | `JMway-1.1.0.apk` |
| 大小 | 3,664,125 字节 |
| SHA-256 | `f08154116ee6ead6353ea462a1e2f281436494f790e5b66e26e953d62465dcf6` |
| versionName / versionCode | 1.1.0 / 101000 |

## 1.0.0.1 — 2026-08-08

- 下载漫画后自动打包成 zip，打完删临时图片，相册不污染
- 使用 AOSP 测试签名（和 1.1.0 之后的签名不同）

| 项 | 值 |
|---|---|
| 文件 | `JMway-1.0.0.1.apk`（已从仓库移除，可在旧提交里找到） |
| 大小 | 3,635,457 字节 |
| SHA-256 | 未记录 |
