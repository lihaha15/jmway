.class public Ltop/webcat/myapp/utils/JmDownloader$3;
.super Ljava/lang/Object;
.source "JmDownloader.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final js:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Ltop/webcat/myapp/utils/JmDownloader$3;->js:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    :try_start_0
    sget-object v0, Ltop/webcat/myapp/FirstFragment;->webView:Lcom/tencent/smtt/sdk/WebView;

    if-eqz v0, :cond_a

    iget-object v1, p0, Ltop/webcat/myapp/utils/JmDownloader$3;->js:Ljava/lang/String;

    const/4 p0, 0x0

    invoke-virtual {v0, v1, p0}, Lcom/tencent/smtt/sdk/WebView;->evaluateJavascript(Ljava/lang/String;Lcom/tencent/smtt/sdk/ValueCallback;)V
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_a} :catch_a

    :catch_a
    :cond_a
    return-void
.end method
