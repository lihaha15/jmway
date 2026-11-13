.class Ltop/webcat/myapp/utils/MyJavascriptInterface$2;
.super Ljava/lang/Object;
.source "MyJavascriptInterface.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltop/webcat/myapp/utils/MyJavascriptInterface;->utw(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ltop/webcat/myapp/utils/MyJavascriptInterface;

.field final synthetic val$num:Ljava/lang/String;


# direct methods
.method constructor <init>(Ltop/webcat/myapp/utils/MyJavascriptInterface;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$num"
        }
    .end annotation

    .line 68
    iput-object p1, p0, Ltop/webcat/myapp/utils/MyJavascriptInterface$2;->this$0:Ltop/webcat/myapp/utils/MyJavascriptInterface;

    iput-object p2, p0, Ltop/webcat/myapp/utils/MyJavascriptInterface$2;->val$num:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dialog",
            "which"
        }
    .end annotation

    .line 71
    iget-object p1, p0, Ltop/webcat/myapp/utils/MyJavascriptInterface$2;->this$0:Ltop/webcat/myapp/utils/MyJavascriptInterface;

    # getter for: Ltop/webcat/myapp/utils/MyJavascriptInterface;->webView:Lcom/tencent/smtt/sdk/WebView;
    invoke-static {p1}, Ltop/webcat/myapp/utils/MyJavascriptInterface;->access$000(Ltop/webcat/myapp/utils/MyJavascriptInterface;)Lcom/tencent/smtt/sdk/WebView;

    move-result-object p1

    new-instance p2, Ltop/webcat/myapp/utils/MyJavascriptInterface$2$1;

    invoke-direct {p2, p0}, Ltop/webcat/myapp/utils/MyJavascriptInterface$2$1;-><init>(Ltop/webcat/myapp/utils/MyJavascriptInterface$2;)V

    invoke-virtual {p1, p2}, Lcom/tencent/smtt/sdk/WebView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
