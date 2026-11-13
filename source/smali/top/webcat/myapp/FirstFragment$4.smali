.class Ltop/webcat/myapp/FirstFragment$4;
.super Ljava/lang/Object;
.source "FirstFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltop/webcat/myapp/FirstFragment;->lambda$nonSyncGet$0$FirstFragment(Lokhttp3/OkHttpClient;Lokhttp3/Request;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ltop/webcat/myapp/FirstFragment;

.field final synthetic val$string:Ljava/lang/String;


# direct methods
.method constructor <init>(Ltop/webcat/myapp/FirstFragment;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$string"
        }
    .end annotation

    .line 350
    iput-object p1, p0, Ltop/webcat/myapp/FirstFragment$4;->this$0:Ltop/webcat/myapp/FirstFragment;

    iput-object p2, p0, Ltop/webcat/myapp/FirstFragment$4;->val$string:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 353
    # getter for: Ltop/webcat/myapp/FirstFragment;->webView:Lcom/tencent/smtt/sdk/WebView;
    invoke-static {}, Ltop/webcat/myapp/FirstFragment;->access$300()Lcom/tencent/smtt/sdk/WebView;

    move-result-object v0

    iget-object v1, p0, Ltop/webcat/myapp/FirstFragment$4;->val$string:Ljava/lang/String;

    new-instance v2, Ltop/webcat/myapp/FirstFragment$4$1;

    invoke-direct {v2, p0}, Ltop/webcat/myapp/FirstFragment$4$1;-><init>(Ltop/webcat/myapp/FirstFragment$4;)V

    invoke-virtual {v0, v1, v2}, Lcom/tencent/smtt/sdk/WebView;->evaluateJavascript(Ljava/lang/String;Lcom/tencent/smtt/sdk/ValueCallback;)V

    return-void
.end method
