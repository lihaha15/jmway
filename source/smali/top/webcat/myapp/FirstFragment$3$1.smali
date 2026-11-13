.class Ltop/webcat/myapp/FirstFragment$3$1;
.super Ljava/lang/Object;
.source "FirstFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltop/webcat/myapp/FirstFragment$3;->onJsAlert(Lcom/tencent/smtt/sdk/WebView;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/smtt/export/external/interfaces/JsResult;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Ltop/webcat/myapp/FirstFragment$3;

.field final synthetic val$result:Lcom/tencent/smtt/export/external/interfaces/JsResult;


# direct methods
.method constructor <init>(Ltop/webcat/myapp/FirstFragment$3;Lcom/tencent/smtt/export/external/interfaces/JsResult;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$1",
            "val$result"
        }
    .end annotation

    .line 256
    iput-object p1, p0, Ltop/webcat/myapp/FirstFragment$3$1;->this$1:Ltop/webcat/myapp/FirstFragment$3;

    iput-object p2, p0, Ltop/webcat/myapp/FirstFragment$3$1;->val$result:Lcom/tencent/smtt/export/external/interfaces/JsResult;

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

    .line 259
    iget-object p1, p0, Ltop/webcat/myapp/FirstFragment$3$1;->val$result:Lcom/tencent/smtt/export/external/interfaces/JsResult;

    invoke-interface {p1}, Lcom/tencent/smtt/export/external/interfaces/JsResult;->confirm()V

    return-void
.end method
