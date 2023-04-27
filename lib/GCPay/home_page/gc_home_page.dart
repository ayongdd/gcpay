import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:copy_paste/copy_paste.dart';
import 'package:dio/dio.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:GCPay/GCPay/home_page/Model/PendingOrderList_Data_entity.dart';
import 'package:GCPay/GCPay/home_page/Model/UserBalance_Amount_entity.dart';
import 'package:GCPay/base/controller/base_controller.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';
import 'package:GCPay/http/apiservice/gcpay_api.dart';
import 'package:GCPay/widget/popup/Notification.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constant/http_url.dart';
import '../../routes/app_routes.dart';
import '../../services/cache_service.dart';
import '../../utils/event_bus.dart';
import '../../widget/floatchatbutton/floating_chat_button.dart';
import '../../widget/popup/popup.dart';
import '../../widget/webview_page.dart';
import '../user_center_Page/models/system_config_entity.dart';
import 'Model/HomePage_Record_entity.dart';
import 'OrderSection_data.dart';

class GCHomePage extends StatefulWidget {
  const GCHomePage({Key? key}) : super(key: key);

  @override
  GCHomePageState createState() => GCHomePageState();
}

class GCHomePageState extends State<GCHomePage>
    with AutomaticKeepAliveClientMixin {
  final GCPayApi gcpayApi = Get.find<GCPayApi>();
  final CacheService cacheservice = Get.find<CacheService>();

  RxList<PendingOrderListDataEntity> orderListPayment =
      <PendingOrderListDataEntity>[].obs;
  Rx<HomePage_Record_entity> homepageOrder = HomePage_Record_entity([], []).obs;

  RxString sellerAmount = ''.obs;
  RxString tradeAmount = ''.obs;
  RxString gcTotal = ''.obs;
  RxString gcBalance = ''.obs;
  RxString rxuserName = ''.obs;
  RxString rxuserNickName = ''.obs;
  RxString rxsockettradeNo = ''.obs;
  RxInt rxAuthFlag = 0.obs;
  RxInt rxIntReadMessage = 1.obs;
  RxInt rxIntNoticeMessage = 0.obs;
  late EasyRefreshController _controller;
  int _count = 3;
  var eventBusFn;

  RxList<OrderSection> sectionList = <OrderSection>[].obs;

  GlobalKey<FloatingChatButtonState> _floatButtonKey = GlobalKey();

  bool haveNewVersion(String newVersion, String old) {
    if (newVersion == null || newVersion.isEmpty || old == null || old.isEmpty)
      return false;
    int newVersionInt, oldVersion;
    var newList = newVersion.split('.');
    var oldList = old.split('.');
    if (newList.length == 0 || oldList.length == 0) {
      return false;
    }
    for (int i = 0; i < newList.length; i++) {
      newVersionInt = int.parse(newList[i]);
      oldVersion = int.parse(oldList[i]);
      if (newVersionInt > oldVersion) {
        return true;
      } else if (newVersionInt < oldVersion) {
        return false;
      }
    }

    return false;
  }

  Future<void> openNotice(
      String strNoticeTitle, String strNoticeContent, String strNoticeTime) async {
    if (cacheservice.intPopup == 1) {
      return;
    }
    cacheservice.intPopup = 1;
    final popup = BeautifulPopup(
      context: context,
      template: TemplateCoin,
    );
    var shouldUpdate = await popup.show(
      title: strNoticeTitle,
      content: strNoticeContent,
      actions: [
        popup.button(
            label: 'close'.tr,
            onPressed: () {
              cacheservice.intPopup = 0;
              Get.back();
            }),
      ],
    );
    cacheservice.intPopup = 0;
  }

  Future<void> openNewVersionNotice(
      String strNoticeTitle, String strNoticeContent, String strNoticeTime) async {
    if (cacheservice.intPopup == 1) {
      return;
    }
    cacheservice.intPopup = 1;
    final popup = BeautifulPopup(
      context: context,
      template: TemplateNotification,
    );
    var shouldUpdate = await popup.show(
      title: strNoticeTitle,
      content: strNoticeContent,
      actions: [
        popup.button(
          label: 'cancel'.tr,
          onPressed: () {
            Get.back();
            cacheservice.intPopup = 0;
          },
        ),
        popup.button(
          label: 'confirm'.tr,
          onPressed: () async {
            cacheservice.intPopup = 0;
            Get.back();
            final Uri _url = Uri.parse(cacheservice.rxDownloadLink.value);
            await launchUrl(_url);
          },
        ),
      ],
    );
    cacheservice.intPopup = 0;
  }

  Future<void> openAuthReminder(String strNoticeTitle, String strNoticeContent, String strNoticeTime) async {
    if (cacheservice.intPopup == 1) {
      return;
    }
    cacheservice.intPopup = 1;
    final popup = BeautifulPopup(
      context: context,
      template: TemplateNotification,
    );
    var shouldUpdate = await popup.show(
      title: strNoticeTitle,
      content: strNoticeContent,
      actions: [
        popup.button(
            label: 'cancel'.tr,
            onPressed: () {
              cacheservice.intPopup = 0;
              Get.back();
            }),
        popup.button(
          label: 'confirm'.tr,
          onPressed: () async {
            cacheservice.intPopup = 0;
            Get.back();
            var data = await Get.toNamed(AppRoutes.VerifyPage);
            getUserBalanceInfo();
            getHomePageOrderList();
          },
        ),
      ],
    );
    cacheservice.intPopup = 0;
  }

  String getAuthFlag() {
    String strAuthFlag = "welcome".tr;
    if (rxAuthFlag == 0) {
      strAuthFlag = 'notverify'.tr;
    } else if (rxAuthFlag == 1) {
      strAuthFlag = 'verifying'.tr;
    } else if (rxAuthFlag == 2) {
      strAuthFlag = 'verified'.tr;
    }
    return strAuthFlag;
  }

  Future<void> setNoticeReadStatus() async {
    rxIntNoticeMessage.value = 0;
    bool blSupportBadger = await FlutterAppBadger.isAppBadgeSupported();
    if (blSupportBadger) {
      FlutterAppBadger.removeBadge();
    }
    Map<String, dynamic> data = <String, dynamic>{'id': 0};
    gcpayApi.upZmsSitMailInfoReadStatus(data);
  }

  Future<void> getUserBalanceInfo() async {
    try {
      String strAlias = '';
      strAlias = cacheservice.loadPushAlias()!;
      Map<String, dynamic> data = <String, dynamic>{'alias': strAlias};
      var response = await gcpayApi.umsUserBalance(data);
      if (response.code == 401) {}
      if (response.code == 200) {
        //return json.decode(response.body);
        UserBalanceAmountEntity balanceEntity = response.data!;
        sellerAmount.value = balanceEntity.sellerAmount!.toStringAsFixed(0);
        tradeAmount.value = balanceEntity.tradeAmount!.toStringAsFixed(0);
        gcBalance.value = balanceEntity.gcBalance!.toStringAsFixed(0);
        gcTotal.value = balanceEntity.gcTotal!.toStringAsFixed(0);
        rxIntNoticeMessage.value = balanceEntity.unreadNum!.toInt();
        if(balanceEntity.realName != null)
          {
            rxuserName.value = balanceEntity.realName!;
            cacheservice.saveUserName(balanceEntity.realName!);
          }
        if(balanceEntity.nickname != null)
          {
            rxuserNickName.value = balanceEntity.nickname!;
            cacheservice.saveUserNickName(balanceEntity.nickname!);
          }
        cacheservice.saveServiceLink(balanceEntity.serviceLink!);
        cacheservice.saveAuthFlag(balanceEntity.authFlag.toString());
        bool blSupportBadger = await FlutterAppBadger.isAppBadgeSupported();
        if (blSupportBadger) {
          int intUnread = balanceEntity.unreadNum!.toInt();
          if (intUnread == 0) {
            FlutterAppBadger.removeBadge();
          } else {
            FlutterAppBadger.updateBadgeCount(intUnread);
          }
        }
        rxAuthFlag.value = balanceEntity.authFlag!.toInt();
      } else {}
      // var message = response.toString();
      //
      // log('${json.decode(response.body)}');
      // log('All ovens loaded successfully');
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  List<Widget> paymentIcon(List<Payment> paymentmethods) {
    List<Widget> list = [];
    //i<5, pass your dynamic limit as per your requirment
    String strPayImage = '';
    for (int i = 0; i < paymentmethods.length; i++) {
      if (paymentmethods[i].paymentType == 1) {
        strPayImage = 'assets/images/alipay.png';
      } else if (paymentmethods[i].paymentType == 2) {
        strPayImage = 'assets/images/wechat.png';
      } else if (paymentmethods[i].paymentType == 3) {
        strPayImage = 'assets/images/union_pay.png';
      } else if (paymentmethods[i].paymentType == 4) {
        strPayImage = 'assets/images/ECNY.png';
      } else if (paymentmethods[i].paymentType == 5) {
        strPayImage = 'assets/images/qqpay.png';
      }
      list.add(Image.asset(
        strPayImage,
        height: 32,
      ));
       //add any Widget in place of Text("Index $i")
    }
    return list; // all widget added now retrun the list here
  }

  Future<void> getHomePageOrderList() async {
    try {
      Map<String, dynamic> data = <String, dynamic>{};
      var response = await gcpayApi.homepageorderlist();
      if (response.code == 401) {}
      if (response.code == 200) {
        //return json.decode(response.body);
        homepageOrder.value = response.data!;

        setState(() {
          sectionList.value = getHomeSections(homepageOrder.value);
        });
      } else {
        //change(null, status: RxStatus.empty());
      }
      // var message = response.toString();
      //
      // log('${json.decode(response.body)}');
      // log('All ovens loaded successfully');
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future<void> getSystemConfig() async {
    try {
      Map<String, dynamic> data = <String, dynamic>{};
      var response = await gcpayApi.systemConfig();
      if (response.code == 401) {
        // Get.toNamed(Routes.LOGIN);
      }
      if (response.code == 200) {
        //return json.decode(response.body);
        system_config_entity? systemconfig = response.data;
        cacheservice.saveNotice(systemconfig!.app.headline!,
            systemconfig.app.content!, systemconfig.app.updateDate.toString());
        if(cacheservice.token != null)
          {
            if(cacheservice.token!.length > 0 && cacheservice.strCoolDownOrderPayId!.length > 0)
            {
              var retOrder = await Get.toNamed(AppRoutes.OrderPayPage,parameters: {'id':cacheservice.strCoolDownOrderPayId!});
              cacheservice.removeCoolOrderPayId();
              cacheservice.strCoolDownOrderPayId = '';
            }
            else if(cacheservice.token!.length > 0 && cacheservice.strOrderPayId!.length <= 0)
            {
              openNotice(systemconfig.app.headline!, systemconfig.app.content!,
                  systemconfig.app.updateDate.toString());
            }
          }
      } else {}
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future<void> initNetworkRequest() async {
    await getUserBalanceInfo();
    await getHomePageOrderList();

    rxuserName.value = cacheservice.loadUserName()!;
    rxuserNickName.value = cacheservice.loadUserNickName()!;
  }

  static List<OrderSection> getHomeSections(
      HomePage_Record_entity homepageentiry) {
    var sections = List<OrderSection>.empty(growable: true);
    if (homepageentiry.tmsSellOrder != null &&
        homepageentiry.tmsSellOrder.length > 0) {
      var section = OrderSection()
        ..header = "mysellorder".tr
        ..items = List.generate(
            homepageentiry.tmsSellOrder.length,
            (index) =>
                homepageentiry.tmsSellOrder[index].gcAmountUsable.toString())
        ..prices = List.generate(
            homepageentiry.tmsSellOrder.length,
            (index) =>
                homepageentiry.tmsSellOrder[index].gcAmounTotal.toString())
        ..splits = List.generate(homepageentiry.tmsSellOrder.length,
            (index) => homepageentiry.tmsSellOrder[index].sellType!)
        ..expanded = true;
      for (int i = 0; i < homepageentiry.tmsSellOrder.length; i++) {
        List<Payment> paymentList = homepageentiry.tmsSellOrder[i].payment;
        section.paymethods.add(paymentList);
      }

      sections.add(section);
    }

    if (homepageentiry.tmsTradeOrder != null &&
        homepageentiry.tmsTradeOrder.length > 0) {
      var section = OrderSection()
        ..header = "mybuyorder".tr
        ..items = List.generate(homepageentiry.tmsTradeOrder.length,
            (index) => homepageentiry.tmsTradeOrder[index].gcAmount.toString())
        ..prices = List.generate(homepageentiry.tmsTradeOrder.length,
            (index) => homepageentiry.tmsTradeOrder[index].gcAmount.toString())
        ..splits = List.generate(homepageentiry.tmsTradeOrder.length,
            (index) => homepageentiry.tmsTradeOrder[index].buyerPayType!)
        ..expanded = true;
      for (int i = 0; i < homepageentiry.tmsTradeOrder.length; i++) {
        List<Payment> paymentList = [];

        UmsPaymentBuyer paymentBuyer =
            homepageentiry.tmsTradeOrder[i].umsPaymentBuyer!;
        Payment payment = Payment(
            paymentBuyer.id,
            paymentBuyer.umsUserId,
            paymentBuyer.paymentType,
            paymentBuyer.realName,
            paymentBuyer.bankCard,
            paymentBuyer.bankName,
            paymentBuyer.remark,
            paymentBuyer.qrCode,
            paymentBuyer.createDate,
            paymentBuyer.updateDate,
            paymentBuyer.status);
        paymentList.add(payment);
        section.paymethods.add(paymentList);

        UmsPaymentBuyer paymentbuyer =
            homepageentiry.tmsTradeOrder[i].umsPaymentBuyer!;
        section.paymentbuyer.add(paymentbuyer);
      }
      sections.add(section);
    }

    return sections;
  }

  Future<void> initVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    if (haveNewVersion(cacheservice.rxVersionName.value, version)) {
      if(cacheservice.token!.length > 0 && cacheservice.strOrderPayId!.length <=0)
        {
          openNewVersionNotice(
              'versionupdate'.tr,
              'versionupdatehint'.tr + ' ' + cacheservice.rxVersionName.value + ' ' + 'versioncanupdate'.tr,
              '');
        }

    }
  }

  @override
  void initState() {
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );

    initNetworkRequest();
    initVersion();
    getSystemConfig();

    rxuserName.value = cacheservice.loadUserName()!;
    rxuserNickName.value = cacheservice.loadUserNickName()!;
    // 注册监听器，订阅 eventbus
    eventBusFn = eventBus.on<EventFn>().listen((event) {
      //  event为 event.obj 即为 eventBus.dart 文件中定义的 EventFn 类中监听的数据
      print(event.obj);

      var eventObj = event.obj;
      if(eventObj['eventbus'] == 'login')
        {
          initNetworkRequest();
          getSystemConfig();
        }
      else if(eventObj['eventbus'] == 'homepage')
        {
          initNetworkRequest();
        }
      else if(eventObj['eventbus'] == 'websocket')
      {
        _floatButtonKey.currentState?.showFloatIcon();
        rxsockettradeNo.value = eventObj['tradOrderNo'];
        initNetworkRequest();
      }

    });
  }

  @override
  void dispose() {
    //取消订阅
    eventBusFn.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      primary: false,
      body: FloatingChatButton(
        key: _floatButtonKey,
          background:ExtendedNestedScrollView(
            onlyOneScrollInBody: false,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 170,
                  pinned: false,
                  backgroundColor: const Color(0xff5294E2),
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    centerTitle: false,
                    background: Pinned.fromPins(
                      Pin(size: 435.0, middle: 0.5),
                      Pin(start: 0.0, end: 0.0),
                      child: SizedBox(
                        width: 355.0,
                        height: 1090.0,
                        child: Stack(
                          children: <Widget>[
                            /*header*/
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 230.0, start: -11.0),
                              child: Container(
                                color: const Color(0xff5294E2),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(start: -3.0, end: 0.0),
                              Pin(size: 220.0, start: 0.0),
                              child: SvgPicture.string(
                                _svg_jpp6k,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 60.0, start: 50.0),
                              Pin(size: 60.0, start: 50.0),
                              child: CircleAvatar(
                                  child: Obx(() =>
                                  (cacheservice.rxProfilePath.value.length <= 0)
                                      ? InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: const AssetImage(
                                              'assets/images/user_profile.png'),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(50.0),
                                      ),
                                    ),
                                    onTap: () async {
                                      var ret = await Get.toNamed(
                                          AppRoutes.UserCenterPage);
                                      getUserBalanceInfo();
                                      getHomePageOrderList();
                                    },
                                  )
                                      : InkWell(
                                    child: CachedNetworkImage(
                                      height: 100,
                                      width: 100,
                                      imageUrl: HttpUrl.BASE_GCPAY_URL +
                                          cacheservice
                                              .rxProfilePath.value,
                                      imageBuilder:
                                          (context, imageProvider) =>
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50)),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget:
                                          (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    onTap: () async {
                                      var ret = await Get.toNamed(
                                          AppRoutes.UserCenterPage);
                                      getUserBalanceInfo();
                                      getHomePageOrderList();
                                    },
                                  ))),
                            ),
                            Pinned.fromPins(
                              Pin(size: 90.0, middle: 0.5),
                              Pin(size: 90.0, start: 42.0),
                              child: InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: const AssetImage(
                                          'assets/images/gcpay_logo.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 120.0, middle: 0.85),
                              Pin(size: 70.0, start: 70.0),
                              child: InkWell(
                                child: Container(
                                  child: Text(
                                    'GCPAY',
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 28,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 100.0, start: 48.0),
                              Pin(size: 23.0, start: 135.0),
                              child: Text(
                                'balance'.tr + ':',
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 18,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 150.0, start: 48.0),
                              Pin(size: 35.0, start: 160.0),
                              child: Text(
                                gcTotal.value + ' GC',
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 28,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 40.0, start: 260.0),
                              Pin(size: 39.0, start: 148.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(9999.0, 9999.0)),
                                    ),
                                  ),
                                  Center(
                                    child: SizedBox(
                                      width: 24.0,
                                      height: 18.0,
                                      child: Stack(
                                        children: <Widget>[
                                          SizedBox.expand(
                                              child: InkWell(
                                                child: SvgPicture.string(
                                                  _svg_um1lbt,
                                                  allowDrawingOutsideViewBox: true,
                                                  fit: BoxFit.fill,
                                                ),
                                                onTap: () async {
                                                  rxIntReadMessage.value = 0;
                                                  var ret = await Get.toNamed(
                                                      AppRoutes.SiteInfoPage,
                                                      parameters: {'messagetype': '1'});
                                                  getUserBalanceInfo();
                                                  getHomePageOrderList();
                                                },
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Obx(() => rxIntReadMessage.value == 1
                                      ? Pinned.fromPins(
                                    Pin(size: 9.0, end: 5.0),
                                    Pin(size: 9.0, middle: 0.2333),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffe2b443),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(
                                                9999.0, 9999.0)),
                                      ),
                                    ),
                                  )
                                      : Container()),
                                ],
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 40.0, start: 310.0),
                              Pin(size: 39.0, start: 148.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(9999.0, 9999.0)),
                                    ),
                                  ),
                                  Pinned.fromPins(Pin(size: 16.0, middle: 0.5),
                                      Pin(start: 9.0, end: 9),
                                      child: InkWell(
                                        child: SvgPicture.string(
                                          _svg_vaydws,
                                          allowDrawingOutsideViewBox: true,
                                          fit: BoxFit.fill,
                                        ),
                                        onTap: () async {
                                          setNoticeReadStatus();
                                          var ret = await Get.toNamed(
                                              AppRoutes.SiteInfoPage,
                                              parameters: {'messagetype': '3'});
                                          getUserBalanceInfo();
                                          getHomePageOrderList();
                                        },
                                      )),
                                  Obx(() => rxIntNoticeMessage.value == 0
                                      ? Container()
                                      : InkWell(
                                    child: Align(
                                      alignment: Alignment(0.4, -1),
                                      child: Container(
                                        width: 20.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.elliptical(
                                                  9999.0, 9999.0)),
                                        ),
                                        child: Text(
                                          rxIntNoticeMessage.value.toString(),
                                          textAlign: TextAlign.center,
                                          style:
                                          TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    onTap: () async {
                                      setNoticeReadStatus();
                                      var ret = await Get.toNamed(
                                          AppRoutes.SiteInfoPage,
                                          parameters: {'messagetype': '3'});
                                      getUserBalanceInfo();
                                      getHomePageOrderList();
                                    },
                                  ))
                                ],
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 40.0, start: 360.0),
                              Pin(size: 39.0, start: 148.0),
                              child: InkWell(
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(9999.0, 9999.0)),
                                      ),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 28.0, middle: 0.5),
                                      Pin(size: 28.0, middle: 0.5),
                                      child: Image.asset(
                                          'assets/images/settingsgear.png'),
                                    ),
                                  ],
                                ),
                                onTap: () async {
                                  var ret =
                                  await Get.toNamed(AppRoutes.UserCenterPage);
                                  getUserBalanceInfo();
                                  getHomePageOrderList();
                                },
                              ),
                            ),
                            /*end*/
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: EasyRefresh(
              controller: _controller,
              header: ClassicHeader(
                dragText: 'Pull to refresh'.tr,
                armedText: 'Release ready'.tr,
                readyText: 'Refreshing...'.tr,
                processingText: 'Refreshing...'.tr,
                processedText: 'Succeeded'.tr,
                noMoreText: 'No more'.tr,
                failedText: 'Failed'.tr,
                messageText: 'Last updated at %T'.tr,
                safeArea: false,
              ),
              footer: ClassicFooter(
                position: IndicatorPosition.locator,
                dragText: 'Pull to load'.tr,
                armedText: 'Release ready'.tr,
                readyText: 'Loading...'.tr,
                processingText: 'Loading...'.tr,
                processedText: 'Succeeded'.tr,
                noMoreText: 'No more'.tr,
                failedText: 'Failed'.tr,
                messageText: 'Last updated at %T'.tr,
              ),
              refreshOnStart: false,
              refreshOnStartHeader: BuilderHeader(
                triggerOffset: 70,
                clamping: true,
                position: IndicatorPosition.above,
                processedDuration: Duration.zero,
                builder: (ctx, state) {
                  if (state.mode == IndicatorMode.inactive ||
                      state.mode == IndicatorMode.done) {
                    return const SizedBox();
                  }
                  return Container(
                    padding: const EdgeInsets.only(bottom: 100),
                    width: double.infinity,
                    height: state.viewportDimension,
                    alignment: Alignment.center,
                  );
                },
              ),
              onRefresh: () async {
                initNetworkRequest();
                await Future.delayed(const Duration(seconds: 2));
                if (!mounted) {
                  return;
                }
                setState(() {
                  _count = 3;
                });
                _controller.finishRefresh();
                _controller.resetFooter();
              },
              onLoad: () async {
                await Future.delayed(const Duration(seconds: 2));
                if (!mounted) {
                  return;
                }
                setState(() {
                  _count = 3;
                });
                _controller.finishLoad(
                    _count >= 3 ? IndicatorResult.noMore : IndicatorResult.success);
              },
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: SizedBox(
                        width: 440.0,
                        height: 230.0,
                        child: Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(size: 440.0, start: 150.0),
                              Pin(size: 30.0, start: 0.0),
                              child: Container(
                                color: const Color(0xff15056d),
                              ),
                            ),
                            Pinned.fromPins(Pin(size: 160.0, middle: 0.15),
                                Pin(size: 30.0, end: 194.0),
                                child: Obx(
                                      () => Text(
                                    getAuthFlag(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 15,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                )),
                            Pinned.fromPins(
                              Pin(size: 143.0, end: 70), //hPin 水平
                              Pin(size: 30.0, end: 194.0), //vPin 垂直
                              child: Obx(() => rxAuthFlag.value == 2 && rxuserName.value.length > 0
                                  ? Text(
                                'user'.tr + ' ' + rxuserName.value,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 15,
                                  color: const Color(0xffffffff),
                                ),
                              )
                                  : Text(
                                'user'.tr + ' ' + rxuserNickName.value,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 15,
                                  color: const Color(0xffffffff),
                                ),
                              )),
                            ),
                            Pinned.fromPins(
                              Pin(size: 19.0, middle: 0.90),
                              Pin(size: 19.0, end: 205.0),
                              child: Stack(
                                children: <Widget>[
                                  SizedBox.expand(
                                      child:
                                      // Adobe XD layer: 'user-avatar' (shape)
                                      SvgPicture.string(
                                        _svg_p1rmj,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      )),
                                ],
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 440.0, start: 170.0),
                              Pin(size: 30.0, start: 35.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff5294E2),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 160.0, middle: 0.15),
                              Pin(size: 30.0, end: 160.0),
                              child: Text(
                                'walletaddress'.tr,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 15,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 143.0, end: 70),
                              Pin(size: 30.0, end: 160.0),
                              child: Obx(() => Text(
                                cacheservice.userTrc20AddressString.value,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 15,
                                  color: const Color(0xffffffff),
                                ),
                              )),
                            ),
                            Pinned.fromPins(
                              Pin(size: 27.0, middle: 0.91),
                              Pin(size: 27.0, end: 166.0),
                              child: InkWell(
                                child: Stack(
                                  children: <Widget>[
                                    // Adobe XD layer: 'queue (Background)' (shape)
                                    Container(),
                                    Padding(
                                      padding: EdgeInsets.all(3.4),
                                      child: SizedBox.expand(
                                          child:
                                          // Adobe XD layer: 'queue' (shape)
                                          SvgPicture.string(
                                            _svg_siap1o,
                                            allowDrawingOutsideViewBox: true,
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                  ],
                                ),
                                onTap: () async {
                                  await CopyPaste.copyToClipboard(
                                      cacheservice.userTrc20AddressString.value);
                                  Fluttertoast.showToast(
                                      msg: "CopySuccess".tr,
                                      gravity: ToastGravity.CENTER);
                                },
                              ),
                            ),
                            //Box Gray1
                            Pinned.fromPins(
                              Pin(size: 120.0, middle: 0.02),
                              Pin(size: 67.0, end: 80.0),
                              child: Container(
                                color: const Color(0xffe5e5e5),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 220.0, middle: 0.07),
                              Pin(size: 33.0, end: 103.0),
                              child: Text(
                                gcBalance.value,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 24,
                                  color: const Color(0xe05d5d5d),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 26.0, middle: 0.25),
                              Pin(size: 14.0, end: 110.0),
                              child: Text(
                                'GC',
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 12,
                                  color: const Color(0xff5d5d5d),
                                ),
                                softWrap: false,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 89.0, middle: 0.087),
                              Pin(size: 20.0, end: 83.0),
                              child: Text(
                                'availablequantity'.tr,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 10,
                                  color: const Color(0xff6e6e6e),
                                ),
                              ),
                            ),
                            //Box Gray2
                            Pinned.fromPins(
                              Pin(size: 125.0, middle: 0.5),
                              Pin(size: 67.0, end: 80.0),
                              child: Container(
                                color: const Color(0xffe5e5e5),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 85.0, middle: 0.48),
                              Pin(size: 33.0, end: 103.0),
                              child: Text(
                                sellerAmount.value,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 24,
                                  color: const Color(0xe05d5d5d),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 26.0, middle: 0.619),
                              Pin(size: 14.0, end: 110.0),
                              child: Text(
                                'GC',
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 12,
                                  color: const Color(0xff5d5d5d),
                                ),
                                softWrap: false,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 89.0, middle: 0.515),
                              Pin(size: 20.0, end: 83.0),
                              child: Text(
                                'sellorderbalance'.tr,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 11,
                                  color: const Color(0xff6e6e6e),
                                ),
                              ),
                            ),
                            //Box Gray3
                            Pinned.fromPins(
                              Pin(size: 120.0, middle: 0.98),
                              Pin(size: 67.0, end: 80.0),
                              child: Container(
                                color: const Color(0xffe5e5e5),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 80.0, middle: 0.899),
                              Pin(size: 50.0, end: 86.0),
                              child: Text(
                                tradeAmount.value,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 24,
                                  color: const Color(0xe05d5d5d),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 26.0, middle: 0.99),
                              Pin(size: 14.0, end: 110.0),
                              child: Text(
                                'GC',
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 12,
                                  color: const Color(0xff5d5d5d),
                                ),
                                softWrap: false,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 100.0, middle: 0.984),
                              Pin(size: 20.0, end: 83.0),
                              child: Text(
                                'intransaction'.tr,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 11,
                                  color: const Color(0xff6e6e6e),
                                ),
                              ),
                            ),
                            //BuyCoinsButton
                            Pinned.fromPins(
                              Pin(size: 150.0, start: 19),
                              Pin(size: 48.0, end: 17.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffe2b443),
                                  borderRadius: BorderRadius.circular(9.0),
                                ), child: InkWell(
                                child: Center(
                                  child: Text(
                                    'buycoins'.tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 20,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                onTap: () async {
                                  print('dianji--${rxAuthFlag.value}');
                                  if (rxAuthFlag.value == 0) {
                                    openAuthReminder("WarmReminder".tr,
                                        'notverifyfirstly'.tr, '');
                                  } else if (rxAuthFlag.value == 1) {
                                    Fluttertoast.showToast(
                                        msg: 'verifying'.tr,
                                        gravity: ToastGravity.CENTER);
                                  } else if (rxAuthFlag.value == 2) {
                                    var ret =
                                    await Get.toNamed(AppRoutes.OrderLobbyPage);
                                    getUserBalanceInfo();
                                    getHomePageOrderList();
                                  }
                                },
                              ),
                              ),
                            ),

                            //SellCoinsButton
                            Pinned.fromPins(
                              Pin(size: 150.0, end: 19),
                              Pin(size: 48.0, end: 17.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff5294E2),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: InkWell(
                                  child: Center(
                                    child: Text(
                                      'sellcoins'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 20,
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  onTap: () async {
                                    if (rxAuthFlag.value == 0) {
                                      openAuthReminder("WarmReminder".tr,
                                          'notverifyfirstly'.tr, '');
                                    } else if (rxAuthFlag.value == 1) {
                                      Fluttertoast.showToast(
                                          msg: 'verifying'.tr,
                                          gravity: ToastGravity.CENTER);
                                    } else if (rxAuthFlag.value == 2) {
                                      var data =
                                      await Get.toNamed(AppRoutes.SellcoinPage);
                                      getUserBalanceInfo();
                                      getHomePageOrderList();
                                    }
                                  },
                                ),
                              ),
                            ),
                            //ScrollView
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(
                        () => sectionList.value.length > 0
                        ? SliverExpandableList(
                      builder:
                      SliverExpandableChildDelegate<String, OrderSection>(
                        sectionList: sectionList.value,
                        headerBuilder: _buildHeader,
                        itemBuilder:
                            (context, sectionIndex, itemIndex, index) {
                          String item = sectionList
                              .value[sectionIndex].items[itemIndex];
                          String price = sectionList
                              .value[sectionIndex].prices[itemIndex];
                          String splite = "sellnotsplit".tr;
                          List<Payment> listpayment = sectionList
                              .value[sectionIndex].paymethods[itemIndex];
                          if (sectionList
                              .value[sectionIndex].splits[itemIndex] ==
                              2) {
                            splite = "sellsplit".tr;
                          }
                          return Card(
                              child: ListTile(
                                  onTap: () async {
                                    if (homepageOrder
                                        .value.tmsSellOrder.length >
                                        0 &&
                                        homepageOrder
                                            .value.tmsTradeOrder.length >
                                            0) {
                                      if (sectionIndex == 0) {
                                        TmsSellOrder tmsSellOrder =
                                        homepageOrder.value
                                            .tmsSellOrder[itemIndex];
                                        cacheservice.mySellOrderEntity =
                                            tmsSellOrder;
                                        var ret = await Get.toNamed(
                                            AppRoutes.MySellOrderPage);
                                        getUserBalanceInfo();
                                        getHomePageOrderList();
                                      } else if (sectionIndex == 1) {
                                        TmsTradeOrder tmsTradeOrder =
                                        homepageOrder.value
                                            .tmsTradeOrder[itemIndex];
                                        cacheservice.myTradeOrderEntity =
                                            tmsTradeOrder;
                                        var ret = await Get.toNamed(
                                            AppRoutes.MyBuyOrderPage);
                                        getUserBalanceInfo();
                                        getHomePageOrderList();
                                      }
                                    } else if (homepageOrder
                                        .value.tmsSellOrder.length <=
                                        0) {
                                      TmsTradeOrder tmsTradeOrder =
                                      homepageOrder
                                          .value.tmsTradeOrder[itemIndex];
                                      cacheservice.myTradeOrderEntity =
                                          tmsTradeOrder;
                                      var ret = await Get.toNamed(
                                          AppRoutes.MyBuyOrderPage);
                                      getUserBalanceInfo();
                                      getHomePageOrderList();
                                    } else if (homepageOrder
                                        .value.tmsTradeOrder.length <=
                                        0) {
                                      TmsSellOrder tmsSellOrder =
                                      homepageOrder
                                          .value.tmsSellOrder[itemIndex];
                                      cacheservice.mySellOrderEntity =
                                          tmsSellOrder;
                                      var ret = await Get.toNamed(
                                          AppRoutes.MySellOrderPage);
                                      getUserBalanceInfo();
                                      getHomePageOrderList();
                                    }
                                  },
                                  leading: CircleAvatar(
                                    child: Text("$index"),
                                  ),
                                  title: Text(price + ' GC'),
                                  subtitle: Text(splite),
                                  trailing: listpayment.length<=4?Container(
                                    width: 130,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: paymentIcon(listpayment),
                                    ),
                                  ):SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child:                                             Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: paymentIcon(listpayment),
                                    ),)));
                        },
                      ),
                    )
                        : SliverToBoxAdapter(
                      child: Card(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.all(10),
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/widget_nodata.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Text(
                            'NoData'.tr,
                            textAlign: TextAlign.center,
                          ), /* add child content here */
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: (_) async {
            _floatButtonKey.currentState?.hideFloatIcon();
            for(int i = 0; i < homepageOrder.value
                .tmsTradeOrder.length;i++)
              {
                TmsTradeOrder tmsTradeOrder =
                homepageOrder.value
                    .tmsTradeOrder[i];
                if(tmsTradeOrder.tradeOrderNo == rxsockettradeNo.value)
                  {
                    cacheservice.myTradeOrderEntity = tmsTradeOrder;
                    break;
                  }
              }


            var ret = await Get.toNamed(
                AppRoutes.MyBuyOrderPage,parameters: {'tradeOrderNo': rxsockettradeNo.value});
            getUserBalanceInfo();
            getHomePageOrderList();

    },
      chatIconBorderColor: Colors.white,
      messageBorderWidth: 2,
        chatIconVerticalOffset:150,
      showMessageParameters: ShowMessageParameters(
          delayDuration: const Duration(seconds: 2),
          durationToShowMessage: const Duration(seconds: 5)),
    )
    );
  }

  void goToOrderLobbyBuyIcon() {}

  void gotoSellIconPage() {}
  Widget _buildHeader(BuildContext context, int sectionIndex, int index) {
    OrderSection section = sectionList.value[sectionIndex];
    return InkWell(
        child: Container(
            color: const Color(0xff5294E2),
            height: 48,
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              section.header,
              style: TextStyle(color: Colors.white),
            )),
        onTap: () {
          //toggle section expand state
          setState(() {
            section.setSectionExpanded(!section.isSectionExpanded());
          });
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class GCHomeController extends BaseController {
  final GCPayApi gcpayApi;
  final CacheService cacheservice;
  GCHomeController(this.cacheservice, this.gcpayApi);
  RxList<PendingOrderListDataEntity> orderListPayment =
      <PendingOrderListDataEntity>[].obs;
  Rx<HomePage_Record_entity> homepageOrder = HomePage_Record_entity([], []).obs;

  RxString sellerAmount = ''.obs;
  RxString tradeAmount = ''.obs;
  RxString gcTotal = ''.obs;
  RxString gcBalance = ''.obs;
  RxString rxuserName = ''.obs;
  RxString rxuserNickName = ''.obs;
  RxList<OrderSection> sectionList = <OrderSection>[].obs;

  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    getUserBalanceInfo();
    getHomePageOrderList();
    rxuserName.value = cacheservice.loadUserName()!;
    rxuserNickName.value = cacheservice.loadUserNickName()!;
  }

  Future<void> getUserBalanceInfo() async {
    try {
      String strAlias = '';
      strAlias = cacheservice.loadPushAlias()!;
      Map<String, dynamic> data = <String, dynamic>{'alias': strAlias};
      var response = await gcpayApi.umsUserBalance(data);
      if (response.code == 401) {}
      if (response.code == 200) {
        //return json.decode(response.body);
        UserBalanceAmountEntity balanceEntity = response.data!;
        sellerAmount.value = balanceEntity.sellerAmount.toString();
        tradeAmount.value = balanceEntity.tradeAmount.toString();
        gcBalance.value = balanceEntity.gcBalance.toString();
        gcTotal.value = balanceEntity.gcTotal.toString();
        cacheservice.saveAuthFlag(balanceEntity.authFlag.toString());
        cacheservice.saveServiceLink(balanceEntity.serviceLink!);
        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
      // var message = response.toString();
      //
      // log('${json.decode(response.body)}');
      // log('All ovens loaded successfully');
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future<void> getHomePageOrderList() async {
    try {
      Map<String, dynamic> data = <String, dynamic>{};
      var response = await gcpayApi.homepageorderlist();
      if (response.code == 401) {}
      if (response.code == 200) {
        //return json.decode(response.body);
        homepageOrder.value = response.data!;
        sectionList.value = getHomeSections(homepageOrder.value);
        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
      // var message = response.toString();
      //
      // log('${json.decode(response.body)}');
      // log('All ovens loaded successfully');
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  static List<OrderSection> getHomeSections(
      HomePage_Record_entity homepageentiry) {
    var sections = List<OrderSection>.empty(growable: true);
    if (homepageentiry.tmsSellOrder != null &&
        homepageentiry.tmsSellOrder.length > 0) {
      var section = OrderSection()
        ..header = "mysellorder".tr
        ..items = List.generate(
            homepageentiry.tmsSellOrder.length, (index) => "ListTile #$index")
        ..expanded = true;
      sections.add(section);
    }

    if (homepageentiry.tmsTradeOrder != null &&
        homepageentiry.tmsTradeOrder.length > 0) {
      var section = OrderSection()
        ..header = "mybuyorder".tr
        ..items = List.generate(
            homepageentiry.tmsSellOrder.length, (index) => "ListTile #$index")
        ..expanded = true;
      sections.add(section);
    }

    return sections;
  }
}

class GCHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => GCHomeController(Get.put(CacheService()), Get.put(GCPayApi())));
  }
}

const String _svg_l75u9y =
    '<svg viewBox="-3.0 0.0 451.0 260.0" ><path transform="translate(-3.0, 0.0)" d="M 451 0 L 451 260 L 0 260 L 451 0 Z" fill="#5390d5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fwt3e4 =
    '<svg viewBox="45.9 31.6 1.0 1.0" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 0 2.644927740097046 L 0 2.644927740097046 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_p1rmj =
    '<svg viewBox="2187.8 -813.2 19.0 19.0" ><path transform="translate(2187.82, -813.18)" d="M 17.5385627746582 19 L 1.461437344551086 19 C 0.6555932760238647 19 0 18.34440803527832 0 17.5385627746582 L 0 1.461437344551086 C 0 0.6555932760238647 0.6555932760238647 0 1.461437344551086 0 L 17.5385627746582 0 C 18.34440803527832 0 19 0.6555932760238647 19 1.461437344551086 L 19 17.5385627746582 C 19 18.34440803527832 18.34440803527832 19 17.5385627746582 19 Z M 1.461437344551086 1.461437344551086 L 1.461437344551086 17.5385627746582 L 17.5385627746582 17.5385627746582 L 17.5385627746582 1.461437344551086 L 1.461437344551086 1.461437344551086 Z M 4.384312152862549 16.07858848571777 L 4.382850170135498 16.07858848571777 L 2.922874689102173 16.07712554931641 L 2.922874689102173 14.40916633605957 C 2.922874689102173 13.88763046264648 3.195050477981567 13.41835880279541 3.633204460144043 13.18450736999512 C 5.486214160919189 12.19469165802002 7.4600830078125 11.69281387329102 9.5 11.69281387329102 C 11.53940582275391 11.69281387329102 13.51372718811035 12.19469165802002 15.36811256408691 13.18450736999512 C 15.80544662475586 13.41792011260986 16.07712554931641 13.88719177246094 16.07712554931641 14.40916633605957 L 16.07712554931641 16.07566452026367 L 14.61568832397461 16.07712554931641 L 14.61568832397461 14.43942165374756 C 12.99488067626953 13.58708667755127 11.27345657348633 13.15425109863281 9.5 13.15425109863281 C 7.727114200592041 13.15425109863281 6.005952835083008 13.58664703369141 4.384312152862549 14.43942165374756 L 4.384312152862549 16.07712554931641 L 4.384312152862549 16.07858848571777 Z M 9.5 10.23137664794922 C 7.48504638671875 10.23137664794922 5.845748901367188 8.59207820892334 5.845748901367188 6.577125072479248 C 5.845748901367188 4.562171936035156 7.48504638671875 2.922874689102173 9.5 2.922874689102173 C 11.51495361328125 2.922874689102173 13.15425109863281 4.562171936035156 13.15425109863281 6.577125072479248 C 13.15425109863281 8.59207820892334 11.51495361328125 10.23137664794922 9.5 10.23137664794922 Z M 9.5 4.384312152862549 C 8.291606903076172 4.384312152862549 7.308501720428467 5.368001461029053 7.308501720428467 6.577125072479248 C 7.308501720428467 7.78624963760376 8.291606903076172 8.769939422607422 9.5 8.769939422607422 C 10.70912456512451 8.769939422607422 11.69281387329102 7.78624963760376 11.69281387329102 6.577125072479248 C 11.69281387329102 5.368001461029053 10.70912456512451 4.384312152862549 9.5 4.384312152862549 Z" fill="#e2b443" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ns3zl4 =
    '<svg viewBox="2195.3 -739.0 28.7 21.5" ><path transform="translate(2195.31, -739.0)" d="M 26.48002243041992 21.53216171264648 L 2.206502676010132 21.53216171264648 C 0.9898258447647095 21.53216171264648 0 20.56632423400879 0 19.3791389465332 L 0 2.153022289276123 C 0 0.9658347368240356 0.9898258447647095 0 2.206502676010132 0 L 26.48002243041992 0 C 27.69669532775879 0 28.6865234375 0.9658347368240356 28.6865234375 2.153022289276123 L 28.6865234375 19.3791389465332 C 28.6865234375 20.56632423400879 27.69669532775879 21.53216171264648 26.48002243041992 21.53216171264648 Z M 2.206502676010132 4.164577007293701 L 2.206502676010132 19.3791389465332 L 26.48002243041992 19.3791389465332 L 26.48002243041992 4.164577007293701 L 14.34326171875 12.05963802337646 L 2.206502676010132 4.164577007293701 Z M 3.092281341552734 2.153022289276123 L 14.34326171875 9.472522735595703 L 25.59423828125 2.153022289276123 L 3.092281341552734 2.153022289276123 Z" fill="#1d4f8b" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ixcwbu =
    '<svg viewBox="377.0 178.6 16.0 20.4" ><path transform="translate(377.0, 178.64)" d="M 7.999045848846436 20.35793495178223 C 6.276595592498779 20.35793495178223 4.778454303741455 19.13442993164062 4.4367995262146 17.4487247467041 L 0.7292893528938293 17.4487247467041 C 0.4517313838005066 17.4487247467041 0.2022375017404556 17.29467582702637 0.07817397266626358 17.04671096801758 C -0.04761993139982224 16.79525184631348 -0.02191150188446045 16.51062774658203 0.1469236612319946 16.28530120849609 L 1.455610632896423 14.54082107543945 L 1.455610632896423 7.99738597869873 C 1.455610632896423 4.656264781951904 3.956424236297607 1.860633134841919 7.272724628448486 1.494520664215088 L 7.272724628448486 6.942748598248727e-08 L 8.726675987243652 6.942748598248727e-08 L 8.726675987243652 1.494520664215088 C 12.04166793823242 1.860502362251282 14.54248142242432 4.656744956970215 14.54248142242432 7.99738597869873 L 14.54248142242432 14.54082107543945 L 15.85116767883301 16.28530120849609 C 16.02007675170898 16.51071548461914 16.04576873779297 16.79548454284668 15.91988849639893 17.04708671569824 C 15.7959566116333 17.29482269287109 15.54697036743164 17.4487247467041 15.27011013031006 17.4487247467041 L 11.56129264831543 17.4487247467041 C 11.21972465515137 19.13394927978516 9.720987319946289 20.35793495178223 7.999045848846436 20.35793495178223 Z M 5.941789627075195 17.4487247467041 C 6.249112606048584 18.31837463378906 7.075868606567383 18.90267562866211 7.999045848846436 18.90267562866211 C 8.922223091125488 18.90267562866211 9.748978614807129 18.31837463378906 10.05630207061768 17.4487247467041 L 5.941789627075195 17.4487247467041 Z M 7.999045848846436 2.907902717590332 C 5.192697048187256 2.907902717590332 2.909562110900879 5.191038131713867 2.909562110900879 7.99738597869873 L 2.909562110900879 15.0250358581543 L 2.183240652084351 15.99477195739746 L 13.81615924835205 15.99477195739746 L 13.08853054046631 15.0250358581543 L 13.08853054046631 7.99738597869873 C 13.08853054046631 5.191038131713867 10.80539512634277 2.907902717590332 7.999045848846436 2.907902717590332 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_siap1o =
    '<svg viewBox="3.4 3.4 20.2 20.2" ><path transform="translate(3.38, 3.38)" d="M 15.1875 20.2494945526123 L 1.687331199645996 20.2494945526123 C 0.7569281458854675 20.2494945526123 0 19.49256706237793 0 18.56216239929199 L 0 5.061994075775146 C 0 4.131590366363525 0.7569281458854675 3.374662399291992 1.687331199645996 3.374662399291992 L 15.1875 3.374662399291992 C 16.11790466308594 3.374662399291992 16.87483024597168 4.131590366363525 16.87483024597168 5.061994075775146 L 16.87483024597168 18.56216239929199 C 16.87483024597168 19.49256706237793 16.11790466308594 20.2494945526123 15.1875 20.2494945526123 Z M 1.687331199645996 5.061994075775146 L 1.687331199645996 18.56216239929199 L 15.1875 18.56216239929199 L 15.1875 5.061994075775146 L 1.687331199645996 5.061994075775146 Z M 9.422325134277344 17.43828773498535 L 9.420638084411621 17.43828773498535 L 7.734993457794189 17.43828773498535 L 7.734993457794189 12.51601886749268 L 2.812725067138672 12.51601886749268 L 2.812725067138672 10.82868766784668 L 7.734993457794189 10.82868766784668 L 7.734993457794189 6.187387466430664 L 9.422325134277344 6.187387466430664 L 9.422325134277344 10.82868766784668 L 14.06210708618164 10.82868766784668 L 14.06210708618164 12.51601886749268 L 9.422325134277344 12.51601886749268 L 9.422325134277344 17.43659973144531 L 9.422325134277344 17.43828773498535 Z M 20.2494945526123 16.87483024597168 L 20.24780654907227 16.87483024597168 L 18.56216430664062 16.87483024597168 L 18.56216430664062 1.687331199645996 L 3.374662637710571 1.687331199645996 L 3.374662637710571 0 L 18.56216430664062 0 C 19.49256706237793 0 20.2494945526123 0.7569281458854675 20.2494945526123 1.687331199645996 L 20.2494945526123 16.87314414978027 L 20.2494945526123 16.87483024597168 Z" fill="#e2b443" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_jpp6k =
    '<svg viewBox="-3.0 0.0 451.0 260.0" ><path transform="translate(-3.0, 0.0)" d="M 451 0 L 451 260 L 0 260 L 451 0 Z" fill="#2072d3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vaydws =
    '<svg viewBox="386.0 176.0 16.0 20.4" ><path transform="translate(386.0, 176.0)" d="M 7.999045848846436 20.35793495178223 C 6.276595592498779 20.35793495178223 4.778454303741455 19.13442993164062 4.4367995262146 17.4487247467041 L 0.7292893528938293 17.4487247467041 C 0.4517313838005066 17.4487247467041 0.2022375017404556 17.29467582702637 0.07817397266626358 17.04671096801758 C -0.04761993139982224 16.79525184631348 -0.02191150188446045 16.51062774658203 0.1469236612319946 16.28530120849609 L 1.455610632896423 14.54082107543945 L 1.455610632896423 7.99738597869873 C 1.455610632896423 4.656264781951904 3.956424236297607 1.860633134841919 7.272724628448486 1.494520664215088 L 7.272724628448486 6.942748598248727e-08 L 8.726675987243652 6.942748598248727e-08 L 8.726675987243652 1.494520664215088 C 12.04166793823242 1.860502362251282 14.54248142242432 4.656744956970215 14.54248142242432 7.99738597869873 L 14.54248142242432 14.54082107543945 L 15.85116767883301 16.28530120849609 C 16.02007675170898 16.51071548461914 16.04576873779297 16.79548454284668 15.91988849639893 17.04708671569824 C 15.7959566116333 17.29482269287109 15.54697036743164 17.4487247467041 15.27011013031006 17.4487247467041 L 11.56129264831543 17.4487247467041 C 11.21972465515137 19.13394927978516 9.720987319946289 20.35793495178223 7.999045848846436 20.35793495178223 Z M 5.941789627075195 17.4487247467041 C 6.249112606048584 18.31837463378906 7.075868606567383 18.90267562866211 7.999045848846436 18.90267562866211 C 8.922223091125488 18.90267562866211 9.748978614807129 18.31837463378906 10.05630207061768 17.4487247467041 L 5.941789627075195 17.4487247467041 Z M 7.999045848846436 2.907902717590332 C 5.192697048187256 2.907902717590332 2.909562110900879 5.191038131713867 2.909562110900879 7.99738597869873 L 2.909562110900879 15.0250358581543 L 2.183240652084351 15.99477195739746 L 13.81615924835205 15.99477195739746 L 13.08853054046631 15.0250358581543 L 13.08853054046631 7.99738597869873 C 13.08853054046631 5.191038131713867 10.80539512634277 2.907902717590332 7.999045848846436 2.907902717590332 Z" fill="#155db2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_um1lbt =
    '<svg viewBox="0.0 0.0 24.4 18.3" ><path  d="M 22.53619003295898 18.32524490356445 L 1.877874612808228 18.32524490356445 C 0.8424050211906433 18.32524490356445 0 17.50325584411621 0 16.49288368225098 L 0 1.832359433174133 C 0 0.8219870328903198 0.8424050211906433 0 1.877874612808228 0 L 22.53619003295898 0 C 23.5716552734375 0 24.4140625 0.8219870328903198 24.4140625 1.832359433174133 L 24.4140625 16.49288368225098 C 24.4140625 17.50325584411621 23.5716552734375 18.32524490356445 22.53619003295898 18.32524490356445 Z M 1.877874612808228 3.544320821762085 L 1.877874612808228 16.49288368225098 L 22.53619003295898 16.49288368225098 L 22.53619003295898 3.544320821762085 L 12.20703125 10.26352214813232 L 1.877874612808228 3.544320821762085 Z M 2.631728887557983 1.832359433174133 L 12.20703125 8.061721801757812 L 21.7823314666748 1.832359433174133 L 2.631728887557983 1.832359433174133 Z" fill="#155db2" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
