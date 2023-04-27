import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';

import '../../base/controller/base_controller.dart';
import '../../constant/http_url.dart';
import '../../http/apiservice/gcpay_api.dart';
import '../../services/cache_service.dart';
import 'models/Google_Auth_entity.dart';

class GoogleAuthorizationPage extends BaseStatefulWidget<GoogleAuthorizationController> {
  const GoogleAuthorizationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    final themeData = Theme.of(context);
    final backgroundColor = themeData.colorScheme.surfaceVariant;
    final foregroundColor = themeData.colorScheme.surface;
    final primaryTextTheme = themeData.textTheme;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    //statusBar height
    statusBarHeight +
        //pinned SliverAppBar height in header
        kToolbarHeight;
    return Scaffold(
      body: ExtendedNestedScrollView(
        onlyOneScrollInBody: false,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 170,
              pinned: false,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: SizedBox(
                  child: Stack(
                    children: <Widget>[
                     Align(
                          alignment: Alignment(0.0, -1.0),
                          child: Container(
                            width: double.infinity,
                            height: 185,
                            child: Image.asset(
                              'assets/images/topBG.png',
                              fit: BoxFit.fill,
                            ),
                          )),
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
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(
                width: 284.0,
                height: 800.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 200.0, start: 0.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 43.0, end: 500.0),
                            child: Container(
                              height: 45,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Color(0xff15056d),
                              ),
                              child: Align(
                                alignment: Alignment(0.02, 0.170),
                                child: SizedBox(
                                  width: 200.0,
                                  height: 28.0,
                                  child: Text(
                                    'googleauthorization'.tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 18,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 380.0, middle: 0.5),
                      Pin(start: 44.0, end: 10.0),
                      child: SizedBox(
                        width: 380.0,
                        height: 700.0,
                        child: Stack(
                          children: <Widget>[
                            /*Bubbles*/
                            Pinned.fromPins(
                              Pin(start: -120.0, end: 16.0),
                              Pin(size: 506.0, end: -100.0),
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
                            //box1
                            Pinned.fromPins(
                              Pin(size: 250.0, start: 20.0),
                              Pin(size: 20.0, start: 20.0),
                              child: Text(
                                'scanbarcodetitle'.tr,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 16,
                                  color: const Color(0xff1d4f8b),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 350.0, start: 20.0),
                              Pin(size: 60.0, start: 57.0),
                              child: Text(
                                'scanbarcodecontent'.tr,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 15,
                                  color: const Color(0xff1d4f8b),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 120.0, middle: 0.5),
                              Pin(size: 120.0, start: 130.0),
                              child: Obx(
                                      () => controller.rxGoogleAuth.value.qrBarcodeUrl!.length >0? Container(
                                  width: 120,
                                  child: Card(
                                    elevation: 4,  // Change this
                                    shadowColor: Colors.black12,
                                    child:
                                    CachedNetworkImage(
                                      width: 100,
                                      imageUrl: controller
                                          .rxGoogleAuth
                                          .value.qrBarcodeUrl!
                                          .contains(
                                          'http') ||
                                          controller
                                              .rxGoogleAuth
                                              .value.qrBarcodeUrl!
                                              .contains(
                                              'https')
                                          ? controller
                                          .rxGoogleAuth
                                          .value.qrBarcodeUrl!
                                          : HttpUrl
                                          .BASE_GCPAY_URL +
                                          controller
                                              .rxGoogleAuth
                                              .value.qrBarcodeUrl!,
                                      imageBuilder: (context,
                                          imageProvider) =>
                                          Container(
                                            width: 100,
                                            decoration:
                                            BoxDecoration(
                                              image:
                                              DecorationImage(
                                                image:
                                                imageProvider,
                                                fit: BoxFit
                                                    .cover,
                                              ),
                                            ),
                                          ),
                                      placeholder: (context,
                                          url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context,
                                          url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  )):Container()),
                            ),
                            //box2
                            Pinned.fromPins(
                              Pin(size: 346.0, start: 17.0),
                              Pin(size: 50.0, start: 350.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      width: 2.0,
                                      color: const Color(0xff1d4f8b)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x29000000),
                                      offset: Offset(0, 2),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 300.0, start: 63.0),
                              Pin(size: 45.0, start: 378),
                              child: TextFormField(
                                controller: controller.googleAuthController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  helperText: ' ',
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: 'enter6digitalcodehint'.tr,
                                  contentPadding: EdgeInsets.only(
                                      left: 0,
                                      right: 0,
                                      top: 13,
                                      bottom: 0),
                                  hintStyle: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 14,
                                      color: const Color(0xff707070),
                                      fontWeight: FontWeight.w500,
                                      height: 0.7),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 0, 4, 21),
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 15,
                                  color: const Color(0xff5d5d5d),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 250.0, start: 20.0),
                              Pin(size: 20.0, start: 270.0),
                              child: Text(
                                'enter6digitalcodetitle'.tr,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 16,
                                  color: const Color(0xff1d4f8b),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 350.0, start: 20.0),
                              Pin(size: 60.0, start: 300.0),
                              child: Text(
                                'enter6digitalcodecontent'.tr,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 15,
                                  color: const Color(0xff1d4f8b),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(start: 20.0, end: 20.0),
                              Pin(size: 100.0, start: 400.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              32.0)),
                                      minimumSize: Size(
                                          120, 40), //////// HERE
                                    ),
                                    onPressed: () {
                                      controller.bindGoogleAuthInfo(1,controller.googleAuthController.text);
                                    },
                                    child: Text('enablegoogleauth'.tr),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              32.0)),
                                      minimumSize: Size(
                                          120, 40), //////// HERE
                                    ),
                                    onPressed: () {
                                      controller.bindGoogleAuthInfo(0,controller.googleAuthController.text);
                                    },
                                    child: Text('disablegoogleauth'.tr),
                                  ),
                              ],),
                            ),
                          ],
                        ),
                      ),
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

class GoogleAuthorizationController extends BaseController {
  final GCPayApi gcpayApi;
  final CacheService cacheservice;
  final googleAuthController = TextEditingController();

  Rx<GoogleAuthDataEntity> rxGoogleAuth =
      GoogleAuthDataEntity('', '', 0).obs;

  GoogleAuthorizationController(this.cacheservice, this.gcpayApi);



  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    getGoogleAuthInfo();
  }

  Future<void> getGoogleAuthInfo() async {
    try {
      var response = await gcpayApi.getGoogleQrCode();
      if (response.code == 400) {}
      if (response.code == 200) {
        rxGoogleAuth.value = response.data!;

      } else {}
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future<void> bindGoogleAuthInfo(int intBinding,String strVerifyCode) async {
    try {
      if(strVerifyCode.length < 6)
        {
          Fluttertoast.showToast(msg: 'enter6digitalcodehint'.tr,gravity: ToastGravity.CENTER);
          return;
        }
      Map<String, dynamic> data = <String, dynamic>{
        'googleAuthFlag': intBinding,
        'verificationCode': int.parse(strVerifyCode),
      };
      var response = await gcpayApi.bindGoogleQrCode(data);
      Fluttertoast.showToast(msg: response.msg!,gravity: ToastGravity.CENTER);
      if (response.code == 400) {}
      if (response.code == 200) {
          Get.back();
      } else {}
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }
}

class GoogleAuthorizationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
            () => GoogleAuthorizationController(Get.put(CacheService()), Get.put(GCPayApi())));
  }
}


const String _svg_ehpyic =
    '<svg viewBox="33.0 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
