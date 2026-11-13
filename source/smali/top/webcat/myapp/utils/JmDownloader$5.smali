.class public Ltop/webcat/myapp/utils/JmDownloader$5;
.super Ljava/lang/Object;
.source "JmDownloader.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final summary:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3

    iput-object p1, p0, Ltop/webcat/myapp/utils/JmDownloader$5;->activity:Landroid/app/Activity;

    iput-object p2, p0, Ltop/webcat/myapp/utils/JmDownloader$5;->summary:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    :try_start_0
    iget-object v0, p0, Ltop/webcat/myapp/utils/JmDownloader$5;->activity:Landroid/app/Activity;

    iget-object v1, p0, Ltop/webcat/myapp/utils/JmDownloader$5;->summary:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[\u4e0b\u8f7d] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltop/webcat/myapp/utils/JmDownloader$5;->summary:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ltop/webcat/myapp/utils/JmDownloader;->consoleLog(Ljava/lang/String;)V

    invoke-static {}, Ltop/webcat/myapp/utils/JmDownloader;->cleanup()V
    :try_end_27
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_27} :catch_27

    :catch_27
    return-void
.end method
