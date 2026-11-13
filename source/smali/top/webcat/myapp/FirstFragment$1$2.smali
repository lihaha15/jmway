.class Ltop/webcat/myapp/FirstFragment$1$2;
.super Ljava/lang/Object;
.source "FirstFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltop/webcat/myapp/FirstFragment$1;->shouldOverrideUrlLoading(Lcom/tencent/smtt/sdk/WebView;Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Ltop/webcat/myapp/FirstFragment$1;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ltop/webcat/myapp/FirstFragment$1;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$1",
            "val$url"
        }
    .end annotation

    .line 147
    iput-object p1, p0, Ltop/webcat/myapp/FirstFragment$1$2;->this$1:Ltop/webcat/myapp/FirstFragment$1;

    iput-object p2, p0, Ltop/webcat/myapp/FirstFragment$1$2;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic lambda$onClick$0$FirstFragment$1$2(Ljava/lang/String;)V
    .registers 4

    .line 152
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 153
    iget-object p1, p0, Ltop/webcat/myapp/FirstFragment$1$2;->this$1:Ltop/webcat/myapp/FirstFragment$1;

    iget-object p1, p1, Ltop/webcat/myapp/FirstFragment$1;->this$0:Ltop/webcat/myapp/FirstFragment;

    invoke-virtual {p1, v0}, Ltop/webcat/myapp/FirstFragment;->startActivity(Landroid/content/Intent;)V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_12} :catch_13

    goto :goto_32

    :catch_13
    move-exception p1

    .line 155
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onClick: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "\u542f\u52a8\u7b2c\u4e09\u65b9\u5e94\u7528\u5931\u8d25"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_32
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4
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

    .line 150
    new-instance p1, Ljava/lang/Thread;

    iget-object p2, p0, Ltop/webcat/myapp/FirstFragment$1$2;->val$url:Ljava/lang/String;

    new-instance v0, Ltop/webcat/myapp/-$$Lambda$FirstFragment$1$2$xPtZ6wRZ-i6B1BAZbi3SYZPUYhs;

    invoke-direct {v0, p0, p2}, Ltop/webcat/myapp/-$$Lambda$FirstFragment$1$2$xPtZ6wRZ-i6B1BAZbi3SYZPUYhs;-><init>(Ltop/webcat/myapp/FirstFragment$1$2;Ljava/lang/String;)V

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 157
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void
.end method
