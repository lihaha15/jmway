.class public Ltop/webcat/myapp/FirstFragment$1;
.super Lcom/tencent/smtt/sdk/WebViewClient;
.source "FirstFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltop/webcat/myapp/FirstFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ltop/webcat/myapp/FirstFragment;

.field final synthetic val$appConfig:Ljava/util/Map;


# direct methods
.method constructor <init>(Ltop/webcat/myapp/FirstFragment;Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$appConfig"
        }
    .end annotation

    iput-object p1, p0, Ltop/webcat/myapp/FirstFragment$1;->this$0:Ltop/webcat/myapp/FirstFragment;

    iput-object p2, p0, Ltop/webcat/myapp/FirstFragment$1;->val$appConfig:Ljava/util/Map;

    invoke-direct {p0}, Lcom/tencent/smtt/sdk/WebViewClient;-><init>()V

    return-void
.end method

.method private isSameHost(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 6

    if-eqz p1, :cond_1f

    if-eqz p2, :cond_1f

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v0, :cond_1d

    if-eqz v1, :cond_1d

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0

    :cond_1d
    const/4 v0, 0x0

    return v0

    :cond_1f
    const/4 v0, 0x1

    return v0
.end method

.method private showCrossSiteDialog(Lcom/tencent/smtt/sdk/WebView;Ljava/lang/String;)V
    .registers 4

    :try_start_0
    new-instance v0, Ltop/webcat/myapp/FirstFragment$1$4;

    invoke-direct {v0, p0, p1, p2}, Ltop/webcat/myapp/FirstFragment$1$4;-><init>(Ltop/webcat/myapp/FirstFragment$1;Lcom/tencent/smtt/sdk/WebView;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_8} :catch_9

    goto :goto_d

    :catch_9
    move-exception v0

    invoke-virtual {p1, p2}, Lcom/tencent/smtt/sdk/WebView;->loadUrl(Ljava/lang/String;)V

    :goto_d
    return-void
.end method


# virtual methods
.method public onPageFinished(Lcom/tencent/smtt/sdk/WebView;Ljava/lang/String;)V
    .registers 6

    :try_start_0
    const-string v0, "(function(){try{function rm(){try{var els=document.querySelectorAll(\'.ae65e2-f_1\');var n=els.length;els.forEach(function(el){el.remove();});console.log(\'[\u53bb\u5e7f\u544a] \u79fb\u9664 \'+n+\' \u4e2a\u5e7f\u544a\u5143\u7d20 @ \'+location.href);}catch(e){console.log(\'[\u53bb\u5e7f\u544a] \u5f02\u5e38: \'+e);}}rm();setTimeout(rm,1500);}catch(e){console.log(\'[\u53bb\u5e7f\u544a] \u6ce8\u5165\u5f02\u5e38: \'+e);}})();"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/tencent/smtt/sdk/WebView;->evaluateJavascript(Ljava/lang/String;Lcom/tencent/smtt/sdk/ValueCallback;)V

    iget-object v0, p0, Ltop/webcat/myapp/FirstFragment$1;->this$0:Ltop/webcat/myapp/FirstFragment;

    const-string v1, "webcat/perf.js"

    invoke-virtual {v0, v1}, Ltop/webcat/myapp/FirstFragment;->getFromAssets(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/tencent/smtt/sdk/WebView;->evaluateJavascript(Ljava/lang/String;Lcom/tencent/smtt/sdk/ValueCallback;)V

    if-eqz p2, :cond_3e

    const-string v0, "http"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3e

    iget-object v0, p0, Ltop/webcat/myapp/FirstFragment$1;->this$0:Ltop/webcat/myapp/FirstFragment;

    invoke-virtual {v0}, Ltop/webcat/myapp/FirstFragment;->getVconsoleJs()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3e

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "if(!window.__jmVc){window.__jmVc=1;try{"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n;new VConsole({theme:\'dark\'});}catch(e){console.log(\'[VC] \'+e);}}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/tencent/smtt/sdk/WebView;->evaluateJavascript(Ljava/lang/String;Lcom/tencent/smtt/sdk/ValueCallback;)V
    :try_end_3e
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3e} :catch_3f

    :cond_3e
    goto :goto_40

    :catch_3f
    move-exception v0

    :goto_40
    return-void
.end method

.method public onPageStarted(Lcom/tencent/smtt/sdk/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .registers 6

    :try_start_0
    invoke-virtual {p1}, Lcom/tencent/smtt/sdk/WebView;->getWebChromeClient()Lcom/tencent/smtt/sdk/WebChromeClient;

    move-result-object v0

    instance-of v1, v0, Ltop/webcat/myapp/FirstFragment$3;

    if-eqz v1, :cond_d

    check-cast v0, Ltop/webcat/myapp/FirstFragment$3;

    invoke-virtual {v0}, Ltop/webcat/myapp/FirstFragment$3;->onHideCustomView()V
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_d} :catch_e

    :cond_d
    goto :goto_f

    :catch_e
    move-exception v0

    :goto_f
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/smtt/sdk/WebViewClient;->onPageStarted(Lcom/tencent/smtt/sdk/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public onReceivedSslError(Lcom/tencent/smtt/sdk/WebView;Lcom/tencent/smtt/export/external/interfaces/SslErrorHandler;Lcom/tencent/smtt/export/external/interfaces/SslError;)V
    .registers 6

    const-string v0, "JMway-SSL"

    const-string v1, "SSL error, request cancelled"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {p2}, Lcom/tencent/smtt/export/external/interfaces/SslErrorHandler;->cancel()V

    return-void
.end method

.method public shouldOverrideUrlLoading(Lcom/tencent/smtt/sdk/WebView;Ljava/lang/String;)Z
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "view",
            "url"
        }
    .end annotation

    const-string v0, "extraHeaders"

    const/4 v1, 0x1

    :try_start_3
    const-string v2, "http:"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1b

    const-string v2, "https:"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1b

    const-string v2, "file:"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_45

    :cond_1b
    invoke-virtual {p1}, Lcom/tencent/smtt/sdk/WebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Ltop/webcat/myapp/FirstFragment$1;->isSameHost(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_29

    invoke-direct {p0, p1, p2}, Ltop/webcat/myapp/FirstFragment$1;->showCrossSiteDialog(Lcom/tencent/smtt/sdk/WebView;Ljava/lang/String;)V

    return v1

    :cond_29
    const-string v0, "extraHeaders"

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iget-object v3, p0, Ltop/webcat/myapp/FirstFragment$1;->val$appConfig:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_41

    iget-object v2, p0, Ltop/webcat/myapp/FirstFragment$1;->val$appConfig:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/util/Map;

    :cond_41
    invoke-virtual {p1, p2, v2}, Lcom/tencent/smtt/sdk/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_a5

    :cond_45
    sget-object p1, Ltop/webcat/myapp/FirstFragment;->appConfigData:Lcom/alibaba/fastjson/JSONObject;

    const-string v0, "\u652f\u6301\u6253\u5f00\u5916\u90e8\u5e94\u7528"

    invoke-virtual {p1, v0}, Lcom/alibaba/fastjson/JSONObject;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_a5

    sget-object p1, Ltop/webcat/myapp/FirstFragment;->appConfigData:Lcom/alibaba/fastjson/JSONObject;

    const-string v0, "\u63d0\u793a\u6253\u5f00\u5916\u90e8\u5e94\u7528"

    invoke-virtual {p1, v0}, Lcom/alibaba/fastjson/JSONObject;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    if-eqz p1, :cond_63

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_94

    :cond_63
    new-instance p1, Landroidx/appcompat/app/AlertDialog$Builder;

    iget-object v0, p0, Ltop/webcat/myapp/FirstFragment$1;->this$0:Ltop/webcat/myapp/FirstFragment;

    invoke-virtual {v0}, Ltop/webcat/myapp/FirstFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "\u63d0\u793a"

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u5f53\u524d\u9875\u9762\u8981\u6253\u5f00\u7b2c\u4e09\u65b9\u5e94\u7528\uff0c\u662f\u5426\u5141\u8bb8\uff1f"

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u5141\u8bb8"

    new-instance v2, Ltop/webcat/myapp/FirstFragment$1$2;

    invoke-direct {v2, p0, p2}, Ltop/webcat/myapp/FirstFragment$1$2;-><init>(Ltop/webcat/myapp/FirstFragment$1;Ljava/lang/String;)V

    invoke-virtual {p1, v0, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u53d6\u6d88"

    new-instance v0, Ltop/webcat/myapp/FirstFragment$1$1;

    invoke-direct {v0, p0}, Ltop/webcat/myapp/FirstFragment$1$1;-><init>(Ltop/webcat/myapp/FirstFragment$1;)V

    invoke-virtual {p1, p2, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog$Builder;->show()Landroidx/appcompat/app/AlertDialog;

    goto :goto_a5

    :cond_94
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    invoke-direct {p1, v0, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    iget-object p2, p0, Ltop/webcat/myapp/FirstFragment$1;->this$0:Ltop/webcat/myapp/FirstFragment;

    invoke-virtual {p2, p1}, Ltop/webcat/myapp/FirstFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_a5
    :try_end_a5
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_a5} :catch_a5

    :catch_a5
    :cond_a5
    :goto_a5
    return v1
.end method
