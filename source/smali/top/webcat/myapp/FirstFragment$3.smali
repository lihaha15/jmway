.class Ltop/webcat/myapp/FirstFragment$3;
.super Lcom/tencent/smtt/sdk/WebChromeClient;
.source "FirstFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltop/webcat/myapp/FirstFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private lastProgress:I

.field private perfDone:Z

.field final synthetic this$0:Ltop/webcat/myapp/FirstFragment;


# direct methods
.method constructor <init>(Ltop/webcat/myapp/FirstFragment;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 207
    iput-object p1, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    invoke-direct {p0}, Lcom/tencent/smtt/sdk/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onHideCustomView()V
    .registers 4

    .line 211
    iget-object v0, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    # getter for: Ltop/webcat/myapp/FirstFragment;->customView:Landroid/view/View;
    invoke-static {v0}, Ltop/webcat/myapp/FirstFragment;->access$000(Ltop/webcat/myapp/FirstFragment;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_9

    return-void

    .line 215
    :cond_9
    iget-object v0, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    # getter for: Ltop/webcat/myapp/FirstFragment;->fullVideo:Landroid/widget/FrameLayout;
    invoke-static {v0}, Ltop/webcat/myapp/FirstFragment;->access$100(Ltop/webcat/myapp/FirstFragment;)Landroid/widget/FrameLayout;

    move-result-object v0

    iget-object v1, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    # getter for: Ltop/webcat/myapp/FirstFragment;->customView:Landroid/view/View;
    invoke-static {v1}, Ltop/webcat/myapp/FirstFragment;->access$000(Ltop/webcat/myapp/FirstFragment;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 216
    iget-object v0, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    # getter for: Ltop/webcat/myapp/FirstFragment;->fullVideo:Landroid/widget/FrameLayout;
    invoke-static {v0}, Ltop/webcat/myapp/FirstFragment;->access$100(Ltop/webcat/myapp/FirstFragment;)Landroid/widget/FrameLayout;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 217
    sget-object v0, Ltop/webcat/myapp/FirstFragment;->appConfigData:Lcom/alibaba/fastjson/JSONObject;

    const-string v1, "\u6a2a\u5c4f"

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONObject;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_3b

    .line 218
    iget-object v0, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    invoke-virtual {v0}, Ltop/webcat/myapp/FirstFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->setRequestedOrientation(I)V

    .line 220
    :cond_3b
    sget-object v0, Ltop/webcat/myapp/FirstFragment;->appConfigData:Lcom/alibaba/fastjson/JSONObject;

    const-string v1, "\u542f\u7528\u9876\u680f"

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONObject;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_4f

    .line 221
    sget-object v0, Ltop/webcat/myapp/FirstFragment;->toolbar:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/Toolbar;->setVisibility(I)V

    .line 223
    :cond_4f
    iget-object v0, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    invoke-virtual {v0}, Ltop/webcat/myapp/FirstFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v2, 0x400

    invoke-virtual {v0, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 224
    sput-boolean v1, Ltop/webcat/myapp/FirstFragment;->isAutoVideo:Z

    const-string v0, "video"

    const-string v1, "onHideCustomView: \u9000\u51fa\u5168\u5c4f"

    .line 225
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onJsAlert(Lcom/tencent/smtt/sdk/WebView;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/smtt/export/external/interfaces/JsResult;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x10
        }
        names = {
            "view",
            "url",
            "message",
            "result"
        }
    .end annotation

    .line 253
    new-instance p1, Landroidx/appcompat/app/AlertDialog$Builder;

    iget-object p2, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    invoke-virtual {p2}, Ltop/webcat/myapp/FirstFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string p2, "\u63d0\u793a"

    .line 254
    invoke-virtual {p1, p2}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 255
    invoke-virtual {p1, p3}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 256
    new-instance p2, Ltop/webcat/myapp/FirstFragment$3$1;

    invoke-direct {p2, p0, p4}, Ltop/webcat/myapp/FirstFragment$3$1;-><init>(Ltop/webcat/myapp/FirstFragment$3;Lcom/tencent/smtt/export/external/interfaces/JsResult;)V

    const p3, 0x104000a

    invoke-virtual {p1, p3, p2}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    const/4 p2, 0x0

    .line 262
    invoke-virtual {p1, p2}, Landroidx/appcompat/app/AlertDialog$Builder;->setCancelable(Z)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 263
    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog;->show()V

    const/4 p1, 0x1

    return p1
.end method

.method public onProgressChanged(Lcom/tencent/smtt/sdk/WebView;I)V
    .registers 6

    iget v0, p0, Ltop/webcat/myapp/FirstFragment$3;->lastProgress:I

    if-ge p2, v0, :cond_7

    const/4 v0, 0x0

    iput-boolean v0, p0, Ltop/webcat/myapp/FirstFragment$3;->perfDone:Z

    :cond_7
    iput p2, p0, Ltop/webcat/myapp/FirstFragment$3;->lastProgress:I

    iget-boolean v0, p0, Ltop/webcat/myapp/FirstFragment$3;->perfDone:Z

    if-nez v0, :cond_21

    const/4 v0, 0x1

    if-lt p2, v0, :cond_21

    const/4 v0, 0x1

    iput-boolean v0, p0, Ltop/webcat/myapp/FirstFragment$3;->perfDone:Z

    :try_start_13
    iget-object v0, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    const-string v1, "webcat/perf.js"

    invoke-virtual {v0, v1}, Ltop/webcat/myapp/FirstFragment;->getFromAssets(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/tencent/smtt/sdk/WebView;->evaluateJavascript(Ljava/lang/String;Lcom/tencent/smtt/sdk/ValueCallback;)V
    :try_end_1f
    .catch Ljava/lang/Throwable; {:try_start_13 .. :try_end_1f} :catch_20

    goto :goto_21

    :catch_20
    move-exception v0

    :cond_21
    :goto_21
    invoke-super {p0, p1, p2}, Lcom/tencent/smtt/sdk/WebChromeClient;->onProgressChanged(Lcom/tencent/smtt/sdk/WebView;I)V

    return-void
.end method

.method public onReceivedTitle(Lcom/tencent/smtt/sdk/WebView;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "view",
            "title"
        }
    .end annotation

    .line 248
    invoke-static {}, Ltop/webcat/myapp/FirstFragment;->getWebTitle()V

    return-void
.end method

.method public onShowCustomView(Landroid/view/View;Lcom/tencent/smtt/export/external/interfaces/IX5WebChromeClient$CustomViewCallback;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "view",
            "callback"
        }
    .end annotation

    .line 231
    iget-object p2, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    # setter for: Ltop/webcat/myapp/FirstFragment;->customView:Landroid/view/View;
    invoke-static {p2, p1}, Ltop/webcat/myapp/FirstFragment;->access$002(Ltop/webcat/myapp/FirstFragment;Landroid/view/View;)Landroid/view/View;

    .line 232
    iget-object p1, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    # getter for: Ltop/webcat/myapp/FirstFragment;->fullVideo:Landroid/widget/FrameLayout;
    invoke-static {p1}, Ltop/webcat/myapp/FirstFragment;->access$100(Ltop/webcat/myapp/FirstFragment;)Landroid/widget/FrameLayout;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 233
    iget-object p1, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    # getter for: Ltop/webcat/myapp/FirstFragment;->fullVideo:Landroid/widget/FrameLayout;
    invoke-static {p1}, Ltop/webcat/myapp/FirstFragment;->access$100(Ltop/webcat/myapp/FirstFragment;)Landroid/widget/FrameLayout;

    move-result-object p1

    iget-object v0, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    # getter for: Ltop/webcat/myapp/FirstFragment;->customView:Landroid/view/View;
    invoke-static {v0}, Ltop/webcat/myapp/FirstFragment;->access$000(Ltop/webcat/myapp/FirstFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 234
    iget-object p1, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    # getter for: Ltop/webcat/myapp/FirstFragment;->fullVideo:Landroid/widget/FrameLayout;
    invoke-static {p1}, Ltop/webcat/myapp/FirstFragment;->access$100(Ltop/webcat/myapp/FirstFragment;)Landroid/widget/FrameLayout;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->bringToFront()V

    .line 235
    sget-object p1, Ltop/webcat/myapp/FirstFragment;->appConfigData:Lcom/alibaba/fastjson/JSONObject;

    const-string v0, "\u6a2a\u5c4f"

    invoke-virtual {p1, v0}, Lcom/alibaba/fastjson/JSONObject;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_3e

    .line 236
    iget-object p1, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    invoke-virtual {p1}, Ltop/webcat/myapp/FirstFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroidx/fragment/app/FragmentActivity;->setRequestedOrientation(I)V

    .line 238
    :cond_3e
    sget-object p1, Ltop/webcat/myapp/FirstFragment;->appConfigData:Lcom/alibaba/fastjson/JSONObject;

    const-string p2, "\u542f\u7528\u9876\u680f"

    invoke-virtual {p1, p2}, Lcom/alibaba/fastjson/JSONObject;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_53

    .line 239
    sget-object p1, Ltop/webcat/myapp/FirstFragment;->toolbar:Landroidx/appcompat/widget/Toolbar;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/Toolbar;->setVisibility(I)V

    .line 241
    :cond_53
    iget-object p1, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    invoke-virtual {p1}, Ltop/webcat/myapp/FirstFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 p2, 0x400

    invoke-virtual {p1, p2, p2}, Landroid/view/Window;->setFlags(II)V

    const/4 p1, 0x1

    .line 242
    sput-boolean p1, Ltop/webcat/myapp/FirstFragment;->isAutoVideo:Z

    const-string p1, "video"

    const-string p2, "onShowCustomView: \u8fdb\u5165\u5168\u5c4f"

    .line 243
    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onShowFileChooser(Lcom/tencent/smtt/sdk/WebView;Lcom/tencent/smtt/sdk/ValueCallback;Lcom/tencent/smtt/sdk/WebChromeClient$FileChooserParams;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "mWebView",
            "filePathCallback",
            "fileChooserParams"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tencent/smtt/sdk/WebView;",
            "Lcom/tencent/smtt/sdk/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;",
            "Lcom/tencent/smtt/sdk/WebChromeClient$FileChooserParams;",
            ")Z"
        }
    .end annotation

    .line 283
    iget-object p1, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    iget-object p1, p1, Ltop/webcat/myapp/FirstFragment;->uploadMessage:Lcom/tencent/smtt/sdk/ValueCallback;

    const/4 v0, 0x0

    if-eqz p1, :cond_12

    .line 284
    iget-object p1, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    iget-object p1, p1, Ltop/webcat/myapp/FirstFragment;->uploadMessage:Lcom/tencent/smtt/sdk/ValueCallback;

    invoke-interface {p1, v0}, Lcom/tencent/smtt/sdk/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 285
    iget-object p1, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    iput-object v0, p1, Ltop/webcat/myapp/FirstFragment;->uploadMessage:Lcom/tencent/smtt/sdk/ValueCallback;

    .line 288
    :cond_12
    iget-object p1, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    iput-object p2, p1, Ltop/webcat/myapp/FirstFragment;->uploadMessage:Lcom/tencent/smtt/sdk/ValueCallback;

    .line 290
    invoke-virtual {p3}, Lcom/tencent/smtt/sdk/WebChromeClient$FileChooserParams;->createIntent()Landroid/content/Intent;

    move-result-object p1

    .line 293
    :try_start_1a
    iget-object p2, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    const/16 p3, 0x64

    invoke-virtual {p2, p1, p3}, Ltop/webcat/myapp/FirstFragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_21
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1a .. :try_end_21} :catch_23

    const/4 p1, 0x1

    return p1

    .line 296
    :catch_23
    iget-object p1, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    iput-object v0, p1, Ltop/webcat/myapp/FirstFragment;->uploadMessage:Lcom/tencent/smtt/sdk/ValueCallback;

    const/4 p1, 0x0

    return p1
.end method

.method protected openFileChooser(Lcom/tencent/smtt/sdk/ValueCallback;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "uploadMsg"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tencent/smtt/sdk/ValueCallback<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .line 315
    iget-object v0, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    # setter for: Ltop/webcat/myapp/FirstFragment;->mUploadMessage:Lcom/tencent/smtt/sdk/ValueCallback;
    invoke-static {v0, p1}, Ltop/webcat/myapp/FirstFragment;->access$202(Ltop/webcat/myapp/FirstFragment;Lcom/tencent/smtt/sdk/ValueCallback;)Lcom/tencent/smtt/sdk/ValueCallback;

    .line 316
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.GET_CONTENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "android.intent.category.OPENABLE"

    .line 317
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "image/*"

    .line 318
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 319
    iget-object v0, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    const-string v1, "File Chooser"

    invoke-static {p1, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p1

    const/4 v1, 0x2

    invoke-virtual {v0, p1, v1}, Ltop/webcat/myapp/FirstFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method protected openFileChooser(Lcom/tencent/smtt/sdk/ValueCallback;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "uploadMsg",
            "acceptType"
        }
    .end annotation

    .line 271
    iget-object p2, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    # setter for: Ltop/webcat/myapp/FirstFragment;->mUploadMessage:Lcom/tencent/smtt/sdk/ValueCallback;
    invoke-static {p2, p1}, Ltop/webcat/myapp/FirstFragment;->access$202(Ltop/webcat/myapp/FirstFragment;Lcom/tencent/smtt/sdk/ValueCallback;)Lcom/tencent/smtt/sdk/ValueCallback;

    .line 272
    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.intent.action.GET_CONTENT"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p2, "android.intent.category.OPENABLE"

    .line 273
    invoke-virtual {p1, p2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "image/*"

    .line 274
    invoke-virtual {p1, p2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 275
    iget-object p2, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    const-string v0, "File Browser"

    invoke-static {p1, v0}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p1

    const/4 v0, 0x2

    invoke-virtual {p2, p1, v0}, Ltop/webcat/myapp/FirstFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public openFileChooser(Lcom/tencent/smtt/sdk/ValueCallback;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "uploadMsg",
            "acceptType",
            "capture"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tencent/smtt/sdk/ValueCallback<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 306
    iget-object p2, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    # setter for: Ltop/webcat/myapp/FirstFragment;->mUploadMessage:Lcom/tencent/smtt/sdk/ValueCallback;
    invoke-static {p2, p1}, Ltop/webcat/myapp/FirstFragment;->access$202(Ltop/webcat/myapp/FirstFragment;Lcom/tencent/smtt/sdk/ValueCallback;)Lcom/tencent/smtt/sdk/ValueCallback;

    .line 307
    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.intent.action.GET_CONTENT"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p2, "android.intent.category.OPENABLE"

    .line 308
    invoke-virtual {p1, p2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "image/*"

    .line 309
    invoke-virtual {p1, p2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 310
    iget-object p2, p0, Ltop/webcat/myapp/FirstFragment$3;->this$0:Ltop/webcat/myapp/FirstFragment;

    const-string p3, "File Browser"

    invoke-static {p1, p3}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p1

    const/4 p3, 0x2

    invoke-virtual {p2, p1, p3}, Ltop/webcat/myapp/FirstFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
