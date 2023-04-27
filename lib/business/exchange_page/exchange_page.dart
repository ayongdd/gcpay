
import 'package:copy_paste/copy_paste.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:GCPay/base/controller/base_controller.dart';
import 'package:GCPay/business/exchange_page/Model/ExchangeRecord_Data_entity.dart';
import 'package:GCPay/res/style.dart';
import 'package:GCPay/services/cache_service.dart';
import '../../controllers/auth_controller.dart';
import '../../http/apiservice/gcpay_api.dart';
import '../../http/apiservice/haxi_api.dart';
import '../../mixin/toast/toast_mixin.dart';
import '../../utils/sp_utils.dart';
import '../home_page/home_page.dart';
import '../home_page/model/BetAddressData.dart';
import '../main_page.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';
import 'dart:developer';

class ExchangePage extends BaseStatefulWidget<ExchangeController> {
  const ExchangePage({Key? key}) : super(key: key);

  @override
  bool showBackButton() {
    // TODO: implement showBackButton
    return false;
  }

  @override
  String titleString() => "Exchange".tr;

  @override
  Widget buildContent(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final foregroundColor = themeData.colorScheme.surface;
    final primaryTextTheme = themeData.textTheme;
    CacheService cacheservice = Get.find<CacheService>();
    MainController mainCtrl = Get.find<MainController>();
    AuthController authCtrol = Get.find<AuthController>();
    String strBettingAddress = getBetaddress(8)!;

    return Scaffold(
      backgroundColor: foregroundColor,
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 355.0, middle: 0.5),
            Pin(start: 10.0, end: 0.0),
            child: SingleChildScrollView(
              child: SizedBox(
                width: 355.0,
                height: 1090.0,
                child: Stack(
                  children: <Widget>[
                    //Container
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 250.0, start: 0.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.95, -0.95),
                            child: Text(
                              '| ' + 'Exchange'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 18,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ),
                          Align(
                            alignment: !controller.isSwitched
                                ? Alignment(-0.650, 0.1)
                                : Alignment(0.650, 0.1),
                            child: Text(
                              'USDT',
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 14,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ),
                          Align(
                            alignment: !controller.isSwitched
                                ? Alignment(0.650, 0.1)
                                : Alignment(-0.650, 0.1),
                            child: Text(
                              'TRX',
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 14,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.0, -0.275),
                            child: InkWell(
                              child: SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: Image.asset(
                                    'assets/images/hashbet/exchange_ICONS.png'),
                              ),
                              onTap: () {
                                controller.isSwitched = !controller.isSwitched;
                              },
                            ),
                          ),
                          Align(
                            alignment: !controller.isSwitched
                                ? Alignment(-0.700, -0.477)
                                : Alignment(0.700, -0.477),
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset(
                                  'assets/images/hashbet/exchange_USDT.png'),
                            ),
                          ),
                          Align(
                            alignment: controller.isSwitched
                                ? Alignment(-0.700, -0.477)
                                : Alignment(0.700, -0.477),
                            child: InkWell(
                              child: SizedBox(
                                width: 60.0,
                                height: 60.0,
                                child: Image.asset(
                                    'assets/images/hashbet/exchange_TRX.png'),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.93, 0.45),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: SizedBox(
                                width: 125,
                                height: 35,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'EnterQuantity'.tr,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintStyle: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 14,
                                      color: const Color(0xff707070),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.920, 0.45),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: SizedBox(
                                width: 125,
                                height: 35,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintText: 'EnterQuantity'.tr,
                                    hintStyle: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 14,
                                      color: const Color(0xff707070),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    // FilteringTextInputFormatter.digitsOnly
                                  ], // Only numbers can be entered
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 08.0, end: 10.0),
                            Pin(size: 50.0, end: 15.0),
                            child: Row(
                              children: [
                                Text(
                                  'Todaysexchangerate'.tr,
                                  style: TextStyle(
                                    fontFamily: 'PingFang SC',
                                    fontSize: 14,
                                    color: const Color(0xfeffffff),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 10.0, end: 10.0),
                            Pin(size: 50.0, end: -8.0),
                            child: Row(
                              children: [
                                Text(
                                  '1USDT=',
                                  style: TextStyle(
                                    fontFamily: 'PingFang SC',
                                    fontSize: 14,
                                    color: const Color(0xfeffffff),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 65.0, end: 10.0),
                            Pin(size: 50.0, end: -8.0),
                            child: Row(
                              children: [
                                Text(
                                  '14.3328' + 'TRX,',
                                  style: TextStyle(
                                    fontFamily: 'PingFang SC',
                                    fontSize: 14,
                                    color: const Color(0xfeffffff),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 153.0, end: 10.0),
                            Pin(size: 50.0, end: -8.0),
                            child: Row(
                              children: [
                                Text(
                                  '1TRX=',
                                  style: TextStyle(
                                    fontFamily: 'PingFang SC',
                                    fontSize: 14,
                                    color: const Color(0xfeffffff),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 200.0, end: 10.0),
                            Pin(size: 50.0, end: -8.0),
                            child: Row(
                              children: [
                                Text(
                                  '0.05577USDT',
                                  style: TextStyle(
                                    fontFamily: 'PingFang SC',
                                    fontSize: 14,
                                    color: const Color(0xfeffffff),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 525.0, end: -525.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xfeffffff),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.0, 4.8),
                            child: Container(
                              width: 160,
                              height: 160,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Container(),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.0, 2.78),
                            child: Container(
                              child: Text(
                                'ScanCode'.tr,
                                style: TextStyle(
                                  fontFamily: 'PingFang SC',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.0, 3.0),
                            child: Container(
                              child: Text(
                                'Quantitylimit'.tr,
                                style: TextStyle(
                                  fontFamily: 'PingFang SC',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: -4.0, end: -5.0),
                            Pin(size: 69.0, end: -300.0),
                            child: Container(
                              height: 30,
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6.0),
                              margin: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0x2700a889),
                                border: Border.all(
                                    width: 0.1, color: Color(0xffffffff)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              child: Align(
                                alignment: Alignment(0.0, 0.0),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        '' + strBettingAddress,
                                        style: TextStyle(
                                            color: const Color(0xfe01231b),
                                            fontSize: 11.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 10.0, end: 0.0),
                            Pin(size: 70.0, end: -350.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'WarmReminder'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-1.0, 4.4),
                            child: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                'S1'.tr,
                                style: TextStyle(
                                  fontFamily: 'PingFang SC',
                                  fontSize: 12,
                                  color: const Color(0xff707070),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.700, 5.3),
                            child: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                'S2'.tr,
                                style: TextStyle(
                                  fontFamily: 'PingFang SC',
                                  fontSize: 12,
                                  color: const Color(0xff707070),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-1.0, 5.37),
                            child: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                'S3'.tr,
                                style: TextStyle(
                                  fontFamily: 'PingFang SC',
                                  fontSize: 12,
                                  color: const Color(0xff707070),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 320.0, end: -865.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.95, 6.2),
                            child: Text(
                              '| ' + 'ExchangeRecord'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 18,
                                color: const Color(0xFF151c26),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 07.0, end: 07.0),
                            Pin(size: 45.0, end: -640.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: colorScheme.primary,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.90, 6.45),
                            child: Text(
                              'Address'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 14,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.41, 6.45),
                            child: Text(
                              'Amount'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 14,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.03, 6.45),
                            child: Text(
                              'USDT',
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 14,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.90, 6.45),
                            child: Text(
                              'ExchangeTime'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 14,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 07.0, end: 07.0),
                            Pin(size: 200.0, end: -840.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xfeffffff),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                ),
                                border: Border.all(
                                  color: colorScheme.primary,
                                  width: 1,
                                ),
                              ),
                              child: Pinned.fromPins(
                                Pin(size: 320.0, middle: 0.5),
                                Pin(start: 10.0, end: 0.0),
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: SizedBox(
                                    width: 355.0,
                                    height: 200.0,
                                    child: Stack(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0.0, 0.0, 0.0, 0.0),
                                          child: SingleChildScrollView(
                                            primary: false,
                                            child: Wrap(
                                              alignment: WrapAlignment.center,
                                              spacing: 20,
                                              runSpacing: 12,
                                              children: controller.exchangeList
                                                  .map((itemData) {
                                                return SizedBox(
                                                  width: 355.0,
                                                  height: 105.0,
                                                  child: Stack(
                                                    children: <Widget>[
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xfff1ece3),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                      ),
                                                      Pinned.fromPins(
                                                        Pin(
                                                            size: 300.0,
                                                            start: 22.0),
                                                        Pin(
                                                            size: 30.0,
                                                            start: 5),
                                                        child: Text(
                                                          'TransferId'.tr +
                                                              ":" +
                                                              itemData
                                                                  .transferId!,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'PingFang SC',
                                                            fontSize: 12,
                                                            color: const Color(
                                                                0xff707070),
                                                          ),
                                                          softWrap: false,
                                                        ),
                                                      ),
                                                      Pinned.fromPins(
                                                        Pin(
                                                            size: 143.0,
                                                            start: 20.0),
                                                        Pin(
                                                            size: 33.0,
                                                            start: 25),
                                                        child: Text(
                                                          'exchangeAmount'.tr,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'PingFang SC',
                                                            fontSize: 12,
                                                            color: const Color(
                                                                0xff707070),
                                                          ),
                                                          softWrap: false,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment(
                                                            -0.826, 0.00),
                                                        child: SizedBox(
                                                          width: 88.0,
                                                          height: 20.0,
                                                          child: Text(
                                                            itemData
                                                                .exchangeAmount
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'PingFang SC',
                                                              fontSize: 14,
                                                              color: colorScheme
                                                                  .primary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            softWrap: false,
                                                          ),
                                                        ),
                                                      ),
                                                      Pinned.fromPins(
                                                        Pin(
                                                            size: 143.0,
                                                            start: 20.0),
                                                        Pin(
                                                            size: 33.0,
                                                            start: 63),
                                                        child: Text(
                                                          'returnAmount'.tr,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'PingFang SC',
                                                            fontSize: 12,
                                                            color: const Color(
                                                                0xff707070),
                                                          ),
                                                          softWrap: false,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment(
                                                            -0.826, 0.90),
                                                        child: SizedBox(
                                                          width: 88.0,
                                                          height: 20.0,
                                                          child: Text(
                                                            itemData
                                                                .returnAmount
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'PingFang SC',
                                                              fontSize: 14,
                                                              color: colorScheme
                                                                  .primary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            softWrap: false,
                                                          ),
                                                        ),
                                                      ),
                                                      Pinned.fromPins(
                                                        Pin(
                                                            size: 140.0,
                                                            end: 0.0),
                                                        Pin(
                                                            size: 15.0,
                                                            start: 60),
                                                        child: Text(
                                                          itemData.blockTime!,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'PingFang SC',
                                                            fontSize: 12,
                                                            color: const Color(
                                                                0xff707070),
                                                          ),
                                                          softWrap: false,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.922, -0.057),
                      child: InkWell(
                        child: Container(
                          width: 70,
                          height: 35,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Center(
                            child: Text(
                              'Copy'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 17,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: () async {
                          await CopyPaste.copyToClipboard(strBettingAddress);
                          showToast("CopySuccess".tr,
                              gravity: ToastGravity.CENTER);
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.94, 0.52),
                      child: Obx(() => FlutterToggleTab(
                            // width in percent
                            width: 40,
                            borderRadius: 20,
                            height: 30,
                            selectedIndex:
                                controller._tabTextIndexSelected.value,
                            selectedBackgroundColors: [colorScheme.primary],
                            selectedTextStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                            unSelectedTextStyle: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            labels: controller._listTextTabToggle,
                            selectedLabelIndex: (index) {
                              controller._tabTextIndexSelected.value = index;
                              // controller.getExchangeInfo(index);
                            },
                            isScroll: false,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExchangeController extends BaseController {
  final CacheService cacheService;
  bool isSwitched = true;
  var _listTextTabToggle = ["USDT", "TRX"];
  RxInt _tabTextIndexSelected = 0.obs;

  ExchangeController(this.cacheService);

  get locale => null;

  RxString rxTransferType = 'usdt'.obs;
  final GCPayApi _gcpayApi = Get.find<GCPayApi>();
  RxList<ExchangeRecordDataEntity> exchangeList =
      <ExchangeRecordDataEntity>[].obs;
  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    getExchangeInfo(0);
  }

  Future<void> getExchangeInfo(int intTransferType) async {
    String strTransferType = "";
    if (intTransferType == 0) {
      strTransferType = "usdt";
    } else {
      strTransferType = "trx";
    }

    try {
      Map<String, dynamic> data = <String, dynamic>{
        'timeType': 'month',
        "transferType": strTransferType,
      };
      var response;// = await _gcpayApi.getTronOutExchangeRecord(data);
      if (response.code == 401) {
        // Get.toNamed(Routes.LOGIN);
      }
      if (response.code == 200) {
        //return json.decode(response.body);
        exchangeList.value = response.data!;
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
}

String? getBetaddress(int intIndex) {
  HomeController homeController = Get.find<HomeController>();
  for (BetAddressData betaddress in homeController.betaddList) {
    if (betaddress.playId == intIndex) {
      return betaddress.address;
    }
  }
  return '';
}

class ExchangeBinding extends Bindings {
  @override
  void dependencies() {}
}
