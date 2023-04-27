import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:GCPay/GCPay/home_page/gc_home_page.dart';
import 'package:GCPay/GCPay/siteinfo_page/Model/SiteInfo_Data_entity.dart';
import 'package:GCPay/base/controller/base_controller.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';
import 'package:GCPay/http/apiservice/gcpay_api.dart';
import 'package:GCPay/routes/app_routes.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:GCPay/utils/lib_navigator.dart';

class PushMessagePage extends BaseStatefulWidget<PushMessageController> {
  const PushMessagePage({Key? key}) : super(key: key);
  @override
  Widget buildContent(BuildContext context) {
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
                  Pinned.fromPins(
                    Pin(start: -124.0, end: -124.0),
                    Pin(size: 787.0, start: -615.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff2072d3),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 150.2, middle: 0.4987),
                    Pin(size: 150.0, start: 39.0),
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 100.0, end: 22.0),
                          Pin(size: 100.0, middle: 0.0935),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    const AssetImage('assets/images/gcpay.png'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 36, start: 40),
                    Pin(size: 36, start: 40),
                    child: SizedBox(
                      height: 36.0,
                    width: 36.0,
                    child:IconButton(
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
                  )),
                  /*body*/
                  Pinned.fromPins(
                    Pin(size: 440.0, start: 50.0),
                    Pin(size: 43.0, start: 180.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff15056d),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 180.0, middle: 0.5),
                    Pin(size: 22.0, start: 190.0),
                    child: Text(
                      'Message'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 18,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  //scrollview
                  Pinned.fromPins(
                    Pin(size: 365.0, middle: 0.5),
                    Pin(start: 223.0, end: 0.0),
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfeffffff).withOpacity(0.9),
                        ),
                        child: SizedBox(
                          width: 355.0,
                          height: 1000.0,
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    spacing: 20,
                                    runSpacing: 12,
                                    children:
                                        controller.siteInfoList.map((itemData) {
                                      return SizedBox(
                                        width: 355.0,
                                        height: 142.0,
                                        child: Stack(
                                          children: <Widget>[
                                            Pinned.fromPins(
                                              Pin(size: 346.0, start: 9.5),
                                              Pin(size: 122.0, start: 30.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffd3e0f0),
                                                  borderRadius:
                                                      BorderRadius.circular(10.0),
                                                  border: Border.all(
                                                      width: 1.0,
                                                      color: const Color(
                                                          0xff1d4f8b)),
                                                ),
                                              ),
                                            ),
                                            Pinned.fromPins(
                                              Pin(size: 300.0, start: 22.0),
                                              Pin(size: 30.0, start: 40),
                                              child: Text(itemData.headline.toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Helvetica Neue',
                                                  fontSize: 12,
                                                  color: const Color(0xff5d5d5d),
                                                ),
                                                softWrap: false,
                                              ),
                                            ),
                                            Pinned.fromPins(
                                              Pin(size: 300.0, end: -80.0),
                                              Pin(size: 30.0, start: 70.0),
                                              child: Text(itemData.content.toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Helvetica Neue',
                                                  fontSize: 12,
                                                  color: const Color(0xff5d5d5d),
                                                ),
                                                softWrap: false,
                                              ),
                                            ),
                                            Pinned.fromPins(
                                              Pin(size: 300.0, start: 22.0),
                                              Pin(size: 30.0, start: 55.0),
                                              child: Text(itemData.remark.toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Helvetica Neue',
                                                  fontSize: 12,
                                                  color: const Color(0xff5d5d5d),
                                                ),
                                                softWrap: false,
                                              ),
                                            ),
                                            Pinned.fromPins(
                                              Pin(size: 300.0, end: 33.0),
                                              Pin(size: 30.0, start: 200.0),
                                              child: Text(itemData.updateDate.toString(),
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
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
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

class PushMessageController extends BaseController {
  final GCPayApi gcpayApi;
  final CacheService cacheservice;
  PushMessageController(this.cacheservice, this.gcpayApi);
  RxList<SiteInfoDataEntity> siteInfoList = <SiteInfoDataEntity>[].obs;

  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    getSiteInfo();
  }

  Future<void> getSiteInfo() async {
    try {
      Map<String, dynamic> data = <String, dynamic>{'type':1};
      var response = await gcpayApi.getZmsSitMailInfo(data);
      if (response.code == 400) {}
      if (response.code == 200) {
        siteInfoList.value = response.data!;
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

class SiteInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => PushMessageController(Get.put(CacheService()), Get.put(GCPayApi())));
  }
}

const String _svg_ehpyic =
    '<svg viewBox="33.0 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_z8oh =
    '<svg viewBox="33.2 494.0 381.5 1.0" ><path transform="translate(33.25, 494.0)" d="M 0 0 L 381.50048828125 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_laip3x =
    '<svg viewBox="33.2 658.0 381.5 1.0" ><path transform="translate(33.25, 658.0)" d="M 0 0 L 381.50048828125 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
