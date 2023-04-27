import 'dart:developer';

import 'package:GCPay/res/style.dart';
import 'package:copy_paste/copy_paste.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:GCPay/GCPay/home_page/gc_home_page.dart';
import 'package:GCPay/GCPay/siteinfo_page/Model/SiteInfo_Data_entity.dart';
import 'package:GCPay/base/controller/base_controller.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';
import 'package:GCPay/http/apiservice/gcpay_api.dart';
import 'package:GCPay/routes/app_routes.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:GCPay/utils/lib_navigator.dart';
import 'package:group_button/group_button.dart';
import 'package:moment_dart/moment_dart.dart';

import 'Model/Wallet_History_entity.dart';

class ChangeTypeData {
  int changeType;
  String? changeName;

  ChangeTypeData(this.changeType, this.changeName);
}

class WalletHistoryPage extends BaseStatefulWidget<WalletHistoryController> {
  const WalletHistoryPage({Key? key}) : super(key: key);

  String getMoment(int intMoment)
  {
    final epoch = Moment.fromMillisecondsSinceEpoch(intMoment, isUtc: true,localization: MomentLocalizations.znCn());
    return epoch.format("YYYY-MM-DD  hh:mm:ssa").toString();
  }
  @override
  Widget buildContent(BuildContext context) {
    CacheService cacheService = Get.find<CacheService>();
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          /*Bubbles*/
          Pinned.fromPins(
            Pin(start: -120.0, end: 16.0),
            Pin(size: 506.0, end: -188.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 435.0, start: 0.0),
                  Pin(start: 71.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0x0c4486d5),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 279.0,
                    height: 279.0,
                    decoration: BoxDecoration(
                      color: const Color(0x0c4486d5),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*header*/
          Pinned.fromPins(
            Pin(size: 435.0, middle: 0.5),
            Pin(start: 0.0, end: 0.0),
            child: SizedBox(
              width: 355.0,
              height: 1090.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(Pin(size: 435.0, start: 0.0),
                      Pin(size: 787.0, start: -345.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage('assets/images/topBG.png'),
                          ),
                        ),
                      )),
                  Pinned.fromPins(
                    Pin(size: 150.2, middle: 0.4987),
                    Pin(size: 150.0, start: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 151.2, middle: 0.4987),
                          Pin(size: 160.0, start: 50.0),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment(0 ,0.9),
                                child: Container(
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: const AssetImage(
                                          'assets/images/gcpay.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
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
                    Pin(size: 36, start: 30),
                    Pin(size: 36, start: 40),
                    child: SizedBox(
                      height: 36.0,
                      width: 36.0,
                      child: IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () async {
                          // onBackPressed();
                          var canPop = navigator?.canPop();
                          if (canPop != null && canPop) {
                            Get.back();
                          } else {
                            SystemNavigator.pop();
                          }
                        },
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 435.0, start: 0.0),
                    Pin(size: 43.0, start: 180.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff15056d),
                      ),
                    ),
                  ),
                  // Pinned.fromPins(
                  //   Pin(size: 435.0, start: 0.0),
                  //   Pin(size: 43.0, start: 180.0),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: const Color(0xff15056d),
                  //     ),
                  //   ),
                  // ),
                  Pinned.fromPins(
                    Pin(size: 280.0, middle: 0.5),
                    Pin(size: 28.0, start: 190.0),
                    child: Text(
                      'wallethistory'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 18,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                      Pin(start: 5.0, end: 5.0), Pin(size: 150.0, start: 225.0),
                      child: Container(
                        child: GroupButton(
                          isRadio: false,
                          options:
                              GroupButtonOptions(spacing: 5, runSpacing: 5),
                          controller: controller.changegroupcontroller,
                          onSelected: (val, i, selected) {
                            controller.changeTypeIndex = i;
                            controller.intMessageType = i + 1;
                            controller.getUmsChange();
                          },
                          buttons: controller.changeGroupList,
                          buttonBuilder: (selected, data, context) {
                            bool pressAttention = false;
                            ChangeTypeData changeTypedata =
                                data as ChangeTypeData;
                            return Card(
                              color: changeTypedata.changeName ==
                                      controller
                                          .changeGroupList[
                                              controller.changeTypeIndex]
                                          .changeName
                                  ? Colors.blueAccent
                                  : Colors.white,
                              child: Container(
                                  height: 40,
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: Text(changeTypedata.changeName!)),
                            );
                          },
                        ),
                      )),
                  //scrollview
                  Obx(() => controller.walletRecordList.length > 0
                      ? Pinned.fromPins(
                          Pin(start: 35.0, end: 35.0),
                          Pin(start: 380.0, end: 0.0),
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.only(
                                left: 0, top: 10, right: 0, bottom: 50),
                            children:
                                controller.walletRecordList.map((itemData) {
                              return SizedBox(
                                width: 435.0,
                                height: 142.0,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromPins(
                                      Pin(start: 0.0, end: 0.0),
                                      Pin(size: 122.0, start: 30.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xffd3e0f0),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                              width: 1.0,
                                              color: const Color(0xff1d4f8b)),
                                        ),
                                      ),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 300.0, start: 22.0),
                                      Pin(size: 30.0, start: 30),
                                      child: Text(
                                        'ordernum'.tr+itemData.orderNo.toString(),
                                        style: TextStyle(
                                          fontFamily: 'Helvetica Neue',
                                          fontSize: 12,
                                          color: const Color(0xff5d5d5d),
                                        ),
                                        softWrap: false,
                                      ),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 50.0, end: 0.0),
                                      Pin(size: 40.0, start: 20),
                                      child: InkWell(
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          alignment:
                                          Alignment.center,
                                          decoration:
                                          const BoxDecoration(
                                            borderRadius:
                                            BorderRadius.only(
                                                bottomRight: Radius
                                                    .circular(
                                                    10.0),
                                                topRight: Radius
                                                    .circular(
                                                    10.0)),
                                          ),
                                          child: Image.asset(
                                            color: Colors.black
                                                .withOpacity(0.8),
                                            'assets/images/menuicon/copypaste.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                        ),
                                        onTap: () async {
                                          await CopyPaste
                                              .copyToClipboard(
                                              itemData.orderNo!);
                                          Fluttertoast.showToast(
                                              msg: "CopySuccess".tr,
                                              gravity: ToastGravity
                                                  .CENTER);
                                        },
                                      ),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 200.0, start: 20.0),
                                      Pin(size: 40.0, start: 50.0),
                                      child: Text(textAlign:TextAlign.left,
                                          'beforeamount'.tr+itemData.beforeChange!.toStringAsFixed(2)),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 200.0, end: 10.0),
                                      Pin(size: 40.0, start: 50.0),
                                      child: Text(textAlign:TextAlign.right,
                                          'afteramount'.tr+itemData.afterChange!.toStringAsFixed(2)),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 300.0, start: 20.0),
                                      Pin(size: 40.0, start: 75.0),
                                      child: Text(
                                          'changefee'.tr+itemData.fee!.toStringAsFixed(2)),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 80.0, start: 20.0),
                                      Pin(size: 40.0, start: 120.0),
                                      child: Text(
                                          'changeamount'.tr,
                                      ),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 200.0, start: 100.0),
                                      Pin(size: 40.0, start: 125.0),
                                      child: Text(
                                        itemData.gcChangeAmount!.toStringAsFixed(2),
                                        style: TextStyle(color: itemData.gcChangeAmount!.toDouble() >0?Colors.red:Colors.green),
                                      ),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 150.0, end: 10.0),
                                      Pin(size: 30.0, start: 200.0),
                                      child: Text(
                                        itemData.updateDate!,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontFamily: 'Helvetica Neue',
                                          fontSize: 12,
                                          color: const Color(0xff5d5d5d),
                                        ),
                                        softWrap: false,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      : Pinned.fromPins(
                          Pin(start: 35.0, end: 35.0),
                          Pin(start: 380.0, end: 0.0),
                          child: Pinned.fromPins(
                            Pin(start: 10.0, end: 10),
                            Pin(size: 164.0, start: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Color(0xffd5e0ee),
                              ),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/wallet_history.png',height: 60,),
                                  Container(height: 10,),
                                  Text('NoRecord'.tr,style: TextStyle(
                                    fontFamily: 'Helvetica Neue',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),)
                                ],),
                            ),
                          ),
                        ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool showTitleBar() => false;

  @override
  bool useLoadSir() => false;
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width - 0, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class WalletHistoryController extends BaseController {
  final GCPayApi gcpayApi;
  final CacheService cacheservice;
  WalletHistoryController(this.cacheservice, this.gcpayApi);
  RxList<WalletHistoryDataEntity> walletRecordList =
      <WalletHistoryDataEntity>[].obs;
  RxString rxMessageType = ''.obs;
  RxString rxMessageTitle = ''.obs;
  int intMessageType = 0;
  final changegroupcontroller = GroupButtonController(
    selectedIndex: 0,
    onDisablePressed: (i) => print('Button #$i is disabled'),
  );
  RxList<ChangeTypeData> changeGroupList = <ChangeTypeData>[
    ChangeTypeData(1, '卖币'),
    ChangeTypeData(2, '买币'),
    ChangeTypeData(3, '充值到商户'),
    ChangeTypeData(4, '商户下发'),
    ChangeTypeData(5, '人工充币'),
    ChangeTypeData(6, '人工扣币'),
    ChangeTypeData(7, '内部转账扣款'),
    ChangeTypeData(8, '内部转账加款'),
  ].obs;
  int changeTypeIndex = 0;
  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    var dataArguments = Get.parameters;
    rxMessageType.value = dataArguments['historytype']!;
    intMessageType = int.parse(rxMessageType.value);
    if (intMessageType == 1) {
      rxMessageTitle.value = 'Message'.tr;
    } else if (intMessageType == 3) {
      rxMessageTitle.value = 'notification'.tr;
    }

    getUmsChange();
  }

  Future<void> getUmsChange() async {
    try {
      Map<String, dynamic> data = <String, dynamic>{
        'changeType': intMessageType
      };
      var response = await gcpayApi.getUmsChange(data);
      if (response.code == 400) {}
      if (response.code == 200) {
        walletRecordList.value = response.data!;
        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }
}

class WalletHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        WalletHistoryController(Get.put(CacheService()), Get.put(GCPayApi())));
  }
}

const String _svg_ehpyic =
    '<svg viewBox="33.0 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_z8oh =
    '<svg viewBox="33.2 494.0 381.5 1.0" ><path transform="translate(33.25, 494.0)" d="M 0 0 L 381.50048828125 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_laip3x =
    '<svg viewBox="33.2 658.0 381.5 1.0" ><path transform="translate(33.25, 658.0)" d="M 0 0 L 381.50048828125 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
