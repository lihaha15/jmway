.class public Ltop/webcat/myapp/utils/JmDownloader;
.super Ljava/lang/Object;
.source "JmDownloader.java"


# static fields
.field private static sHandler:Landroid/os/Handler;

.field public static sRunning:Z

.field public static sStarted:Z

.field public static sTaskId:I

.field private static sWebView:Lcom/tencent/smtt/sdk/WebView;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Ltop/webcat/myapp/utils/JmDownloader;->sHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    sput v0, Ltop/webcat/myapp/utils/JmDownloader;->sTaskId:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cleanup()V
    .registers 6

    :try_start_0
    sget-object v0, Ltop/webcat/myapp/utils/JmDownloader;->sWebView:Lcom/tencent/smtt/sdk/WebView;

    if-eqz v0, :cond_12

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_f

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_f
    invoke-virtual {v0}, Lcom/tencent/smtt/sdk/WebView;->destroy()V

    :cond_12
    const/4 v0, 0x0

    sput-object v0, Ltop/webcat/myapp/utils/JmDownloader;->sWebView:Lcom/tencent/smtt/sdk/WebView;

    sput-boolean v0, Ltop/webcat/myapp/utils/JmDownloader;->sRunning:Z
    :try_end_17
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_17} :catch_17

    :catch_17
    return-void
.end method

.method public static consoleLog(Ljava/lang/String;)V
    .registers 5

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "console.log("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ltop/webcat/myapp/utils/JmDownloader;->sHandler:Landroid/os/Handler;

    new-instance v2, Ltop/webcat/myapp/utils/JmDownloader$3;

    invoke-direct {v2, v0}, Ltop/webcat/myapp/utils/JmDownloader$3;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_27
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_27} :catch_27

    :catch_27
    return-void
.end method

.method public static onDownloadFinished(Landroid/app/Activity;Ljava/lang/String;II)V
    .registers 6

    const/4 v0, 0x0

    sput-boolean v0, Ltop/webcat/myapp/utils/JmDownloader;->sRunning:Z

    :try_start_3
    sget-object v0, Ltop/webcat/myapp/utils/JmDownloader;->sHandler:Landroid/os/Handler;

    new-instance v1, Ltop/webcat/myapp/utils/JmDownloader$5;

    invoke-direct {v1, p0, p1}, Ltop/webcat/myapp/utils/JmDownloader$5;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_d} :catch_d

    :catch_d
    return-void
.end method

.method public static start(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 10

    :try_start_0
    sget-boolean v0, Ltop/webcat/myapp/utils/JmDownloader;->sRunning:Z

    if-eqz v0, :cond_f

    const-string v0, "\u5df2\u6709\u4e0b\u8f7d\u4efb\u52a1\u8fdb\u884c\u4e2d\uff0c\u8bf7\u7a0d\u5019"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_f
    const/4 v0, 0x1

    sput-boolean v0, Ltop/webcat/myapp/utils/JmDownloader;->sRunning:Z

    const/4 v0, 0x0

    sput-boolean v0, Ltop/webcat/myapp/utils/JmDownloader;->sStarted:Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[\u4e0b\u8f7d] \u4efb\u52a1\u5f00\u59cb\uff0c\u76ee\u6807 JM"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ltop/webcat/myapp/utils/JmDownloader;->consoleLog(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5f00\u59cb\u4e0b\u8f7d JM"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\uff0c\u8bf7\u7559\u610f\u63a7\u5236\u53f0\u4e0e\u63d0\u793a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    new-instance v0, Lcom/tencent/smtt/sdk/WebView;

    invoke-direct {v0, p0}, Lcom/tencent/smtt/sdk/WebView;-><init>(Landroid/content/Context;)V

    sput-object v0, Ltop/webcat/myapp/utils/JmDownloader;->sWebView:Lcom/tencent/smtt/sdk/WebView;

    invoke-virtual {v0}, Lcom/tencent/smtt/sdk/WebView;->getSettings()Lcom/tencent/smtt/sdk/WebSettings;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setDomStorageEnabled(Z)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setAllowFileAccess(Z)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    const-string v3, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"

    invoke-virtual {v1, v3}, Lcom/tencent/smtt/sdk/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Lcom/tencent/smtt/sdk/WebSettings;->setMixedContentMode(I)V

    new-instance v1, Ltop/webcat/myapp/utils/JmDownloader$2;

    invoke-direct {v1, p0}, Ltop/webcat/myapp/utils/JmDownloader$2;-><init>(Landroid/app/Activity;)V

    const-string v3, "AndroidBridge"

    invoke-virtual {v0, v1, v3}, Lcom/tencent/smtt/sdk/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Ltop/webcat/myapp/utils/JmDownloader$1;

    invoke-direct {v1, p1}, Ltop/webcat/myapp/utils/JmDownloader$1;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/tencent/smtt/sdk/WebView;->setWebViewClient(Lcom/tencent/smtt/sdk/WebViewClient;)V

    const v1, 0x3c23d70a    # 0.01f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, 0x1

    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v1, "file:///android_asset/webcat/downloader.html"

    invoke-virtual {v0, v1}, Lcom/tencent/smtt/sdk/WebView;->loadUrl(Ljava/lang/String;)V

    sget v5, Ltop/webcat/myapp/utils/JmDownloader;->sTaskId:I

    add-int/lit8 v5, v5, 0x1

    sput v5, Ltop/webcat/myapp/utils/JmDownloader;->sTaskId:I

    sget-object v1, Ltop/webcat/myapp/utils/JmDownloader;->sHandler:Landroid/os/Handler;

    new-instance v2, Ltop/webcat/myapp/utils/JmDownloader$4;

    invoke-direct {v2, p0, v5}, Ltop/webcat/myapp/utils/JmDownloader$4;-><init>(Landroid/app/Activity;I)V

    const-wide/16 v3, 0x4e20

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    new-instance v2, Ltop/webcat/myapp/utils/JmDownloader$6;

    invoke-direct {v2, p0, v5}, Ltop/webcat/myapp/utils/JmDownloader$6;-><init>(Landroid/app/Activity;I)V

    const-wide/32 v3, 0x927c0

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_b3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_b3} :catch_b4

    goto :goto_bb

    :catch_b4
    move-exception v0

    const/4 v0, 0x0

    sput-boolean v0, Ltop/webcat/myapp/utils/JmDownloader;->sRunning:Z

    invoke-static {}, Ltop/webcat/myapp/utils/JmDownloader;->cleanup()V

    :goto_bb
    return-void
.end method
