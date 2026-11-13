.class public final Ltop/webcat/myapp/utils/JmZipPacker;
.super Ljava/lang/Object;
.source "JmZipPacker.java"


# static fields
.field private static final BUF_SIZE:I = 0x8000


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    return-void
.end method

.method public static deleteTree(Ljava/lang/String;)Z
    .registers 2

    .line 97
    if-nez p0, :cond_4

    const/4 p0, 0x0

    return p0

    .line 98
    :cond_4
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ltop/webcat/myapp/utils/JmZipPacker;->rm(Ljava/io/File;)Z

    move-result p0

    return p0
.end method

.method public static pack(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 12

    .line 27
    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 28
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result p0

    if-nez p0, :cond_d

    return-object v0

    .line 29
    :cond_d
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    .line 30
    if-eqz p0, :cond_d7

    array-length v1, p0

    if-nez v1, :cond_18

    goto/16 :goto_d7

    .line 32
    :cond_18
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 33
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    .line 34
    if-eqz v2, :cond_2c

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_2c

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 36
    :cond_2c
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v3, ".tmp"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_44
    .catchall {:try_start_1 .. :try_end_44} :catchall_d8

    .line 37
    nop

    .line 38
    nop

    .line 40
    :try_start_46
    new-instance p1, Ljava/util/zip/ZipOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {p1, v3}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_50
    .catchall {:try_start_46 .. :try_end_50} :catchall_ca

    .line 42
    const/4 v3, 0x1

    :try_start_51
    invoke-virtual {p1, v3}, Ljava/util/zip/ZipOutputStream;->setLevel(I)V

    .line 44
    const v3, 0x8000

    new-array v3, v3, [B

    .line 45
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_5c
    array-length v7, p0

    if-ge v5, v7, :cond_a1

    .line 46
    aget-object v7, p0, v5

    .line 47
    if-eqz v7, :cond_9e

    invoke-virtual {v7}, Ljava/io/File;->isFile()Z

    move-result v8
    :try_end_67
    .catchall {:try_start_51 .. :try_end_67} :catchall_c8

    if-nez v8, :cond_6a

    goto :goto_9e

    .line 48
    :cond_6a
    nop

    .line 50
    :try_start_6b
    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, v7}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_70
    .catchall {:try_start_6b .. :try_end_70} :catchall_94

    .line 51
    :try_start_70
    new-instance v9, Ljava/util/zip/ZipEntry;

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v9, v7}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v9}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 53
    :goto_7c
    invoke-virtual {v8, v3}, Ljava/io/FileInputStream;->read([B)I

    move-result v7

    if-lez v7, :cond_86

    .line 54
    invoke-virtual {p1, v3, v4, v7}, Ljava/util/zip/ZipOutputStream;->write([BII)V

    goto :goto_7c

    .line 56
    :cond_86
    invoke-virtual {p1}, Ljava/util/zip/ZipOutputStream;->closeEntry()V
    :try_end_89
    .catchall {:try_start_70 .. :try_end_89} :catchall_92

    .line 57
    add-int/lit8 v6, v6, 0x1

    .line 59
    nop

    .line 61
    :try_start_8c
    invoke-virtual {v8}, Ljava/io/FileInputStream;->close()V
    :try_end_8f
    .catch Ljava/lang/Exception; {:try_start_8c .. :try_end_8f} :catch_90
    .catchall {:try_start_8c .. :try_end_8f} :catchall_c8

    .line 63
    :goto_8f
    goto :goto_9e

    .line 62
    :catch_90
    move-exception v7

    goto :goto_8f

    .line 59
    :catchall_92
    move-exception p0

    goto :goto_96

    :catchall_94
    move-exception p0

    move-object v8, v0

    :goto_96
    if-eqz v8, :cond_9d

    .line 61
    :try_start_98
    invoke-virtual {v8}, Ljava/io/FileInputStream;->close()V
    :try_end_9b
    .catch Ljava/lang/Exception; {:try_start_98 .. :try_end_9b} :catch_9c
    .catchall {:try_start_98 .. :try_end_9b} :catchall_c8

    .line 63
    goto :goto_9d

    .line 62
    :catch_9c
    move-exception v1

    .line 65
    :cond_9d
    :goto_9d
    :try_start_9d
    throw p0

    .line 45
    :cond_9e
    :goto_9e
    add-int/lit8 v5, v5, 0x1

    goto :goto_5c

    .line 67
    :cond_a1
    invoke-virtual {p1}, Ljava/util/zip/ZipOutputStream;->finish()V

    .line 68
    invoke-virtual {p1}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_a7
    .catchall {:try_start_9d .. :try_end_a7} :catchall_c8

    .line 69
    nop

    .line 79
    nop

    .line 81
    if-nez v6, :cond_af

    .line 82
    :try_start_ab
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 83
    return-object v0

    .line 85
    :cond_af
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_b8

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 86
    :cond_b8
    invoke-virtual {v2, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p0

    if-nez p0, :cond_c3

    .line 87
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 89
    :cond_c3
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0
    :try_end_c7
    .catchall {:try_start_ab .. :try_end_c7} :catchall_d8

    return-object p0

    .line 70
    :catchall_c8
    move-exception p0

    goto :goto_cc

    :catchall_ca
    move-exception p0

    move-object p1, v0

    .line 71
    :goto_cc
    if-eqz p1, :cond_d3

    .line 73
    :try_start_ce
    invoke-virtual {p1}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_d1
    .catchall {:try_start_ce .. :try_end_d1} :catchall_d2

    .line 75
    goto :goto_d3

    .line 74
    :catchall_d2
    move-exception p0

    .line 77
    :cond_d3
    :goto_d3
    :try_start_d3
    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    :try_end_d6
    .catchall {:try_start_d3 .. :try_end_d6} :catchall_d8

    .line 78
    return-object v0

    .line 30
    :cond_d7
    :goto_d7
    return-object v0

    .line 90
    :catchall_d8
    move-exception p0

    .line 91
    return-object v0
.end method

.method private static rm(Ljava/io/File;)Z
    .registers 5

    .line 102
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    .line 103
    :cond_4
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 104
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 105
    if-eqz v1, :cond_1c

    .line 106
    const/4 v2, 0x0

    :goto_11
    array-length v3, v1

    if-ge v2, v3, :cond_1c

    aget-object v3, v1, v2

    invoke-static {v3}, Ltop/webcat/myapp/utils/JmZipPacker;->rm(Ljava/io/File;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 110
    :cond_1c
    :try_start_1c
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p0
    :try_end_20
    .catchall {:try_start_1c .. :try_end_20} :catchall_21

    return p0

    .line 111
    :catchall_21
    move-exception p0

    .line 112
    return v0
.end method
