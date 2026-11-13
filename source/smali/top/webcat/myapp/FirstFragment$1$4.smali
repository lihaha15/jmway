.class public Ltop/webcat/myapp/FirstFragment$1$4;
.super Ljava/lang/Object;
.source "FirstFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


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

    iput-object p1, p0, Ltop/webcat/myapp/FirstFragment$1$4;->this$1:Ltop/webcat/myapp/FirstFragment$1;

    iput-object p2, p0, Ltop/webcat/myapp/FirstFragment$1$4;->val$view:Lcom/tencent/smtt/sdk/WebView;

    iput-object p3, p0, Ltop/webcat/myapp/FirstFragment$1$4;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    :try_start_0
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    iget-object v1, p0, Ltop/webcat/myapp/FirstFragment$1$4;->this$1:Ltop/webcat/myapp/FirstFragment$1;

    iget-object v1, v1, Ltop/webcat/myapp/FirstFragment$1;->this$0:Ltop/webcat/myapp/FirstFragment;

    invoke-virtual {v1}, Ltop/webcat/myapp/FirstFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u8de8\u7ad9\u8df3\u8f6c\u63d0\u793a"

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5373\u5c06\u79bb\u5f00\u5f53\u524d\u7ad9\u70b9\uff0c\u662f\u5426\u5141\u8bb8\u8df3\u8f6c\u5230\uff1a\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Ltop/webcat/myapp/FirstFragment$1$4;->val$url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u5141\u8bb8"

    new-instance v2, Ltop/webcat/myapp/FirstFragment$1$3;

    iget-object v3, p0, Ltop/webcat/myapp/FirstFragment$1$4;->this$1:Ltop/webcat/myapp/FirstFragment$1;

    iget-object v4, p0, Ltop/webcat/myapp/FirstFragment$1$4;->val$view:Lcom/tencent/smtt/sdk/WebView;

    iget-object v5, p0, Ltop/webcat/myapp/FirstFragment$1$4;->val$url:Ljava/lang/String;

    invoke-direct {v2, v3, v4, v5}, Ltop/webcat/myapp/FirstFragment$1$3;-><init>(Ltop/webcat/myapp/FirstFragment$1;Lcom/tencent/smtt/sdk/WebView;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u53d6\u6d88"

    new-instance v2, Ltop/webcat/myapp/FirstFragment$1$1;

    iget-object v3, p0, Ltop/webcat/myapp/FirstFragment$1$4;->this$1:Ltop/webcat/myapp/FirstFragment$1;

    invoke-direct {v2, v3}, Ltop/webcat/myapp/FirstFragment$1$1;-><init>(Ltop/webcat/myapp/FirstFragment$1;)V

    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->show()Landroidx/appcompat/app/AlertDialog;
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4d} :catch_4e

    goto :goto_56

    :catch_4e
    move-exception v0

    iget-object v0, p0, Ltop/webcat/myapp/FirstFragment$1$4;->val$view:Lcom/tencent/smtt/sdk/WebView;

    iget-object v1, p0, Ltop/webcat/myapp/FirstFragment$1$4;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/tencent/smtt/sdk/WebView;->loadUrl(Ljava/lang/String;)V

    :goto_56
    return-void
.end method
