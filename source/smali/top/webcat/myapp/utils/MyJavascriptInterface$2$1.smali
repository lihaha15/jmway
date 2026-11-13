.class Ltop/webcat/myapp/utils/MyJavascriptInterface$2$1;
.super Ljava/lang/Object;
.source "MyJavascriptInterface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltop/webcat/myapp/utils/MyJavascriptInterface$2;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Ltop/webcat/myapp/utils/MyJavascriptInterface$2;


# direct methods
.method constructor <init>(Ltop/webcat/myapp/utils/MyJavascriptInterface$2;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$1"
        }
    .end annotation

    .line 71
    iput-object p1, p0, Ltop/webcat/myapp/utils/MyJavascriptInterface$2$1;->this$1:Ltop/webcat/myapp/utils/MyJavascriptInterface$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 74
    iget-object v0, p0, Ltop/webcat/myapp/utils/MyJavascriptInterface$2$1;->this$1:Ltop/webcat/myapp/utils/MyJavascriptInterface$2;

    iget-object v0, v0, Ltop/webcat/myapp/utils/MyJavascriptInterface$2;->this$0:Ltop/webcat/myapp/utils/MyJavascriptInterface;

    # getter for: Ltop/webcat/myapp/utils/MyJavascriptInterface;->webView:Lcom/tencent/smtt/sdk/WebView;
    invoke-static {v0}, Ltop/webcat/myapp/utils/MyJavascriptInterface;->access$000(Ltop/webcat/myapp/utils/MyJavascriptInterface;)Lcom/tencent/smtt/sdk/WebView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "wc.windowArray["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Ltop/webcat/myapp/utils/MyJavascriptInterface$2$1;->this$1:Ltop/webcat/myapp/utils/MyJavascriptInterface$2;

    iget-object v2, v2, Ltop/webcat/myapp/utils/MyJavascriptInterface$2;->val$num:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "]();"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ltop/webcat/myapp/utils/MyJavascriptInterface$2$1$1;

    invoke-direct {v2, p0}, Ltop/webcat/myapp/utils/MyJavascriptInterface$2$1$1;-><init>(Ltop/webcat/myapp/utils/MyJavascriptInterface$2$1;)V

    invoke-virtual {v0, v1, v2}, Lcom/tencent/smtt/sdk/WebView;->evaluateJavascript(Ljava/lang/String;Lcom/tencent/smtt/sdk/ValueCallback;)V

    return-void
.end method
