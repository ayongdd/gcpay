import 'dart:developer';

import 'package:GCPay/res/style.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:GCPay/GCPay/home_page/gc_home_page.dart';
import 'package:GCPay/GCPay/siteinfo_page/Model/SiteInfo_Data_entity.dart';
import 'package:GCPay/base/controller/base_controller.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';
import 'package:GCPay/http/apiservice/gcpay_api.dart';
import 'package:GCPay/routes/app_routes.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:GCPay/utils/lib_navigator.dart';

class MessageDetailPage extends BaseStatefulWidget<MessageDetailController> {
  const MessageDetailPage({Key? key}) : super(key: key);

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
                  Pinned.fromPins(
                      Pin(size: 435.0, start: 0.0),
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
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 110,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: const AssetImage(
                                              'assets/images/gcpay.png'),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
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

                  Pinned.fromPins(
                      Pin(size: 280.0, middle: 0.5),
                      Pin(size: 22.0, start: 190.0),
                      child: Obx(
                            () => Text(
                          controller.rxMessageTitle.value,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 18,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )),
                  //scrollview
                          Obx(() => controller.siteInfoData != null?
                  Pinned.fromPins(
                    Pin(start: 35.0, end: 35.0),
                    Pin(start: 223.0, end: 0.0),
                    child: SizedBox(
                      width: 435.0,
                      height: 142.0,
                      child: Stack(
                        children: <Widget>[
                          InkWell(
                              child: Pinned.fromPins(
                                Pin(start: 0.0, end: 0.0),
                                Pin(size: 300.0, start: 30.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffd3e0f0),
                                    borderRadius:
                                    BorderRadius.circular(10.0),
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color(
                                            0xff1d4f8b)),
                                  ),
                                ),
                              )),
                          Pinned.fromPins(
                            Pin(size: 300.0, start: 22.0),
                            Pin(size: 30.0, start: 40),
                            child:  InkWell(
                                child: Text(
                                  controller.siteInfoData.value.headline.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Helvetica Neue',
                                    fontSize: 12,
                                    color: const Color(0xff5d5d5d),
                                  ),
                                  softWrap: false,
                                )),
                          ),
                          Pinned.fromPins(
                            Pin(start: 20.0, end: 20.0),
                            Pin(size: 220.0, start: 60.0),
                            child: InkWell(
                                child: ListView(children: [                                HtmlWidget(
                                    controller.siteInfoData.value.content.toString())],),),
                          ),
                          Pinned.fromPins(
                            Pin(size: 120.0, end: 10.0),
                            Pin(size: 30.0, start: 300.0),
                            child:  InkWell(
                                child: Text(
                                  controller.siteInfoData.value.updateDate.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Helvetica Neue',
                                    fontSize: 12,
                                    color: const Color(0xff5d5d5d),
                                  ),
                                  softWrap: false,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ):Container()),
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

class MessageDetailController extends BaseController {
  final GCPayApi gcpayApi;
  final CacheService cacheservice;
  MessageDetailController(this.cacheservice, this.gcpayApi);
  Rx<SiteInfoDataEntity> siteInfoData = SiteInfoDataEntity(0,'','','','','',0).obs;
  RxString rxMessageTitle = ''.obs;
  int intMessageType = 0;
  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    var dataArguments = Get.parameters;
    rxMessageTitle.value = 'MessageDetail'.tr;
    siteInfoData.value = cacheservice.siteInfoData;
  }

}

class MessageDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => MessageDetailController(Get.put(CacheService()), Get.put(GCPayApi())));
  }
}

const String _svg_ehpyic =
    '<svg viewBox="33.0 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_z8oh =
    '<svg viewBox="33.2 494.0 381.5 1.0" ><path transform="translate(33.25, 494.0)" d="M 0 0 L 381.50048828125 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_laip3x =
    '<svg viewBox="33.2 658.0 381.5 1.0" ><path transform="translate(33.25, 658.0)" d="M 0 0 L 381.50048828125 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
