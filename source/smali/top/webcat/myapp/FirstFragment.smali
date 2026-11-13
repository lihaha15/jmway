.class public Ltop/webcat/myapp/FirstFragment;
.super Landroidx/fragment/app/Fragment;
.source "FirstFragment.java"


# static fields
.field private static final FILECHOOSER_RESULTCODE:I = 0x2

.field public static final REQUEST_SELECT_FILE:I = 0x64

.field public static appConfigData:Lcom/alibaba/fastjson/JSONObject;

.field public static indexPages:Ljava/util/List;

.field public static isAutoVideo:Z

.field public static toolbar:Landroidx/appcompat/widget/Toolbar;

.field private static vconsoleJs:Ljava/lang/String;

.field public static webView:Lcom/tencent/smtt/sdk/WebView;


# instance fields
.field private binding:Ltop/webcat/myapp/databinding/FragmentFirstBinding;

.field private customView:Landroid/view/View;

.field private fullVideo:Landroid/widget/FrameLayout;

.field private mUploadMessage:Lcom/tencent/smtt/sdk/ValueCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tencent/smtt/sdk/ValueCallback<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field public uploadMessage:Lcom/tencent/smtt/sdk/ValueCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tencent/smtt/sdk/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Ltop/webcat/myapp/FirstFragment;->customView:Landroid/view/View;

    return-void
.end method

.method static synthetic access$000(Ltop/webcat/myapp/FirstFragment;)Landroid/view/View;
    .registers 1

    iget-object p0, p0, Ltop/webcat/myapp/FirstFragment;->customView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$002(Ltop/webcat/myapp/FirstFragment;Landroid/view/View;)Landroid/view/View;
    .registers 2

    iput-object p1, p0, Ltop/webcat/myapp/FirstFragment;->customView:Landroid/view/View;

    return-object p1
.end method

.method static synthetic access$100(Ltop/webcat/myapp/FirstFragment;)Landroid/widget/FrameLayout;
    .registers 1

    iget-object p0, p0, Ltop/webcat/myapp/FirstFragment;->fullVideo:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method static synthetic access$202(Ltop/webcat/myapp/FirstFragment;Lcom/tencent/smtt/sdk/ValueCallback;)Lcom/tencent/smtt/sdk/ValueCallback;
    .registers 2

    iput-object p1, p0, Ltop/webcat/myapp/FirstFragment;->mUploadMessage:Lcom/tencent/smtt/sdk/ValueCallback;

    return-object p1
.end method

.method static synthetic access$300()Lcom/tencent/smtt/sdk/WebView;
    .registers 1

    sget-object v0, Ltop/webcat/myapp/FirstFragment;->webView:Lcom/tencent/smtt/sdk/WebView;

    return-object v0
.end method

.method public static getWebTitle()V
    .registers 3

    sget-object v0, Ltop/webcat/myapp/FirstFragment;->webView:Lcom/tencent/smtt/sdk/WebView;

    invoke-virtual {v0}, Lcom/tencent/smtt/sdk/WebView;->copyBackForwardList()Lcom/tencent/smtt/sdk/WebBackForwardList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tencent/smtt/sdk/WebBackForwardList;->getCurrentItem()Lcom/tencent/smtt/sdk/WebHistoryItem;

    move-result-object v0

    if-eqz v0, :cond_22

    invoke-virtual {v0}, Lcom/tencent/smtt/sdk/WebHistoryItem;->getTitle()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    sget-object v1, Ltop/webcat/myapp/FirstFragment;->toolbar:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Lcom/tencent/smtt/sdk/WebHistoryItem;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_2f

    :cond_22
    sget-object v0, Ltop/webcat/myapp/FirstFragment;->toolbar:Landroidx/appcompat/widget/Toolbar;

    sget-object v1, Ltop/webcat/myapp/FirstFragment;->appConfigData:Lcom/alibaba/fastjson/JSONObject;

    const-string v2, "\u9876\u680f\u6807\u9898"

    invoke-virtual {v1, v2}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    :goto_2f
    return-void
.end method


# virtual methods
.method public getFromAssets(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "fileName"
        }
    .end annotation

    :try_start_0
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Ltop/webcat/myapp/FirstFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    new-instance p1, Ljava/io/BufferedReader;

    invoke-direct {p1, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    const-string v0, ""

    :goto_18
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_33

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_32} :catch_34

    goto :goto_18

    :cond_33
    return-object v0

    :catch_34
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const/4 p1, 0x0

    return-object p1
.end method

.method public getVconsoleJs()Ljava/lang/String;
    .registers 2

    sget-object v0, Ltop/webcat/myapp/FirstFragment;->vconsoleJs:Ljava/lang/String;

    if-nez v0, :cond_c

    const-string v0, "webcat/vconsole.min.js"

    invoke-virtual {p0, v0}, Ltop/webcat/myapp/FirstFragment;->getFromAssets(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Ltop/webcat/myapp/FirstFragment;->vconsoleJs:Ljava/lang/String;

    :cond_c
    sget-object v0, Ltop/webcat/myapp/FirstFragment;->vconsoleJs:Ljava/lang/String;

    return-object v0
.end method

.method public synthetic lambda$nonSyncGet$0$FirstFragment(Lokhttp3/OkHttpClient;Lokhttp3/Request;)V
    .registers 4

    :try_start_0
    invoke-virtual {p1, p2}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object p1

    invoke-interface {p1}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-lez p2, :cond_20

    sget-object p2, Ltop/webcat/myapp/FirstFragment;->webView:Lcom/tencent/smtt/sdk/WebView;

    new-instance v0, Ltop/webcat/myapp/FirstFragment$4;

    invoke-direct {v0, p0, p1}, Ltop/webcat/myapp/FirstFragment$4;-><init>(Ltop/webcat/myapp/FirstFragment;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Lcom/tencent/smtt/sdk/WebView;->post(Ljava/lang/Runnable;)Z
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_20} :catch_20

    :catch_20
    :cond_20
    return-void
.end method

.method public nonSyncGet(Ljava/lang/String;)V
    .registers 2

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "requestCode",
            "resultCode",
            "intent"
        }
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x15

    if-lt v0, v2, :cond_1a

    const/16 v0, 0x64

    if-ne p1, v0, :cond_35

    iget-object p1, p0, Ltop/webcat/myapp/FirstFragment;->uploadMessage:Lcom/tencent/smtt/sdk/ValueCallback;

    if-nez p1, :cond_10

    return-void

    :cond_10
    invoke-static {p2, p3}, Lcom/tencent/smtt/sdk/WebChromeClient$FileChooserParams;->parseResult(ILandroid/content/Intent;)[Landroid/net/Uri;

    move-result-object p2

    invoke-interface {p1, p2}, Lcom/tencent/smtt/sdk/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    iput-object v1, p0, Ltop/webcat/myapp/FirstFragment;->uploadMessage:Lcom/tencent/smtt/sdk/ValueCallback;

    goto :goto_35

    :cond_1a
    const/4 v0, 0x2

    if-ne p1, v0, :cond_35

    iget-object p1, p0, Ltop/webcat/myapp/FirstFragment;->mUploadMessage:Lcom/tencent/smtt/sdk/ValueCallback;

    if-nez p1, :cond_22

    return-void

    :cond_22
    if-eqz p3, :cond_2d

    const/4 p1, -0x1

    if-eq p2, p1, :cond_28

    goto :goto_2d

    :cond_28
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    goto :goto_2e

    :cond_2d
    :goto_2d
    move-object p1, v1

    :goto_2e
    iget-object p2, p0, Ltop/webcat/myapp/FirstFragment;->mUploadMessage:Lcom/tencent/smtt/sdk/ValueCallback;

    invoke-interface {p2, p1}, Lcom/tencent/smtt/sdk/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    iput-object v1, p0, Ltop/webcat/myapp/FirstFragment;->mUploadMessage:Lcom/tencent/smtt/sdk/ValueCallback;

    :cond_35
    :goto_35
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "inflater",
            "container",
            "savedInstanceState"
        }
    .end annotation

    const/4 p3, 0x0

    invoke-static {p1, p2, p3}, Ltop/webcat/myapp/databinding/FragmentFirstBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Ltop/webcat/myapp/databinding/FragmentFirstBinding;

    move-result-object p1

    iput-object p1, p0, Ltop/webcat/myapp/FirstFragment;->binding:Ltop/webcat/myapp/databinding/FragmentFirstBinding;

    invoke-virtual {p1}, Ltop/webcat/myapp/databinding/FragmentFirstBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object p1

    return-object p1
.end method

.method public onDestroyView()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Ltop/webcat/myapp/FirstFragment;->binding:Ltop/webcat/myapp/databinding/FragmentFirstBinding;

    sget-object v0, Ltop/webcat/myapp/FirstFragment;->webView:Lcom/tencent/smtt/sdk/WebView;

    if-eqz v0, :cond_d

    invoke-virtual {v0}, Lcom/tencent/smtt/sdk/WebView;->destroy()V

    :cond_d
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "view",
            "savedInstanceState"
        }
    .end annotation

    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const-string p1, "webcat/appConfig.xlt"

    invoke-virtual {p0, p1}, Ltop/webcat/myapp/FirstFragment;->getFromAssets(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-class p2, Ljava/util/Map;

    invoke-static {p1, p2}, Lcom/alibaba/fastjson/JSONObject;->parseObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    :try_start_11
    const-string p2, "indexPages"

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    sput-object p2, Ltop/webcat/myapp/FirstFragment;->indexPages:Ljava/util/List;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_1b} :catch_1c

    goto :goto_23

    :catch_1c
    const-string p2, "\u52a0\u8f7d\u914d\u7f6e: "

    const-string v0, "\u672a\u914d\u7f6eindexPages"

    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_23
    const-string p2, "data"

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/alibaba/fastjson/JSONObject;

    sput-object p2, Ltop/webcat/myapp/FirstFragment;->appConfigData:Lcom/alibaba/fastjson/JSONObject;

    const-string v0, "\u6a2a\u5c4f"

    invoke-virtual {p2, v0}, Lcom/alibaba/fastjson/JSONObject;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    const/4 v0, 0x0

    if-eqz p2, :cond_41

    invoke-virtual {p0}, Ltop/webcat/myapp/FirstFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroidx/fragment/app/FragmentActivity;->setRequestedOrientation(I)V

    :cond_41
    invoke-virtual {p0}, Ltop/webcat/myapp/FirstFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    const v1, 0x7f080167

    invoke-virtual {p2, v1}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/appcompat/widget/Toolbar;

    sput-object p2, Ltop/webcat/myapp/FirstFragment;->toolbar:Landroidx/appcompat/widget/Toolbar;

    sget-object p2, Ltop/webcat/myapp/FirstFragment;->appConfigData:Lcom/alibaba/fastjson/JSONObject;

    const-string v1, "\u542f\u7528\u9876\u680f"

    invoke-virtual {p2, v1}, Lcom/alibaba/fastjson/JSONObject;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    const-string v1, "\u9876\u680f\u989c\u8272"

    if-eqz p2, :cond_70

    sget-object p2, Ltop/webcat/myapp/FirstFragment;->toolbar:Landroidx/appcompat/widget/Toolbar;

    sget-object v2, Ltop/webcat/myapp/FirstFragment;->appConfigData:Lcom/alibaba/fastjson/JSONObject;

    invoke-virtual {v2, v1}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p2, v2}, Landroidx/appcompat/widget/Toolbar;->setBackgroundColor(I)V

    goto :goto_77

    :cond_70
    sget-object p2, Ltop/webcat/myapp/FirstFragment;->toolbar:Landroidx/appcompat/widget/Toolbar;

    const/16 v2, 0x8

    invoke-virtual {p2, v2}, Landroidx/appcompat/widget/Toolbar;->setVisibility(I)V

    :goto_77
    invoke-virtual {p0}, Ltop/webcat/myapp/FirstFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/fragment/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object p2

    sget-object v2, Ltop/webcat/myapp/FirstFragment;->appConfigData:Lcom/alibaba/fastjson/JSONObject;

    const-string v3, "\u663e\u793a\u72b6\u6001\u680f"

    invoke-virtual {v2, v3}, Lcom/alibaba/fastjson/JSONObject;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_a1

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_a6

    sget-object v2, Ltop/webcat/myapp/FirstFragment;->appConfigData:Lcom/alibaba/fastjson/JSONObject;

    invoke-virtual {v2, v1}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p2, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    goto :goto_a6

    :cond_a1
    const/16 v1, 0x400

    invoke-virtual {p2, v1, v1}, Landroid/view/Window;->setFlags(II)V

    :cond_a6
    :goto_a6
    sget-object p2, Ltop/webcat/myapp/FirstFragment;->appConfigData:Lcom/alibaba/fastjson/JSONObject;

    const-string v1, "\u542f\u52a8\u9875\u9762"

    invoke-virtual {p2, v1}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iget-object v1, p0, Ltop/webcat/myapp/FirstFragment;->binding:Ltop/webcat/myapp/databinding/FragmentFirstBinding;

    iget-object v1, v1, Ltop/webcat/myapp/databinding/FragmentFirstBinding;->web:Lcom/tencent/smtt/sdk/WebView;

    sput-object v1, Ltop/webcat/myapp/FirstFragment;->webView:Lcom/tencent/smtt/sdk/WebView;

    iget-object v1, p0, Ltop/webcat/myapp/FirstFragment;->binding:Ltop/webcat/myapp/databinding/FragmentFirstBinding;

    iget-object v1, v1, Ltop/webcat/myapp/databinding/FragmentFirstBinding;->fullVideo:Landroid/widget/FrameLayout;

    iput-object v1, p0, Ltop/webcat/myapp/FirstFragment;->fullVideo:Landroid/widget/FrameLayout;

    sget-object v1, Ltop/webcat/myapp/FirstFragment;->webView:Lcom/tencent/smtt/sdk/WebView;

    new-instance v2, Ltop/webcat/myapp/FirstFragment$1;

    invoke-direct {v2, p0, p1}, Ltop/webcat/myapp/FirstFragment$1;-><init>(Ltop/webcat/myapp/FirstFragment;Ljava/util/Map;)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebView;->setWebViewClient(Lcom/tencent/smtt/sdk/WebViewClient;)V

    sget-object v1, Ltop/webcat/myapp/FirstFragment;->webView:Lcom/tencent/smtt/sdk/WebView;

    new-instance v2, Ltop/webcat/myapp/FirstFragment$2;

    invoke-direct {v2, p0}, Ltop/webcat/myapp/FirstFragment$2;-><init>(Ltop/webcat/myapp/FirstFragment;)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebView;->setDownloadListener(Lcom/tencent/smtt/sdk/DownloadListener;)V

    sget-object v1, Ltop/webcat/myapp/FirstFragment;->webView:Lcom/tencent/smtt/sdk/WebView;

    invoke-virtual {v1}, Lcom/tencent/smtt/sdk/WebView;->getSettings()Lcom/tencent/smtt/sdk/WebSettings;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setPluginsEnabled(Z)V

    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Lcom/tencent/smtt/sdk/WebSettings;->setMixedContentMode(I)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setAppCacheEnabled(Z)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setAllowFileAccess(Z)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setAllowContentAccess(Z)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setAppCacheEnabled(Z)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setDomStorageEnabled(Z)V

    const-string v3, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"

    invoke-virtual {v1, v3}, Lcom/tencent/smtt/sdk/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setDatabaseEnabled(Z)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setUseWideViewPort(Z)V

    invoke-virtual {v1, v2}, Lcom/tencent/smtt/sdk/WebSettings;->setLoadWithOverviewMode(Z)V

    invoke-virtual {v1, v0}, Lcom/tencent/smtt/sdk/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    sget-object v0, Ltop/webcat/myapp/FirstFragment;->webView:Lcom/tencent/smtt/sdk/WebView;

    new-instance v1, Ltop/webcat/myapp/FirstFragment$3;

    invoke-direct {v1, p0}, Ltop/webcat/myapp/FirstFragment$3;-><init>(Ltop/webcat/myapp/FirstFragment;)V

    invoke-virtual {v0, v1}, Lcom/tencent/smtt/sdk/WebView;->setWebChromeClient(Lcom/tencent/smtt/sdk/WebChromeClient;)V

    sget-object v0, Ltop/webcat/myapp/FirstFragment;->webView:Lcom/tencent/smtt/sdk/WebView;

    new-instance v1, Ltop/webcat/myapp/utils/MyJavascriptInterface;

    invoke-virtual {p0}, Ltop/webcat/myapp/FirstFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Ltop/webcat/myapp/FirstFragment;->webView:Lcom/tencent/smtt/sdk/WebView;

    invoke-direct {v1, v2, v3}, Ltop/webcat/myapp/utils/MyJavascriptInterface;-><init>(Landroid/content/Context;Lcom/tencent/smtt/sdk/WebView;)V

    const-string v2, "webcat"

    invoke-virtual {v0, v1, v2}, Lcom/tencent/smtt/sdk/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "http"

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-le v0, v1, :cond_133

    sget-object v0, Ltop/webcat/myapp/FirstFragment;->webView:Lcom/tencent/smtt/sdk/WebView;

    invoke-virtual {v0, p2}, Lcom/tencent/smtt/sdk/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_149

    :cond_133
    sget-object v0, Ltop/webcat/myapp/FirstFragment;->webView:Lcom/tencent/smtt/sdk/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "file:///android_asset/webcat/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/tencent/smtt/sdk/WebView;->loadUrl(Ljava/lang/String;)V

    :goto_149
    const-string p2, "appName"

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "appPackageName"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "appVersionCode"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "appVersionName"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http://webcat.top/api/myapp.php?type=getVersion&name="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "&versionCode="

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "&versionName="

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "&packageName="

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ltop/webcat/myapp/FirstFragment;->nonSyncGet(Ljava/lang/String;)V

    return-void
.end method
