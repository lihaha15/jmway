.class public Ltop/webcat/myapp/FirstFragment$1$3;
.super Ljava/lang/Object;
.source "FirstFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltop/webcat/myapp/FirstFragment$1;->showCrossSiteDialog(Lcom/tencent/smtt/sdk/WebView;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Ltop/webcat/myapp/FirstFragment$1;

.field final synthetic val$url:Ljava/lang/String;

.field final synthetic val$view:Lcom/tencent/smtt/sdk/WebView;


# direct methods
.method constructor <init>(Ltop/webcat/myapp/FirstFragment$1;Lcom/tencent/smtt/sdk/WebView;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            "this$1",
            "val$view",
            "val$url"
        }
    .end annotation

    iput-object p1, p0, Ltop/webcat/myapp/FirstFragment$1$3;->this$1:Ltop/webcat/myapp/FirstFragment$1;

    iput-object p2, p0, Ltop/webcat/myapp/FirstFragment$1$3;->val$view:Lcom/tencent/smtt/sdk/WebView;

    iput-object p3, p0, Ltop/webcat/myapp/FirstFragment$1$3;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6
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

    :try_start_0
    iget-object v0, p0, Ltop/webcat/myapp/FirstFragment$1$3;->val$view:Lcom/tencent/smtt/sdk/WebView;

    iget-object v1, p0, Ltop/webcat/myapp/FirstFragment$1$3;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/tencent/smtt/sdk/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_7} :catch_8

    goto :goto_10

    :catch_8
    move-exception v0

    const-string v0, "jmseach2"

    iget-object v1, p0, Ltop/webcat/myapp/FirstFragment$1$3;->val$url:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_10
    return-void
.end method
