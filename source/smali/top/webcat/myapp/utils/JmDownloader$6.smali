.class public Ltop/webcat/myapp/utils/JmDownloader$6;
.super Ljava/lang/Object;
.source "JmDownloader.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final taskId:I


# direct methods
.method public constructor <init>(Landroid/app/Activity;I)V
    .registers 3

    iput-object p1, p0, Ltop/webcat/myapp/utils/JmDownloader$6;->activity:Landroid/app/Activity;

    iput p2, p0, Ltop/webcat/myapp/utils/JmDownloader$6;->taskId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    :try_start_0
    sget v0, Ltop/webcat/myapp/utils/JmDownloader;->sTaskId:I

    iget v1, p0, Ltop/webcat/myapp/utils/JmDownloader$6;->taskId:I

    if-ne v1, v0, :cond_1b

    sget-boolean v0, Ltop/webcat/myapp/utils/JmDownloader;->sRunning:Z

    if-eqz v0, :cond_1b

    const-string v0, "[\u4e0b\u8f7d] \u9519\u8bef: \u4e0b\u8f7d\u603b\u8d85\u65f6(10\u5206\u949f)\uff0c\u5f3a\u5236\u7ed3\u675f"

    invoke-static {v0}, Ltop/webcat/myapp/utils/JmDownloader;->consoleLog(Ljava/lang/String;)V

    new-instance v0, Ltop/webcat/myapp/utils/JmDownloader$5;

    iget-object v1, p0, Ltop/webcat/myapp/utils/JmDownloader$6;->activity:Landroid/app/Activity;

    const-string v2, "\u4e0b\u8f7d\u8d85\u65f6\u4e2d\u65ad\uff0810\u5206\u949f\uff09"

    invoke-direct {v0, v1, v2}, Ltop/webcat/myapp/utils/JmDownloader$5;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {v0}, Ltop/webcat/myapp/utils/JmDownloader$5;->run()V
    :try_end_1b
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_1b} :catch_1b

    :catch_1b
    :cond_1b
    return-void
.end method
