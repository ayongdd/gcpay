import 'dart:developer';
import 'dart:io';
import 'dart:async';

import 'package:GCPay/utils/log_utils.dart';
import 'package:app_links/app_links.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:GCPay/http/apiservice/haxi_api.dart';
import 'package:GCPay/routes/app_routes.dart';
import 'package:GCPay/routes/app_pages.dart';
import 'package:GCPay/services/auth_api_service.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:GCPay/services/lang/localization_service.dart';
import 'package:GCPay/services/lang/storage_prefs.dart';
import 'package:GCPay/utils/theme_page.dart';
import 'package:openinstall_flutter_plugin/openinstall_flutter_plugin.dart';
import 'package:platform_device_id/platform_device_id.dart';

import 'bindings/app_binding.dart';
import 'controllers/auth_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:GCPay/business/main_page.dart';
import 'package:GCPay/utils/injection.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base/pageWidget/common_stateful_widget.dart';
import 'http/apiservice/gcpay_api.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

Locale? _currentLocale;
List? _languages = [];

Future<void> main() async {
  await initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final JPush jpush = JPush();
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;
  String wakeUpLog = "";
  String installLog = "";
  OpeninstallFlutterPlugin _openinstallFlutterPlugin = OpeninstallFlutterPlugin();
  Timer? jiguangTimer;
  int intJpushRegister = 0;

  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    jiguangTimer?.cancel();
    jiguangTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      footerTriggerDistance: 15,
      dragSpeedRatio: 0.91,
      headerBuilder: () => const MaterialClassicHeader(),
      footerBuilder: () => const ClassicFooter(),
      enableLoadingWhenNoData: false,
      enableRefreshVibrate: false,
      enableLoadMoreVibrate: false,
      shouldFooterFollowWhenNotFull: (state) {
        // If you want load more with noMoreData state ,may be you should return false
        return false;
      },
      child: Listener(
        onPointerUp: (_) {
          if (Platform.isIOS) {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          }
        },
        child: ScreenUtilInit(
            designSize: const Size(750, 1334),
            builder: (BuildContext context, child) => GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'GCPay',
                  navigatorObservers: [FlutterSmartDialog.observer],
                  builder: FlutterSmartDialog.init(),
                  //theme: ThemeModel.light,
                  //darkTheme: ThemeModel.dark,
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

                  translations:
                      LocalizationService(), //Internationalization language pack
                  locale: _currentLocale,
                localizationsDelegates:[
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  const Locale('zh', 'CN'),
                ],
                  fallbackLocale: Locale('zh', 'CH'),
                  localeListResolutionCallback: (locales, supportedLocales) {
                    print('当前系统语言环境:$locales');
                    LocalizationService().getCurrentLocale();
                    return;
                  },
                  initialRoute: AppRoutes.StartScreenPage,
                  initialBinding: AppBinding(),
                  getPages: AppPages.pages,
                )),
      ),
    );
  }

  Future<void> _initPlatformState() async {
    _getCurrentLocale();
    initJiGuangTimer();
    initDeepLinks();
    initOpenInstall();
  }

  void initJiGuangTimer() {
    jiguangTimer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      CacheService cacheService = Get.find<CacheService>();
      String strAlias = cacheService.loadPushAlias()!;
      if (strAlias.length > 0) {
        jiguangTimer?.cancel();
        jiguangTimer = null;
      }
      else if(intJpushRegister == 0)
        {
          intJpushRegister = 1;
          _initJiGuang();
        }
    });
  }

  Future<void> _initJiGuang() async {
    try {
      String strChannleName = '';
      if (Platform.isIOS) {
        strChannleName = "IOS";
      } else if (Platform.isAndroid) {
        strChannleName = "Android";
      }

      jpush.setAuth(enable: true);
      jpush.setup(
        appKey: "384898a07383cbfe85021dd2", //你自己应用的 AppKey
        channel: strChannleName,
        production: true,
        debug: false,
      );
      jpush.applyPushAuthority(
          new NotificationSettingsIOS(sound: true, alert: true, badge: true));

      // Platform messages may fail, so we use a try/catch PlatformException.
      var jpushregister = await jpush.getRegistrationID().then((rid) async {
        print("flutter get registration id : $rid");
        String? deviceId = await PlatformDeviceId.getDeviceId;
        print("Jiguang alias deviceid:" + deviceId!);
        var setalias = await jpush.setAlias(rid);
        String strAlias = setalias['alias'];
        print("Jiguang setalias" + strAlias);

        CacheService cacheService = Get.find<CacheService>();
        cacheService.savePushAlias(strAlias);
        print("Jiguang setalias savePushAlias success" + strAlias);
        var getalias = await jpush.getAlias();
        print("Jiguang getalias :" + getalias['alias']);
      });
      intJpushRegister = 0;
      print("Jiguang Register complete");
    } on PlatformException {
      print("Error obtaining current locale");
      intJpushRegister = 0;
      print("Jiguang Register complete");
    }
  }

  Future<Object> installHandler(Map<String, Object> data) async {
    print("installHandler : " + data.toString());
    setState(() {
      installLog = "install result : channel=" + data['channelCode'].toString()
          + ", data=" + data['bindData'].toString() + "\n";
    });
    return "";
  }

  Future<Object> wakeupHandler(Map<String, Object> data) async {
    print("wakeupHandler : " + data.toString());
    setState(() {
      wakeUpLog = "wakeup result : channel=" + data['channelCode'].toString()
          + ", data=" + data['bindData'].toString() + "\n";
    });
    return "";
  }

  Future<void> initOpenInstall() async {
    _openinstallFlutterPlugin.init(wakeupHandler);
    _openinstallFlutterPlugin.install(installHandler);
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();

    // Check initial link if app was in cold state (terminated)
    final appLink = await _appLinks.getInitialAppLink();
    if (appLink != null) {
      print('getInitialAppLink: $appLink');
      openCoolDownAppLink(appLink);
    }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      print('onAppLink: $uri');
      openAppLink(uri);
    });
  }

  void openCoolDownAppLink(Uri uri) {
    CacheService cacheService = Get.find<CacheService>();
    if(cacheService.token == null || cacheService.token!.length<=0)
      {
        //Fluttertoast.showToast(msg: 'pleaseloginfirstly'.tr,gravity: ToastGravity.CENTER);
        return;
      }
    String strUrl = uri.toString();
    LogE('openAppLink===: ${strUrl}');
      if(strUrl.contains('orderpay'))
      {
        String stringOrderId = '';
        if(strUrl.contains('orderid'))
        {
          int intIdIndex = strUrl.indexOf('=');
          {
            stringOrderId = strUrl.substring(intIdIndex+1,strUrl.length);
          }
        }
        LogE('openAppLink===: ${stringOrderId}');
        cacheService.saveCoolDownOrderPayId(stringOrderId);
        if (Platform.isIOS) {
          //Get.toNamed(AppRoutes.OrderPayPage,parameters: {'id':stringOrderId});
        }

      }

  }

  void openAppLink(Uri uri) {
    CacheService cacheService = Get.find<CacheService>();
    if(cacheService.token == null || cacheService.token!.length<=0)
    {
      //Fluttertoast.showToast(msg: 'pleaseloginfirstly'.tr,gravity: ToastGravity.CENTER);
      return;
    }
    String strUrl = uri.toString();
    LogE('openAppLink===: ${strUrl}');
    if(strUrl.contains('orderpay'))
    {
      String stringOrderId = '';
      if(strUrl.contains('orderid'))
      {
        int intIdIndex = strUrl.indexOf('=');
        {
          stringOrderId = strUrl.substring(intIdIndex+1,strUrl.length);
        }
      }
      LogE('openAppLink===: ${stringOrderId}');
      cacheService.saveOrderPayId(stringOrderId);
      if (Platform.isIOS) {
        Get.toNamed(AppRoutes.OrderPayPage,parameters: {'id':stringOrderId});
      }
    }

  }

}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection().init();

  final prefs = StoragePrefs();
  await prefs.initPrefs();

  await GetStorage.init();

  Get.put(
      AuthController(Get.put(AuthApiService()), Get.put(CacheService()),
          Get.put(GCPayApi())),
      permanent: true);

  await _getCurrentLocale();
  log('Initialize');
}

Future<void> _getCurrentLocale() async {
  try {
    final currentLocale = await LocalizationService().getCurrentLocale();
    print((currentLocale != null)
        ? currentLocale
        : "Unable to get currentLocale");
    _currentLocale = currentLocale;
  } on PlatformException {
    print("Error obtaining current locale");
  }
}
