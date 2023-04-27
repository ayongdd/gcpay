import 'dart:developer';

import 'package:copy_paste/copy_paste.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../base/controller/base_controller.dart';
import '../base/pageWidget/base_stateful_widget.dart';
import '../business/home_page/model/BetAddressData.dart';
import '../business/home_page/model/Promotion_entity.dart';
import '../http/apiservice/gcpay_api.dart';
import '../http/apiservice/haxi_api.dart';
import '../services/cache_service.dart';
import '../utils/log_utils.dart';
import '../widget/webview_page.dart';

class PromotionEarnPage
    extends BaseStatefulWidget<PromotionEarnPageController> {
  PromotionEarnPage({
    Key? key,
  }) : super(key: key);

  @override
  String titleString() {
    return "earn money by promoting".tr;
  }

  @override
  bool showTitleBar() {
    // TODO: implement showTitleBar
    return true;
  }

  @override
  Widget buildContent(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textScheme = themeData.textTheme;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 355.0, middle: 0.5),
            Pin(start: 10.0, end: 31.0),
            child: SingleChildScrollView(
              primary: false,
              child: SizedBox(
                width: 355.0,
                height: 993.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(start: 10.0, end: 0.0),
                      Pin(size: 399.0, end: -9.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfeffffff),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 19.0, end: 21.0),
                            Pin(size: 257.0, start: 58.0),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 91,
                                runSpacing: 11,
                                children: [
                                  {
                                    'text': 'first-tier betting turnover'.tr,
                                  },
                                  {
                                    'text': 'second-tier betting turnover'.tr,
                                  },
                                  {
                                    'text': 'three-tier betting turnover'.tr,
                                  },
                                  {
                                    'text': 'automatic rebate'.tr,
                                  },
                                  {
                                    'text': 'Unlimited fission mode'.tr,
                                  },
                                  {
                                    'text': 'One-time referral'.tr,
                                  }
                                ].map((itemData) {
                                  final text = itemData['text']!;
                                  return SizedBox(
                                    width: 250.0,
                                    height: 33.0,
                                    child: Stack(
                                      children: <Widget>[
                                        Pinned.fromPins(
                                          Pin(size: 33.0, start: -25.0),
                                          Pin(start: 0.0, end: 0.0),
                                          child: Stack(
                                            children: <Widget>[
                                              Stack(
                                                children: <Widget>[
                                                  Pinned.fromPins(
                                                    Pin(
                                                        startFraction: -0.2727,
                                                        endFraction: -0.2727),
                                                    Pin(
                                                        startFraction: -0.2727,
                                                        endFraction: -0.2727),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: const AssetImage(
                                                              'assets/images/listtile_left_icon.png'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(
                                                        startFraction: 0.0,
                                                        endFraction: 0.0),
                                                    Pin(
                                                        startFraction: 0.0,
                                                        endFraction: 0.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0x80ffffff),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius
                                                                    .elliptical(
                                                                        9999.0,
                                                                        9999.0)),
                                                        border: Border.all(
                                                            width: 1.0,
                                                            color: const Color(
                                                                0x80707070)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment(0.072, 0.011),
                                                child: SizedBox(
                                                  width: 12.0,
                                                  height: 7.0,
                                                  child: SvgPicture.string(
                                                    _svg_owyyj5,
                                                    allowDrawingOutsideViewBox:
                                                        true,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                            width: 230.0,
                                            height: 57.0,
                                            child: Text(
                                              text,
                                              style: TextStyle(
                                                fontFamily: 'PingFang SC',
                                                fontSize: 11,
                                                color: const Color(0xcd00a889),
                                                fontWeight: FontWeight.w600,
                                              ),
                                              softWrap: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          InkWell(
                            child: Pinned.fromPins(
                              Pin(size: 162.0, middle: 0.5026),
                              Pin(size: 38.0, end: 27.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
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
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(0.029, 0.088),
                                    child: SizedBox(
                                      width: 122.0,
                                      height: 17.0,
                                      child: Text(
                                        'Become an agent now'.tr,
                                        style: TextStyle(
                                          fontFamily: 'PingFang SC',
                                          fontSize: 11,
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                        softWrap: false,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                          Pinned.fromPins(
                            Pin(size: 247.0, start: 61.0),
                            Pin(size: 30.0, start: 18.0),
                            child: Text(
                              'Promote rake policy'.tr,
                              style: TextStyle(
                                fontFamily: 'inpin nanzhengbeizhanNZBZti',
                                fontSize: 22,
                                color: const Color(0xfe014b38),
                              ),
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 113.0, middle: 0.5157),
                      child: Stack(
                        children: <Widget>[
                          Container(
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
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 187.0, start: 27.0),
                            Pin(size: 20.0, middle: 0.2258),
                            child: Text(
                              'Accumulated total rebates (RX/OUSDT)'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(Pin(size: 147.0, start: 27.0),
                              Pin(size: 54.0, end: 12.0),
                              child: Obx(
                                () => Text(
                                  controller
                                          .promotionEntity.value.trxTotalRebate
                                          .toString() +
                                      '/' +
                                      controller
                                          .promotionEntity.value.usdtTotalRebate
                                          .toString(),
                                  style: TextStyle(
                                    fontFamily: 'PingFang SC',
                                    fontSize: 32,
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  softWrap: false,
                                ),
                              )),
                          Pinned.fromPins(
                            Pin(size: 48.6, end: 32.4),
                            Pin(size: 51.7, middle: 0.4794),
                            child: Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(size: 39.3, start: 0.0),
                                  Pin(start: 0.0, end: 5.3),
                                  child: SvgPicture.string(
                                    _svg_kxhmh3,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: SizedBox(
                                    width: 27.0,
                                    height: 31.0,
                                    child: SvgPicture.string(
                                      _svg_nq2cwp,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 113.0, middle: 0.3663),
                      child: Stack(
                        children: <Widget>[
                          Container(
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
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 189.0, start: 27.0),
                            Pin(size: 40.0, middle: 0.2877),
                            child: Text(
                              'Get your commission today (RX/OUSDT)'.tr,
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
                            Pin(size: 157.0, start: 27.0),
                            Pin(size: 54.0, end: 12.0),
                            child: Obx(() => Text(
                                  controller
                                          .promotionEntity.value.trxTodayRebate
                                          .toString() +
                                      '/' +
                                      controller
                                          .promotionEntity.value.usdtTodayRebate
                                          .toString(),
                                  style: TextStyle(
                                    fontFamily: 'PingFang SC',
                                    fontSize: 32,
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  softWrap: false,
                                )),
                          ),
                          Pinned.fromPins(
                            Pin(size: 49.1, end: 32.9),
                            Pin(size: 50.9, middle: 0.5161),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment(-0.001, 0.405),
                                  child: SizedBox(
                                    width: 16.0,
                                    height: 21.0,
                                    child: SvgPicture.string(
                                      _svg_o95kv,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ),
                                SizedBox.expand(
                                    child: SvgPicture.string(
                                  _svg_f3npyc,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 113.0, middle: 0.2169),
                      child: Stack(
                        children: <Widget>[
                          Container(
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
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 187.0, start: 27.0),
                            Pin(size: 20.0, middle: 0.2258),
                            child: Text(
                              'The total number of friends invited'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 53.0, start: 27.0),
                            Pin(size: 54.0, end: 12.0),
                            child: Obx(() => Text(
                                  controller.promotionEntity.value.agentNum
                                      .toString(),
                                  style: TextStyle(
                                    fontFamily: 'PingFang SC',
                                    fontSize: 32,
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  softWrap: false,
                                )),
                          ),
                          Pinned.fromPins(
                            Pin(size: 46.8, end: 34.2),
                            Pin(size: 38.5, middle: 0.4698),
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 0.0, 12.1, 0.0),
                                  child: SizedBox.expand(
                                      child: SvgPicture.string(
                                    _svg_drbb,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  )),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 18.6, end: 0.0),
                                  Pin(start: 0.1, end: 0.0),
                                  child: SvgPicture.string(
                                    _svg_w9bcl4,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 158.0, start: 9.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(-1.0, -1.179),
                                end: Alignment(0.667, 1.44),
                                colors: [
                                  const Color(0xcd00a889),
                                  const Color(0xcd00a889)
                                ],
                                stops: [0.0, 1.0],
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 50.0, end: 0.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFE014B38),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(6.0),
                                        bottomLeft: Radius.circular(6.0),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(0.004, 0.0),
                                    child: SizedBox(
                                      width: 128.0,
                                      height: 22.0,
                                      child: Text(
                                        'Copy and share promotion link'.tr,
                                        style: TextStyle(
                                          fontFamily: 'PingFang SC',
                                          fontSize: 16,
                                          color: const Color(0xffffffff),
                                          height: 1.8125,
                                        ),
                                        textHeightBehavior: TextHeightBehavior(
                                            applyHeightToFirstAscent: false),
                                        textAlign: TextAlign.center,
                                        softWrap: false,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () async {
                              await CopyPaste.copyToClipboard(controller
                                  .promotionEntity.value.code
                                  .toString());
                              showToast("CopySuccess".tr,
                                  gravity: ToastGravity.CENTER);
                            },
                          ),
                          Pinned.fromPins(
                            Pin(size: 187.0, start: 31.0),
                            Pin(size: 30.0, middle: 0.1773),
                            child: Text(
                              'my promotion link'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 14,
                                color: const Color(0xffffffff),
                                height: 1.8333333333333333,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 40.0, end: 27.0),
                            Pin(size: 27.0, middle: 0.4198),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff4f4f4),
                                    borderRadius: BorderRadius.circular(6.0),
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xffd8d8d8)),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 180.0, start: 10.0),
                                  Pin(size: 17.0, middle: 0.5),
                                  child: Obx(() => Text(
                                        controller.promotionEntity.value.code
                                            .toString(),
                                        style: TextStyle(
                                          fontFamily: 'PingFang SC',
                                          fontSize: 16,
                                          color: const Color(0xff707070),
                                        ),
                                        softWrap: false,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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

class PromotionEarnPageController extends BaseController {
  final GCPayApi _gcpayApi = Get.find<GCPayApi>();

  Rx<PromotionEntity> promotionEntity =
      Rx<PromotionEntity>(PromotionEntity(agentNum: 0, code: 0));

  @override
  void loadNet() {}

  @override
  void dispose() {}

  void onReady() {
    super.onReady();
    LogD("PromotionEarnPage初始化onResume");
    getPromotionInfo();
    showSuccess();
  }

  Future<void> getPromotionInfo() async {
    try {
      var response;// = await _gcpayApi.getSubordinateAgentLink();
      if (response.code == 401) {
        // Get.toNamed(Routes.LOGIN);
      }
      if (response.code == 200) {
        //return json.decode(response.body);
        PromotionEntity? promotionData = response.data;
        promotionEntity.value = promotionData!;
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

const String _svg_owyyj5 =
    '<svg viewBox="11.5 13.0 11.5 7.3" ><path transform="translate(-4940.0, -1974.0)" d="M 4951.49853515625 1990.061401367188 L 4955.73486328125 1994.297973632812 L 4963.0419921875 1986.990966796875" fill="none" stroke="#5fd4ff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gu7j7h =
    '<svg viewBox="25.1 53.5 7.4 14.9" ><path transform="translate(-3056.39, -5242.41)" d="M 3088.940673828125 5295.9091796875 L 3081.505859375 5303.34423828125 L 3088.940673828125 5310.77880859375" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kxhmh3 =
    '<svg viewBox="0.0 0.0 39.3 46.4" ><path transform="translate(-90.9, -63.7)" d="M 98.84088134765625 90.61940002441406 C 96.23428344726562 89.52947998046875 94.61381530761719 88.09931182861328 94.61381530761719 86.88828277587891 L 94.61381530761719 78.83783721923828 C 96.40728759765625 79.99696350097656 98.83511352539062 80.95425415039062 101.6493072509766 81.60590362548828 C 104.4173736572266 82.24601745605469 107.4968414306641 82.59201812744141 110.5532455444336 82.59201812744141 C 113.6096420288086 82.59201812744141 116.6891174316406 82.25177764892578 119.4571762084961 81.60590362548828 C 122.271369934082 80.95425415039062 124.6991958618164 79.99696350097656 126.4926681518555 78.83783721923828 L 126.4926681518555 83.34170532226562 L 130.2122650146484 83.34170532226562 L 130.2122650146484 73.14601135253906 C 130.2122650146484 70.29145050048828 128.0381774902344 67.85208892822266 123.9264450073242 66.10475921630859 C 120.3452682495117 64.57655334472656 115.466552734375 63.70000457763672 110.5590133666992 63.70000457763672 C 105.6514663696289 63.70000457763672 100.7669906616211 64.57655334472656 97.18580627441406 66.10475921630859 C 93.06831359863281 67.85208892822266 90.89999389648438 70.29145050048828 90.89999389648438 73.14601135253906 L 90.89999389648438 100.64208984375 C 90.89999389648438 103.4966506958008 93.07407379150391 105.9360046386719 97.18580627441406 107.6833419799805 C 100.7727584838867 109.2115478515625 105.6456909179688 110.0880966186523 110.5532455444336 110.0880966186523 L 110.6685791015625 110.0880966186523 L 110.6685791015625 106.3685150146484 L 110.5532455444336 106.3685150146484 C 106.0897445678711 106.3685150146484 101.9261093139648 105.6592025756836 98.84088134765625 104.3732070922852 C 96.23428344726562 103.2832717895508 94.61381530761719 101.8531112670898 94.61381530761719 100.64208984375 L 94.61381530761719 92.59164428710938 C 96.40728759765625 93.75653839111328 98.83511352539062 94.70805358886719 101.6493072509766 95.35970306396484 C 104.4173736572266 95.99981689453125 107.4968414306641 96.3458251953125 110.5532455444336 96.3458251953125 L 110.6685791015625 96.3458251953125 L 110.6685791015625 92.6204833984375 L 110.5532455444336 92.6204833984375 C 106.0897445678711 92.6204833984375 101.9261093139648 91.91116333007812 98.84087371826172 90.61940002441406 Z M 94.61381530761719 73.14601135253906 C 94.61381530761719 71.93498992919922 96.23428344726562 70.50482177734375 98.84088134765625 69.41489410400391 C 101.9261093139648 68.12313842773438 106.0897445678711 67.41957855224609 110.5532455444336 67.41957855224609 C 115.0167465209961 67.41957855224609 119.1803741455078 68.12890625 122.2656097412109 69.41490173339844 C 124.872200012207 70.50482177734375 126.4926681518555 71.93498992919922 126.4926681518555 73.14601135253906 C 126.4926681518555 74.35704040527344 124.872200012207 75.78720855712891 122.2656097412109 76.87712860107422 C 119.1803741455078 78.16312408447266 115.0225067138672 78.8724365234375 110.5532455444336 78.8724365234375 C 106.0897445678711 78.8724365234375 101.9261169433594 78.16312408447266 98.84088134765625 76.87712860107422 C 96.23429107666016 75.78720855712891 94.61381530761719 74.35704040527344 94.61381530761719 73.14601135253906 Z" fill="#eedbfc" fill-opacity="0.3" stroke="none" stroke-width="1" stroke-opacity="0.3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nq2cwp =
    '<svg viewBox="22.0 20.6 26.6 31.1" ><path transform="translate(-450.02, -399.74)" d="M 485.2982482910156 420.2999877929688 C 476.5673217773438 420.2999877929688 472 423.6851196289062 472 427.0356140136719 L 472 444.705078125 C 472 448.0498352050781 476.5673217773438 451.4407043457031 485.2982482910156 451.4407043457031 C 489.3061828613281 451.4407043457031 492.7085571289062 450.7313842773438 495.1421508789062 449.3819580078125 C 497.2816467285156 448.1940002441406 498.5042114257812 446.6023559570312 498.5906982421875 444.9011535644531 L 498.5964660644531 444.9011535644531 L 498.5964660644531 427.0298461914062 C 498.5964660644531 423.6851196289062 494.0291748046875 420.2999877929688 485.2982482910156 420.2999877929688 Z M 494.8768920898438 444.6993103027344 C 494.8768920898438 445.114501953125 494.0579833984375 445.8699951171875 492.4952087402344 446.5101013183594 C 491.1515502929688 447.0579528808594 488.8102111816406 447.7153625488281 485.29248046875 447.7153625488281 C 481.7747192382812 447.7153625488281 479.4391784667969 447.0579528808594 478.0955200195312 446.5100708007812 C 476.53271484375 445.875732421875 475.7138366699219 445.114501953125 475.7138366699219 444.6993103027344 L 475.7138366699219 440.6741027832031 C 478.1300964355469 441.9312438964844 481.4344787597656 442.5944213867188 485.2982482910156 442.5944213867188 C 489.1619873046875 442.5944213867188 492.4663696289062 441.9312438964844 494.8826599121094 440.6741027832031 L 494.8826599121094 444.6993103027344 L 494.8768920898438 444.6993103027344 Z M 494.8768920898438 435.870361328125 C 494.8768920898438 436.2855529785156 494.0579833984375 437.041015625 492.4952087402344 437.6811218261719 C 491.1630859375 438.2232055664062 488.8620910644531 438.8748779296875 485.3905029296875 438.8864135742188 L 485.29248046875 438.8864135742188 C 481.7747192382812 438.8864135742188 479.4334106445312 438.2347412109375 478.0897521972656 437.6811218261719 C 476.5269470214844 437.0467834472656 475.7080383300781 436.2855529785156 475.7080383300781 435.870361328125 L 475.7080383300781 431.8393859863281 C 478.1243591308594 433.102294921875 481.4287109375 433.7597045898438 485.29248046875 433.7597045898438 C 489.1562194824219 433.7597045898438 492.4606018066406 433.0965270996094 494.8768920898438 431.8393859863281 L 494.8768920898438 435.870361328125 Z M 492.4952087402344 428.8406372070312 C 491.1515502929688 429.3884582519531 488.8102111816406 430.0458984375 485.29248046875 430.0458984375 C 481.7747192382812 430.0458984375 479.4391784667969 429.3884582519531 478.0955200195312 428.8406372070312 C 476.53271484375 428.2062683105469 475.7138366699219 427.445068359375 475.7138366699219 427.0298461914062 C 475.7138366699219 426.6146545410156 476.53271484375 425.8591918945312 478.0955200195312 425.2190856933594 C 479.4391784667969 424.6712341308594 481.780517578125 424.0138244628906 485.2982482910156 424.0138244628906 C 488.8159790039062 424.0138244628906 491.1573181152344 424.6654663085938 492.5009765625 425.2190856933594 C 494.0637512207031 425.8534240722656 494.8826599121094 426.6146545410156 494.8826599121094 427.0298461914062 C 494.8768920898438 427.4508361816406 494.0637512207031 428.2005004882812 492.4952087402344 428.8406372070312 Z" fill="#eedbfc" fill-opacity="0.3" stroke="none" stroke-width="1" stroke-opacity="0.3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o95kv =
    '<svg viewBox="16.3 20.9 16.5 21.3" ><path transform="translate(-361.37, -415.84)" d="M 379.576904296875 449.7102355957031 C 378.5341186523438 449.7102355957031 377.712158203125 450.5260620117188 377.712158203125 451.5749816894531 C 377.712158203125 452.6177673339844 378.5279846191406 453.4397277832031 379.576904296875 453.4397277832031 L 384.0731811523438 453.4397277832031 L 384.0731811523438 456.1019287109375 C 384.0731811523438 457.1447143554688 384.8890075683594 457.9666748046875 385.9379272460938 457.9666748046875 C 386.9623107910156 457.9666748046875 387.8026733398438 457.1324462890625 387.8026733398438 456.1019287109375 L 387.8026733398438 453.43359375 L 392.2989501953125 453.43359375 C 393.3417358398438 453.43359375 394.1636962890625 452.6177673339844 394.1636962890625 451.56884765625 C 394.1636962890625 450.5260620117188 393.3478698730469 449.7041015625 392.2989501953125 449.7041015625 L 387.8026733398438 449.7041015625 L 387.8026733398438 448.0233764648438 L 392.2989501953125 448.0233764648438 C 393.3417358398438 448.0233764648438 394.1636962890625 447.20751953125 394.1636962890625 446.1585998535156 C 394.1636962890625 445.1158142089844 393.3478698730469 444.2938537597656 392.2989501953125 444.2938537597656 L 388.3731689453125 444.2938537597656 L 392.7221984863281 439.8834533691406 C 393.0718383789062 439.5522155761719 393.2742614746094 439.1044311523438 393.2803955078125 438.6198425292969 C 393.2926635742188 438.1291198730469 393.0963745117188 437.6383972167969 392.7467346191406 437.2764892578125 C 392.4277648925781 436.908447265625 391.9431762695312 436.6998901367188 391.4156494140625 436.6998901367188 C 390.9126586914062 436.6998901367188 390.4771423339844 436.8839111328125 390.1029663085938 437.2580871582031 L 385.9256591796875 441.4721984863281 L 381.72998046875 437.3132934570312 C 381.4110107421875 436.9513854980469 380.9325256347656 436.7428283691406 380.4049987792969 436.7428283691406 C 379.9142761230469 436.7428283691406 379.478759765625 436.9207153320312 379.1168518066406 437.2764892578125 C 378.7488098144531 437.595458984375 378.5402526855469 438.0800476074219 378.5402526855469 438.6075744628906 C 378.5402526855469 439.1105651855469 378.7242736816406 439.5460815429688 379.0923156738281 439.9141235351562 L 383.4720458984375 444.2938537597656 L 379.5646362304688 444.2938537597656 C 378.5218505859375 444.2938537597656 377.6998901367188 445.1096801757812 377.6998901367188 446.1585998535156 C 377.6998901367188 447.201416015625 378.5157165527344 448.0233764648438 379.5646362304688 448.0233764648438 L 384.0609130859375 448.0233764648438 L 384.0609130859375 449.7041015625 L 379.576904296875 449.7041015625 Z" fill="#eedbfc" fill-opacity="0.3" stroke="none" stroke-width="1" stroke-opacity="0.3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f3npyc =
    '<svg viewBox="0.0 0.0 49.1 50.9" ><path transform="translate(-111.47, -96.7)" d="M 160.5898132324219 131.7684020996094 C 160.4119262695312 127.0942535400391 158.5226440429688 122.5979995727539 154.9832916259766 118.3961639404297 C 152.1922912597656 115.0899124145508 148.9719085693359 112.6853637695312 146.7513732910156 111.2438583374023 C 148.4750518798828 109.3361663818359 149.6343841552734 107.1033706665039 149.9349517822266 105.1036682128906 C 150.2048645019531 103.3922653198242 149.8306732177734 101.8219451904297 148.8492279052734 100.5767364501953 C 147.6162872314453 98.98188018798828 146.1318359375 98.64450836181641 145.101318359375 98.64450836181641 C 144.0033264160156 98.64450836181641 142.8501281738281 99.01255035400391 141.7582550048828 99.71796417236328 C 140.7093353271484 98.33167266845703 138.875244140625 96.70001220703125 136.0351867675781 96.70001220703125 L 135.9431762695312 96.70001220703125 C 132.9988250732422 96.74295043945312 131.1708679199219 98.58316802978516 130.3243713378906 99.70570373535156 C 129.1650390625 99.00641632080078 128.0547637939453 98.65064239501953 127.0119781494141 98.65064239501953 C 125.9814605712891 98.65064239501953 124.4970169067383 98.98188018798828 123.2702026367188 100.5767364501953 C 122.2642211914062 101.8158111572266 121.8716430664062 103.379997253418 122.1415405273438 105.1098022460938 C 122.5586547851562 107.7903900146484 124.3007278442383 110.0906524658203 125.3251113891602 111.2499923706055 C 123.5216979980469 112.3970642089844 120.0743560791016 114.8445510864258 117.0870742797852 118.3838958740234 C 113.5415878295898 122.5857238769531 111.6584320068359 127.0942535400391 111.4805450439453 131.7745361328125 C 111.3149261474609 137.0375671386719 112.5846710205078 141.1167144775391 115.2468566894531 143.9076995849609 C 118.4979095458984 147.2875671386719 122.8101501464844 147.6494750976562 124.5154190063477 147.6494750976562 L 147.5672149658203 147.6494750976562 C 149.2724761962891 147.6494750976562 153.584716796875 147.2875671386719 156.8296356201172 143.9076995849609 C 159.5286254882812 141.1167144775391 160.792236328125 137.0314331054688 160.5898132324219 131.7684020996094 Z M 146.2177124023438 104.5577392578125 C 145.9294128417969 106.6433181762695 144.0339965820312 108.8761138916016 142.8746643066406 109.8268890380859 L 142.7274322509766 109.7839508056641 L 142.6783752441406 109.7839508056641 C 142.6231536865234 109.7655487060547 142.5372924804688 109.7471466064453 142.4329986572266 109.7471466064453 L 129.6312255859375 109.7471466064453 C 129.4840087890625 109.7471466064453 129.361328125 109.7839508056641 129.2693176269531 109.8146209716797 C 129.2386474609375 109.8268890380859 129.2018432617188 109.8330230712891 129.1650390625 109.8452911376953 C 128.0118408203125 108.9129180908203 126.0980072021484 106.6617202758789 125.8035736083984 104.5577392578125 L 125.8035736083984 104.5393371582031 C 125.6808929443359 103.8277816772461 125.7851715087891 103.2941207885742 126.1348114013672 102.8524703979492 C 126.5580596923828 102.3433456420898 126.8340911865234 102.3433456420898 126.9690399169922 102.3433456420898 C 127.7787399291992 102.3433456420898 128.9810180664062 103.281852722168 129.4472045898438 103.7909774780273 C 129.7968444824219 104.189697265625 130.2814331054688 104.4105224609375 130.8212280273438 104.4105224609375 C 130.9439086914062 104.4105224609375 131.0420532226562 104.385986328125 131.1033935546875 104.3737182617188 L 131.1279296875 104.3737182617188 L 131.1954040527344 104.3614501953125 C 131.81494140625 104.23876953125 132.3118133544922 103.8155136108398 132.5633087158203 103.1959762573242 L 132.5755767822266 103.1653060913086 C 132.5878448486328 103.1407699584961 133.5938262939453 100.4663238525391 135.9554443359375 100.4356536865234 L 136.0351867675781 100.4356536865234 C 138.3722534179688 100.4356536865234 139.3966369628906 103.0119552612305 139.4518432617188 103.1591720581055 C 139.6358795166016 103.7419052124023 140.1327362060547 104.1958312988281 140.7584075927734 104.3430480957031 C 140.9424285888672 104.4105224609375 141.1019134521484 104.4105224609375 141.2000579833984 104.4105224609375 C 141.6785125732422 104.4105224609375 142.1692352294922 104.1958312988281 142.549560546875 103.8155136108398 L 142.5679626464844 103.7971115112305 C 143.0341491699219 103.2879867553711 144.2364196777344 102.3433456420898 145.05224609375 102.3433456420898 C 145.2730712890625 102.3433456420898 145.5245666503906 102.3801498413086 145.8680725097656 102.8279342651367 C 146.1993103027344 103.281852722168 146.3097229003906 103.8277816772461 146.2177124023438 104.5577392578125 Z M 129.0607604980469 113.3539733886719 L 129.1098327636719 113.3662414550781 C 129.1405029296875 113.3723754882812 129.1650390625 113.3785095214844 129.1957092285156 113.3907775878906 C 129.3367919921875 113.4275817871094 129.4901428222656 113.4705200195312 129.6680297851562 113.4705200195312 L 142.4636688232422 113.4705200195312 C 142.6722412109375 113.4705200195312 142.8501281738281 113.4153137207031 142.9850769042969 113.3723754882812 L 142.9912109375 113.3723754882812 L 143.0157470703125 113.3846435546875 C 143.6598205566406 113.7342834472656 147.0274200439453 115.6358413696289 150.3336791992188 118.8991622924805 C 154.4987030029297 123.0089721679688 156.6946868896484 127.4009628295898 156.8541717529297 131.9401550292969 C 157.0075225830078 136.1542663574219 156.0935516357422 139.3194274902344 154.1429138183594 141.3436737060547 C 151.8917236328125 143.6684875488281 148.7817535400391 143.9199829101562 147.5487976074219 143.9199829101562 L 124.5031509399414 143.9199829101562 C 123.2702026367188 143.9199829101562 120.1602325439453 143.6684875488281 117.9090347290039 141.3436737060547 C 115.9584045410156 139.3132934570312 115.04443359375 136.1358642578125 115.191650390625 131.897216796875 C 115.6148986816406 121.1687622070312 127.6253814697266 114.1513977050781 129.0607604980469 113.3539733886719 Z" fill="#eedbfc" fill-opacity="0.3" stroke="none" stroke-width="1" stroke-opacity="0.3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_drbb =
    '<svg viewBox="0.0 0.0 34.7 38.5" ><path transform="translate(-62.1, -144.45)" d="M 96.81980895996094 180.7332458496094 C 96.81980895996094 180.5975189208984 96.79892730712891 180.4565734863281 96.76760864257812 180.3156280517578 C 96.40219116210938 177.3348693847656 95.24329376220703 174.484619140625 93.42665863037109 172.0676422119141 C 91.71440887451172 169.7916107177734 89.44882202148438 167.9436645507812 86.8543701171875 166.7064666748047 C 89.96041107177734 164.346923828125 91.79271697998047 160.6927490234375 91.77705383300781 156.8245544433594 C 91.90234375 152.4447784423828 89.57933807373047 148.3416595458984 85.71635437011719 146.1178436279297 C 81.85860443115234 143.8940277099609 77.07164764404297 143.8940277099609 73.21389007568359 146.1178436279297 C 69.35613250732422 148.3468780517578 67.03834533691406 152.4499969482422 67.15840911865234 156.8297729492188 C 67.14274597167969 160.7031860351562 68.97505950927734 164.3573608398438 72.09153747558594 166.711669921875 C 69.52317810058594 167.9332122802734 67.27325439453125 169.7550811767578 65.56623840332031 171.9997863769531 C 63.76525115966797 174.3854370117188 62.59592056274414 177.1939086914062 62.19918060302734 180.1381225585938 C 62.13653945922852 180.3312683105469 62.10521697998047 180.5348663330078 62.09999465942383 180.7489013671875 L 62.09999465942383 180.7645721435547 L 62.11565780639648 180.9785919189453 L 62.12087631225586 180.9837951660156 C 62.1260986328125 181.6781005859375 62.50195693969727 182.3201904296875 63.11272430419922 182.6803894042969 C 63.43115997314453 182.8630981445312 63.7861328125 182.9570617675781 64.14111328125 182.9570617675781 C 64.49609375 182.9570617675781 64.85106658935547 182.8630981445312 65.16427612304688 182.6803894042969 C 65.71240234375 182.3619537353516 66.0673828125 181.8190460205078 66.14568328857422 181.2082672119141 L 66.1561279296875 181.2082672119141 L 66.18744659423828 180.9315948486328 C 66.89739990234375 174.5368194580078 72.18028259277344 169.5932464599609 78.74733734130859 169.1547546386719 C 78.98747253417969 169.17041015625 79.22760009765625 169.1808471679688 79.46772766113281 169.1808471679688 C 79.71308135986328 169.1808471679688 79.95320892333984 169.17041015625 80.19857025146484 169.1547546386719 C 86.765625 169.5880279541016 92.04328918457031 174.5368194580078 92.75846099853516 180.9263916015625 L 92.78978729248047 181.2030639648438 L 92.81066131591797 181.2030639648438 C 92.88375091552734 181.8086090087891 93.24394989013672 182.3515167236328 93.79206848144531 182.6751708984375 C 94.42893981933594 183.0458068847656 95.21719360351562 183.0458068847656 95.84884643554688 182.6751708984375 C 96.39697265625 182.3567352294922 96.75194549560547 181.8138275146484 96.83025360107422 181.2030639648438 L 96.84590911865234 181.2030639648438 L 96.84590911865234 180.8898468017578 C 96.84590911865234 180.8533020019531 96.84069061279297 180.8219909667969 96.83547210693359 180.8011016845703 L 96.81980895996094 180.7332458496094 Z M 80.24555206298828 165.0829620361328 C 80.01064300537109 165.0725250244141 79.73918151855469 165.0673065185547 79.47817230224609 165.0673065185547 C 79.22760009765625 165.0673065185547 78.97180938720703 165.0725250244141 78.70558166503906 165.0829620361328 C 74.38844299316406 164.6235809326172 71.16755676269531 161.0842742919922 71.21453857421875 156.8402252197266 C 71.33460235595703 152.4969787597656 74.91046142578125 149.0516204833984 79.36332702636719 148.9941864013672 L 79.47295379638672 148.9941864013672 C 83.87361145019531 148.9941864013672 87.48080444335938 152.3299407958984 87.71049499511719 156.6366271972656 C 87.94540405273438 160.9642028808594 84.66709136962891 164.6705627441406 80.24555206298828 165.0829620361328 Z" fill="#eedbfc" fill-opacity="0.3" stroke="none" stroke-width="1" stroke-opacity="0.3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_w9bcl4 =
    '<svg viewBox="28.2 0.1 18.6 38.4" ><path transform="translate(-574.76, -145.54)" d="M 621.5735473632812 181.8963012695312 L 621.5631103515625 181.8232269287109 C 621.5631103515625 181.6875 621.542236328125 181.5465545654297 621.5109252929688 181.4056091308594 C 621.1455078125 178.4248504638672 619.9866333007812 175.5746002197266 618.1699829101562 173.1576232910156 C 616.457763671875 170.881591796875 614.192138671875 169.0336456298828 611.5977172851562 167.7964477539062 C 614.7036743164062 165.4368896484375 616.5360107421875 161.7827301025391 616.5203857421875 157.9145355224609 C 616.6456909179688 153.5347595214844 614.3278198242188 149.431640625 610.4649047851562 147.2078247070312 C 608.9039916992188 146.3047180175781 607.1865844726562 145.7722625732422 605.4378051757812 145.5999908447266 L 605.4378051757812 145.6104278564453 C 605.3751220703125 145.6052093505859 605.3073120117188 145.5999908447266 605.2446899414062 145.5999908447266 C 604.0074462890625 145.5999908447266 603 146.6074981689453 603 147.8551330566406 C 603 148.9409484863281 603.7620849609375 149.8440399169922 604.780029296875 150.0580749511719 L 604.7748413085938 150.0998382568359 C 608.919677734375 150.3660583496094 612.23974609375 153.5973968505859 612.458984375 157.7213897705078 C 612.6521606445312 161.3390197753906 610.3917846679688 164.5233459472656 607.0664672851562 165.7083435058594 L 607.0717163085938 165.7187957763672 C 606.1686401367188 166.1259613037109 605.5421752929688 167.0395050048828 605.5421752929688 168.0992279052734 C 605.5421752929688 169.2946472167969 606.3408813476562 170.3021545410156 607.431884765625 170.6101379394531 L 607.4214477539062 170.6362457275391 C 612.7930908203125 171.98828125 616.8753662109375 176.4568176269531 617.4965209960938 182.0111541748047 L 617.5278930664062 182.2878265380859 L 617.5487670898438 182.2878265380859 C 617.621826171875 182.8933715820312 617.9820556640625 183.4362640380859 618.5301513671875 183.7599182128906 C 619.1669921875 184.1305541992188 619.9552612304688 184.1305541992188 620.5869140625 183.7599182128906 C 621.1350708007812 183.4414978027344 621.4900512695312 182.8985900878906 621.568359375 182.2878265380859 L 621.583984375 182.2878265380859 L 621.583984375 181.974609375 C 621.583984375 181.9432830810547 621.5787353515625 181.9119567871094 621.5735473632812 181.8963012695312 Z" fill="#eedbfc" fill-opacity="0.3" stroke="none" stroke-width="1" stroke-opacity="0.3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

class PromotionEarnPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PromotionEarnPageController());
  }
}
