import 'dart:async';
import 'dart:math' as math;
import 'package:adobe_xd/pinned.dart';
import 'package:copy_paste/copy_paste.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/custom_render.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:GCPay/base/controller/base_controller.dart';
import 'package:GCPay/base/pageWidget/base_stateless_widget.dart';
import 'package:GCPay/controllers/login_controller.dart';
import 'package:GCPay/ext/get_extension.dart';
import 'package:GCPay/res/colors.dart';
import 'package:GCPay/res/style.dart';
import 'package:GCPay/routes/app_routes.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:GCPay/services/lang/localization_service.dart';
import 'package:GCPay/utils/lib_navigator.dart';
import 'package:GCPay/utils/log_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';
import '../../controllers/auth_controller.dart';
import '../../services/auth_api_service.dart';
import '../../services/lang/storage_prefs.dart';
import '../../widget/webview_page.dart';
import '../home_page/model/Login_entity.dart';
import '../main_page.dart';

late double pinnedHeaderHeight;

class MinePage extends BaseStatefulWidget<MineController> {
  MinePage({Key? key}) : super(key: key);


  void openLanguageDialog() {
    SmartDialog.show(
      backDismiss: false,
      clickMaskDismiss: false,
      builder: (_) {
        return Container(
          height: 200,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          alignment: Alignment.topCenter,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.close_rounded),
                    tooltip: '',
                    onPressed: () {
                      SmartDialog.dismiss();
                    },
                  ),
                ),
                InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/language_english.png'),
                        Text('English'.tr, textScaleFactor: 2),
                      ],
                    ),
                    onTap: () {
                      var locale = Locale('en', 'US');
                      Get.updateLocale(locale);
                      final prefs = StoragePrefs();
                      prefs.language = 'English';
                      CacheService cacheservice = Get.find<CacheService>();
                      cacheservice.saveLanguage('2');
                    }),
                Divider(
                  color: Colors.grey,
                ),
                InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/language_chinese.png'),
                        Text('Chinese'.tr, textScaleFactor: 2),
                      ],
                    ),
                    onTap: () {
                      var locale = Locale('zh', 'CH');
                      Get.updateLocale(locale);
                      final prefs = StoragePrefs();
                      prefs.language = 'Chinese';
                      CacheService cacheservice = Get.find<CacheService>();
                      cacheservice.saveLanguage('1');
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    final themeData = Theme.of(context);
    final backgroundColor = themeData.colorScheme.surfaceVariant;
    final foregroundColor = themeData.colorScheme.surface;
    final primaryTextTheme = themeData.textTheme;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    AuthController authCtrol = Get.find<AuthController>();
    MainController mainCtrl = Get.find<MainController>();
    CacheService cacheservice = Get.find<CacheService>();
    pinnedHeaderHeight =
        //statusBar height
        statusBarHeight +
            //pinned SliverAppBar height in header
            kToolbarHeight;
    return Scaffold(
      body: ExtendedNestedScrollView(
        onlyOneScrollInBody: false,
        pinnedHeaderSliverHeightBuilder: () {
          return pinnedHeaderHeight;
        },
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 280,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                centerTitle: true,
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: statusBarHeight + 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          margin: EdgeInsets.only(left: 15.0, top: 0.0),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60.0)),
                            image: DecorationImage(
                              image: AssetImage("assets/images/head_mine.jpeg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 15.0, top: 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() => Text(
                                    cacheservice.userNameString.value,
                                    textAlign: TextAlign.start,
                                  )),
                              Obx(() => RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'rebateBal'.tr,
                                      style: primaryTextTheme.labelLarge),
                                  TextSpan(
                                      text: cacheservice.userBonusString.value,
                                      style: TextStyle(
                                          color: ColorStyle.color_FFAE2E)),
                                ]),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                    ),
                    Container(
                        height: 30,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.1, color: Color(0xFF151c26)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Obx(() => Text(
                                    controller.cacheService
                                        .userTrc20AddressString.value,
                                    style: primaryTextTheme.labelSmall,
                                    textAlign: TextAlign.center,
                                  )),
                              InkWell(
                                child: Container(
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/images/menuicon/copypaste.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                onTap: () async {
                                  await CopyPaste.copyToClipboard(controller
                                      .cacheService
                                      .userTrc20AddressString
                                      .value);
                                  showToast("CopySuccess".tr,
                                      gravity: ToastGravity.CENTER);
                                },
                              ),
                            ]
                        )
                    ),
                    Container(
                      height: 0,
                    ),
                    Expanded(
                      child: InkWell(
                        child: Pinned.fromPins(
                          Pin(start: 14.0, end: 13.0),
                          Pin(size: 133.0, middle: 0.4566),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 160,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(-1.0, -1.179),
                                    end: Alignment(0.667, 1.44),
                                    colors: [
                                      const Color(0xcd00a889),
                                      const Color(0xfe013428)
                                    ],
                                    stops: [0.0, 1.0],
                                  ),
                                  borderRadius: BorderRadius.circular(6.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x29000000),
                                      offset: Offset(3, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 210.0, start: 33.0),
                                Pin(size: 58.0, middle: 0.5176),
                                child: Text(
                                  'earn money by promoting'.tr,
                                  style: TextStyle(
                                    fontFamily: 'inpin nanzhengbeizhanNZBZti',
                                    fontSize: 16,
                                    color: const Color(0xffffffff),
                                  ),
                                  softWrap: false,
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 210.0, start: 32.0),
                                Pin(size: 50.0, middle: 0.8991),
                                child: Text(
                                  'Infinite fission, one recommendation for permanent income'
                                      .tr,
                                  style: TextStyle(
                                    fontFamily: 'PingFang SC',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  softWrap: false,
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 70.0, end: 21.0),
                                Pin(size: 30.0, middle: 0.3592),
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromPins(
                                      Pin(size: 56.0, start: 6.0),
                                      Pin(size: 18.0, middle: 0.3833),
                                      child: Text(
                                        'understand more'.tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily:
                                              'inpin nanzhengbeizhanNZBZti',
                                          fontSize: 14,
                                          color: const Color(0xffffffff),
                                        ),
                                        softWrap: false,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                        border: Border.all(
                                            width: 1.0,
                                            color: const Color(0xffffffff)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(AppRoutes.PromotionEarnPage);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Card(
                elevation: 0,
                margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                color: themeData.colorScheme.primaryContainer,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.language),
                      title: Text('language'.tr),
                      onTap: () {
                        openLanguageDialog();
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Card(
                elevation: 0,
                margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                color: themeData.colorScheme.primaryContainer,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.supervised_user_circle),
                      title: Text('modifypassword'.tr),
                      onTap: () {
                        Get.toNamed(AppRoutes.EditPassword);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.wallet),
                      title: Text('walletaddress'.tr),
                      onTap: () {
                        Get.toNamed(AppRoutes.BindwalletaddressPage);
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Card(
                elevation: 0,
                margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                color: themeData.colorScheme.secondaryContainer,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.share),
                      title: Text('share'.tr),
                      onTap: () {
                        Get.toNamed(AppRoutes.SharePage);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.color_lens),
                      title: Text('theme color'.tr),
                      onTap: () {
                        Get.toNamed(AppRoutes.ThemePage);
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Card(
                elevation: 0,
                margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                color: themeData.colorScheme.tertiaryContainer,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.support_agent),
                      title: Text('contactcustomer'.tr),
                      onTap: () {
                        CacheService cacheservice = Get.find<CacheService>();
                        String? getLocal = cacheservice.loadLanguage();
                        String strCSUrl = '';
                        if (getLocal == '1') {
                          strCSUrl =
                              "https://chatlink.mstatik.com/widget/standalone.html?eid=b6de0b8c409c539be3cfa3a9908f1d6c";
                        } else {
                          strCSUrl =
                              "https://chatlink.mstatik.com/widget/standalone.html?eid=0d2b2137e3c92d6d9205c2e0a2feb9ff&language=en";
                        }
                        Get.to(WebViewPage(
                          strUrl: strCSUrl,
                          strTitle: 'customerService'.tr,
                          blNavigation: false,
                        ));
                      },
                    ),
                    // ListTile(
                    //   leading: const Icon(Icons.feedback),
                    //   title: Text('FeedBack'.tr),
                    //   onTap: () {
                    //     // toPage(WebPage(url: 'https://support.qq.com/product/420323'));
                    //     Get.to(WebViewPage(
                    //       strUrl: 'https://support.qq.com/product/420323',
                    //       strTitle: 'FeedBack'.tr,
                    //       blNavigation: true,
                    //     ));
                    //   },
                    // ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: Text('loginoutbt'.tr),
                      onTap: () {
                        mainCtrl.pageController.jumpToPage(0);
                        BottomNavigationBar navigationBar =
                            bottomNavKey.currentWidget as BottomNavigationBar;
                        navigationBar.onTap!(0);
                        controller.cacheService.logOut();

                        Get.toNamed(AppRoutes.LoginPage);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  String titleString() {
    return "mine".tr;
  }

  @override
  bool showTitleBar() {
    return false;
  }

  @override
  bool useLoadSir() => false;
}

class _TrapezoidClipper extends CustomClipper<Path> {
  final double height;
  final double clipStartHeight;
  final double clipEndHeight;

  _TrapezoidClipper({
    required this.height,
    required this.clipStartHeight,
    required this.clipEndHeight,
  });

  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height - clipEndHeight);
    path.lineTo(0, height - clipStartHeight);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_TrapezoidClipper oldClipper) {
    return oldClipper.height != height ||
        oldClipper.clipStartHeight != clipStartHeight ||
        oldClipper.clipEndHeight != clipEndHeight;
  }
}

class _FillLineClipper extends CustomClipper<Path> {
  final double imgHeight;

  _FillLineClipper(this.imgHeight);

  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height / 2);
    path.lineTo(0, height / 2 + imgHeight / 2);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant _FillLineClipper oldClipper) {
    return oldClipper.imgHeight != imgHeight;
  }
}

class MineController extends BaseController {
  final CacheService cacheService;

  MineController(this.cacheService);

  get locale => null;

  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
  }
}

class DropdownButtonExample extends StatefulWidget {
// const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = LocalizationService.langs as String;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: LocalizationService.langs
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class MineBinding extends Bindings {
  @override
  void dependencies() {}
}
