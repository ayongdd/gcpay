import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../base/controller/base_controller.dart';
import '../../../base/pageWidget/base_stateful_widget.dart';
import '../../../http/apiservice/gcpay_api.dart';
import '../../../http/apiservice/haxi_api.dart';
import '../../../res/colors.dart';
import '../../../utils/sp_utils.dart';
import '../model/BetRecord_Data_entity.dart';

class BetRecordPage extends BaseStatefulWidget<BetRecordController> {
  BetRecordPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 355.0, middle: 0.5),
            Pin(start: 10.0, end: 10.0),
            child: Obx(() => SingleChildScrollView(
                  primary: false,
                  child: SizedBox(
                    width: 355.0,
                    height: 688.0,
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            primary: false,
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 20,
                              runSpacing: 11,
                              children: controller.betList.map((itemData) {
                                final text = itemData.value!;
                                return SizedBox(
                                  width: 380.0,
                                  height: 142.0,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xfeffffff),
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                      ),
                                      Pinned.fromPins(
                                        Pin(size: 80.0, start: 22.0),
                                        Pin(size: 17.0, start: 10),
                                        child: Text(
                                          'Withdrawal address'.tr,
                                          style: TextStyle(
                                            fontFamily: 'PingFang SC',
                                            fontSize: 12,
                                            color: const Color(0xff707070),
                                          ),
                                          softWrap: false,
                                        ),
                                      ),
                                      Pinned.fromPins(
                                        Pin(size: 100.0, end: 10.0),
                                        Pin(size: 17.0, start: 10),
                                        child: Text(
                                          SPUtils.getGamePlayName(
                                              itemData.playType!),
                                          style: TextStyle(
                                            fontFamily: 'PingFang SC',
                                            fontSize: 12,
                                            color: const Color(0xff707070),
                                          ),
                                          textAlign: TextAlign.right,
                                          softWrap: false,
                                        ),
                                      ),
                                      Pinned.fromPins(
                                          Pin(size: 200.0, start: 24.0),
                                          Pin(size: 33.0, start: 85),
                                          child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text:
                                                      'Amount of USDT withdrawn:'
                                                              .tr +
                                                          " ",
                                                  style: TextStyle(
                                                      fontFamily: 'PingFang SC',
                                                      fontSize: 12,
                                                      color: const Color(
                                                          0xff707070))),
                                              TextSpan(
                                                  text: itemData.value
                                                          .toString() +
                                                      " " +
                                                      itemData.symbol
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xff707070))),
                                            ]),
                                          )),
                                      Pinned.fromPins(
                                          Pin(size: 200.0, start: 24.0),
                                          Pin(size: 33.0, start: 110),
                                          child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Reward Amount:'.tr + " ",
                                                style: TextStyle(
                                                  fontFamily: 'PingFang SC',
                                                  fontSize: 12,
                                                  color:
                                                      const Color(0xff707070),
                                                ),
                                              ),
                                              TextSpan(
                                                text: itemData.payout
                                                        .toString() +
                                                    " " +
                                                    itemData.symbol.toString(),
                                                style: TextStyle(
                                                    color: itemData.payout! > 0
                                                        ? ColorStyle
                                                            .color_24CF5F
                                                        : ColorStyle
                                                            .color_EA4C43),
                                              ),
                                            ]),
                                          )),
                                      Pinned.fromPins(
                                        Pin(size: 130.0, end: 21.0),
                                        Pin(size: 15.0, start: 100),
                                        child: Text(
                                          itemData.createDate!,
                                          style: TextStyle(
                                            fontFamily: 'PingFang SC',
                                            fontSize: 12,
                                            color: const Color(0xff707070),
                                          ),
                                          softWrap: false,
                                        ),
                                      ),
                                      Pinned.fromPins(
                                        Pin(start: 24.0, end: 31.0),
                                        Pin(size: 30.0, start: 35),
                                        child: Stack(
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xfff4f4f4),
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                                border: Border.all(
                                                    width: 1.0,
                                                    color: const Color(
                                                        0xffd8d8d8)),
                                              ),
                                            ),
                                            Pinned.fromPins(
                                              Pin(size: 280.0, start: 10.0),
                                              Pin(size: 17.0, middle: 0.5),
                                              child: Text(
                                                itemData.fromAddress!,
                                                style: TextStyle(
                                                  fontFamily: 'PingFang SC',
                                                  fontSize: 12,
                                                  color:
                                                      const Color(0xff707070),
                                                ),
                                                softWrap: false,
                                              ),
                                            ),
                                          ],
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
                )),
          ),
        ],
      ),
    );
  }

  @override
  bool appBarBackgroundColor() {
    return true;
  }

  @override
  String titleString() {
    return "BettingRecord".tr;
  }
}

const String _svg_gu7j7h =
    '<svg viewBox="25.1 53.5 7.4 14.9" ><path transform="translate(-3056.39, -5242.41)" d="M 3088.940673828125 5295.9091796875 L 3081.505859375 5303.34423828125 L 3088.940673828125 5310.77880859375" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

class BetRecordController extends BaseController {
  RxString rxTransferType = 'usdt'.obs;
  final GCPayApi _gcpayApi = Get.find<GCPayApi>();
  RxList<BetRecordDataEntity> betList = <BetRecordDataEntity>[].obs;
  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    getBetRecordInfo();
  }

  Future<void> getBetRecordInfo() async {
    try {
      Map<String, dynamic> data = <String, dynamic>{
        'timeType': 'month',
        'transferType': 'trx',
      };
      var response;// = await _gcpayApi.getTronInRecord(data);
      if (response.code == 401) {
        // Get.toNamed(Routes.LOGIN);
      }
      if (response.code == 200) {
        //return json.decode(response.body);
        betList.value = response.data!;
        change(response.data, status: RxStatus.success());
        if (betList.value.length <= 0) {
          change(null, status: RxStatus.empty());
        }
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

class BetRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BetRecordController());
  }
}
