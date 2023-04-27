import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:copy_paste/copy_paste.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:GCPay/routes/app_routes.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:images_picker/images_picker.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../base/controller/base_controller.dart';
import '../../base/pageWidget/base_stateful_widget.dart';
import '../../constant/http_url.dart';
import '../../http/apiservice/gcpay_api.dart';
import '../../res/colors.dart';
import '../../services/lang/localization_service.dart';
import '../../utils/permission_handle.dart';
import '../../widget/webview_page.dart';
import '../Model/UploadPaymentPic_Data_entity.dart';

class _BottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  final double bottomSheetOffset;

  const _BottomSheet({
    required this.scrollController,
    required this.bottomSheetOffset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: scrollController,
      children: [
        Text(
          'position $bottomSheetOffset',
          style: Theme.of(context).textTheme.headline6,
        ),
        Column(
          children: [Text('useragreementcontent'.tr)],
        ),
      ],
    );
  }
}

class UserCenterPage extends BaseStatefulWidget<UserCenterController> {
  const UserCenterPage({Key? key}) : super(key: key);

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
                          Pin(size: 160.0, start: 39.0),
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromPins(Pin(size: 70.0, middle: 0.5),
                                  Pin(size: 70.0, start: 50),
                                  child: InkWell(
                                    child: CircleAvatar(
                                        child: Obx(
                                      () => controller.rxStrPath.value.length >
                                              0
                                          ? CachedNetworkImage(
                                              height: 100,
                                              width: 100,
                                              imageUrl: HttpUrl.BASE_GCPAY_URL +
                                                  controller.rxStrPath.value,
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                            )
                                          : Container(
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
                                    )),
                                    onTap: () async {
                                      controller.getImage();
                                    },
                                  )),
                              Pinned.fromPins(
                                Pin(size: 149.0, middle: -15.0),
                                Pin(size: 24.0, start: 130.0),
                                child: Text(
                                  'user'.tr +
                                      cacheService.userNickNameString.value,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontFamily: 'Helvetica Neue',
                                    fontSize: 15,
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 149.0, middle: 30.0),
                                Pin(size: 24.0, start: 118.0),
                                child: IconButton(
                                  icon: const Icon(
                                    FontAwesomeIcons.edit,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    controller.getImage();
                                  },
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
                  /*body*/
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
                    child: Text(
                      'walletaddress'.tr +
                          ':' +
                          cacheService.userTrc20AddressString.value,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 40.0, end: 40),
                    Pin(size: 22.0, start: 190.0),
                    child: InkWell(
                      child: Container(
                        height: 55,
                        width: 45,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                        ),
                        child: Image.asset(
                          'assets/images/menuicon/copypaste.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      onTap: () async {
                        await CopyPaste.copyToClipboard(
                            cacheService.userTrc20AddressString.value);
                        Fluttertoast.showToast(
                            msg: "CopySuccess".tr,
                            gravity: ToastGravity.CENTER);
                      },
                    ),
                  ),
                  //scrollview
                  Pinned.fromPins(
                    Pin(size: 365.0, middle: 0.5),
                    Pin(start: 223.0, end: 0.0),
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0x00000000).withOpacity(0.0),
                        ),
                        child: SizedBox(
                          width: 435.0,
                          height: 550.0,
                          child: Stack(
                            children: <Widget>[
                              /*box1-Modify*/
                              Pinned.fromPins(Pin(start: 10.0, end: 10.0),
                                  Pin(size: 41.0, start: 30.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffd3e0f0),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 1.0,
                                            color: const Color(0xffd4d4d4)),
                                      ),
                                    ),
                                    onTap: () {
                                      Get.toNamed(AppRoutes.ModifyPassPage);
                                    },
                                  )),
                              Pinned.fromPins(
                                Pin(size: 88.0, start: 266.0),
                                Pin(size: 41.0, start: 30.1),
                                child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xff4486d5)),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.ModifyPassPage);
                                  },
                                ),
                              ),
                              Pinned.fromPins(Pin(size: 241.0, start: 30.0),
                                  Pin(size: 20.0, start: 40.0),
                                  child: InkWell(
                                    child: Text(
                                      'modifyloginpass'.tr,
                                      style: TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 15,
                                        color: const Color(0xff5d5d5d),
                                      ),
                                    ),
                                    onTap: () {
                                      Get.toNamed(AppRoutes.ModifyPassPage);
                                    },
                                  )),
                              Pinned.fromPins(
                                Pin(size: 9.8, start: 308.0),
                                Pin(size: 19.7, start: 40.0),
                                child: InkWell(
                                  child: SvgPicture.string(
                                    _svg_khxxur,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.ModifyPassPage);
                                  },
                                ),
                              ),
                              /*box2-Change*/
                              Pinned.fromPins(Pin(start: 10.0, end: 10.0),
                                  Pin(size: 41.0, start: 90.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffd3e0f0),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 1.0,
                                            color: const Color(0xffd4d4d4)),
                                      ),
                                    ),
                                    onTap: () {
                                      Get.toNamed(AppRoutes.ModPaymentPassPage);
                                    },
                                  )),
                              Pinned.fromPins(
                                Pin(size: 88.0, start: 266.0),
                                Pin(size: 41.0, start: 90.0),
                                child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xff4486d5)),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.ModPaymentPassPage);
                                  },
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 9.8, start: 308.0),
                                Pin(size: 19.7, start: 100.0),
                                child: InkWell(
                                  child: SvgPicture.string(
                                    _svg_khxxur,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.ModPaymentPassPage);
                                  },
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 241.0, start: 30.0),
                                Pin(size: 20.0, start: 100.0),
                                child: InkWell(
                                  child: Text(
                                    'modifypaymentpass'.tr,
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 15,
                                      color: const Color(0xff5d5d5d),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.ModPaymentPassPage);
                                  },
                                ),
                              ),
                              /*box3-Login*/
                              Pinned.fromPins(Pin(start: 10.0, end: 10.0),
                                  Pin(size: 41.0, start: 150.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffd3e0f0),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 1.0,
                                            color: const Color(0xffd4d4d4)),
                                      ),
                                    ),
                                    onTap: () {
                                      Get.toNamed(AppRoutes.DeviceManagerPage);
                                    },
                                  )),
                              Pinned.fromPins(
                                Pin(size: 88.0, start: 266.0),
                                Pin(size: 41.0, start: 150.1),
                                child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xff4486d5)),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.DeviceManagerPage);
                                  },
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 9.8, start: 308.0),
                                Pin(size: 19.7, start: 160.0),
                                child: InkWell(
                                  child: SvgPicture.string(
                                    _svg_khxxur,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.DeviceManagerPage);
                                  },
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 241.0, start: 30.0),
                                Pin(size: 20.0, start: 160.0),
                                child: InkWell(
                                  child: Text(
                                    'devicemanagement'.tr,
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 15,
                                      color: const Color(0xff5d5d5d),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.DeviceManagerPage);
                                  },
                                ),
                              ),
                              /*box4-MyCustomer*/
                              Pinned.fromPins(Pin(start: 10.0, end: 10.0),
                                  Pin(size: 41.0, start: 210.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffd3e0f0),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 1.0,
                                            color: const Color(0xffd4d4d4)),
                                      ),
                                    ),
                                    onTap: () {
                                      Get.to(WebViewPage(
                                        strUrl:
                                            cacheService.rxServiceLink.value,
                                        strTitle: 'customerService'.tr,
                                        blNavigation: false,
                                      ));
                                    },
                                  )),
                              Pinned.fromPins(
                                Pin(size: 20.0, start: 266.0),
                                Pin(size: 26.0, start: 225.0),
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromPins(
                                      Pin(size: 88.0, end: 0.0),
                                      Pin(size: 41.0, start: 48.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xffffffff),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                              width: 1.0,
                                              color: const Color(0xff4486d5)),
                                        ),
                                      ),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 9.8, end: -30.8),
                                      Pin(size: 19.7, middle: -0.6216),
                                      child: InkWell(
                                        child: SvgPicture.string(
                                          _svg_khxxur,
                                          allowDrawingOutsideViewBox: true,
                                          fit: BoxFit.fill,
                                        ),
                                        onTap: () {
                                          Get.to(WebViewPage(
                                            strUrl: cacheService
                                                .rxServiceLink.value,
                                            strTitle: 'customerService'.tr,
                                            blNavigation: false,
                                          ));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 241.0, start: 30.0),
                                Pin(size: 20.0, start: 220.0),
                                child: InkWell(
                                  child: Text(
                                    'mycustomerservice'.tr,
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 15,
                                      color: const Color(0xff5d5d5d),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.to(WebViewPage(
                                      strUrl: cacheService.rxServiceLink.value,
                                      strTitle: 'customerService'.tr,
                                      blNavigation: false,
                                    ));
                                  },
                                ),
                              ),
                              /*box5-AboutUs*/
                              Pinned.fromPins(
                                Pin(start: 10.0, end: 10.0),
                                Pin(size: 41.0, start: 270.0),
                                child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffd3e0f0),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xffd4d4d4)),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.AboutUsPage);
                                  },
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 88.0, start: 266.0),
                                Pin(size: 41.0, start: 270.0),
                                child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xff4486d5)),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.AboutUsPage);
                                  },
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 9.8, start: 308.0),
                                Pin(size: 19.7, start: 280.0),
                                child: InkWell(
                                  child: SvgPicture.string(
                                    _svg_khxxur,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.AboutUsPage);
                                  },
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 241.0, start: 30.0),
                                Pin(size: 20.0, start: 280.0),
                                child: InkWell(
                                  child: Text(
                                    'aboutus'.tr,
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 15,
                                      color: const Color(0xff5d5d5d),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.AboutUsPage);
                                  },
                                ),
                              ),
                              /*box6-Feedback*/
                              Pinned.fromPins(
                                Pin(start: 10.0, end: 10.0),
                                Pin(size: 41.0, start: 330.0),
                                child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffd3e0f0),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xffd4d4d4)),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.to(WebViewPage(
                                      strUrl: cacheService.rxHelpLink.value,
                                      strTitle: 'myhelp'.tr,
                                      blNavigation: false,
                                    ));
                                  },
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 88.0, start: 266.0),
                                Pin(size: 41.0, start: 330.0),
                                child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xff4486d5)),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.to(WebViewPage(
                                      strUrl: cacheService.rxHelpLink.value,
                                      strTitle: 'myhelp'.tr,
                                      blNavigation: false,
                                    ));
                                  },
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 9.8, start: 308.0),
                                Pin(size: 19.7, start: 340.0),
                                child: InkWell(
                                  child: SvgPicture.string(
                                    _svg_khxxur,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                  onTap: () {
                                    Get.to(WebViewPage(
                                      strUrl: cacheService.rxHelpLink.value,
                                      strTitle: 'myhelp'.tr,
                                      blNavigation: false,
                                    ));
                                  },
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 241.0, start: 30.0),
                                Pin(size: 20.0, start: 340.0),
                                child: InkWell(
                                  child: Text(
                                    'myhelp'.tr,
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 15,
                                      color: const Color(0xff5d5d5d),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.to(WebViewPage(
                                      strUrl: cacheService.rxHelpLink.value,
                                      strTitle: 'myhelp'.tr,
                                      blNavigation: false,
                                    ));
                                  },
                                ),
                              ),
                              /*box7-Verified*/
                              Pinned.fromPins(
                                Pin(start: 10.0, end: 10.0),
                                Pin(size: 41.0, start: 390.0),
                                child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffd3e0f0),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xffd4d4d4)),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.VerifyPage);
                                  },
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 88.0, start: 266.0),
                                Pin(size: 41.0, start: 390.0),
                                child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xff4486d5)),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.VerifyPage);
                                  },
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 9.8, start: 308.0),
                                Pin(size: 19.7, start: 401.0),
                                child: SvgPicture.string(
                                  _svg_khxxur,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 241.0, start: 30.0),
                                Pin(size: 20.0, start: 401.0),
                                child: InkWell(
                                  child: Text(
                                    'verifiedauth'.tr,
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 15,
                                      color: const Color(0xff5d5d5d),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.VerifyPage);
                                  },
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(start: 30.0, end: 30.0),
                                Pin(size: 43.0, start: 500.0),
                                child: InkWell(
                                  onTap: () {
                                    CacheService cachservice =
                                        Get.find<CacheService>();
                                    cachservice.logOut();
                                    Get.offNamed(AppRoutes.LoginPage);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xff15056d),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 150.0, middle: 0.5),
                                Pin(size: 20.0, start: 460.0),
                                child: InkWell(
                                  child: Obx(() => Text(
                                        'version'.tr +
                                            controller.rxStrVersion.value,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Helvetica Neue',
                                          fontSize: 15,
                                          color: const Color(0xff5d5d5d),
                                        ),
                                      )),
                                  onTap: () {
                                    controller.rxIntVersionClick.value++;
                                    if (controller.rxIntVersionClick.value >
                                        9) {
                                      showSheetWithoutList();
                                      controller.rxIntVersionClick.value = 0;
                                    }
                                  },
                                ),
                              ),
                              Pinned.fromPins(Pin(size: 200.0, start: 150.0),
                                  Pin(size: 25.0, start: 510.0),
                                  child: InkWell(
                                    onTap: () {
                                      CacheService cachservice =
                                          Get.find<CacheService>();
                                      cachservice.logOut();
                                      JPush jpush = JPush();
                                      jpush.deleteAlias();
                                      Get.offNamed(AppRoutes.LoginPage);
                                    },
                                    child: Text(
                                      'signout'.tr,
                                      style: TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 18,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  )),
                              /*End*/
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
  bool showTitleBar() {
    return false;
  }

  @override
  bool useLoadSir() => false;

  void showSheetWithoutList() {
    showStickyFlexibleBottomSheet<void>(
      minHeight: 0,
      initHeight: 0.6,
      maxHeight: .601,
      headerHeight: 50,
      context: Get.context!,
      isSafeArea: false,
      bottomSheetColor: Color(0xffffffff),
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
      ),
      headerBuilder: (context, offset) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xff15056d),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                            controller.selectedRadio.value = 0;
                          },
                          child: Text(
                            'cancel'.tr,
                            style: TextStyle(
                                fontSize: 16, color: Color(0xfff9f9f9)),
                          )),
                      Text(
                        'version'.tr + controller.rxStrVersion.value,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.back();
                            controller.selectedRadio.value = 1;
                          },
                          child: Text(
                            'confirm'.tr,
                            style: TextStyle(
                                fontSize: 16, color: Color(0xfff9f9f9)),
                          )),
                    ]),
              ),
            ],
          ),
        );
      },
      bodyBuilder: (context, offset) {
        return SliverChildListDelegate(
          [
            Container(
              margin: EdgeInsets.all(15),
              child: InkWell(
                child: Text('versioncontent'.tr),
                onTap: () {},
              ),
              alignment: Alignment.center,
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    blurRadius: 15.0,
                    offset: Offset(5.0, 10.0),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: InkWell(
                child: Text('versioncontent'.tr),
                onTap: () {},
              ),
              alignment: Alignment.center,
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    blurRadius: 15.0,
                    offset: Offset(5.0, 10.0),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      anchors: [.2, 0.6, 0.601],
    );
  }
}

const String _svg_xdf1v1 =
    '<svg viewBox="3.0 1.0 16.0 16.0" ><path transform="translate(3.0, 1.0)" d="M 16 15.99999904632568 L 15.99876880645752 15.99999904632568 L 7.999802112579346 15.99999904632568 L 7.999802112579346 14.76931571960449 L 16 14.76931571960449 L 16 15.9987678527832 L 16 15.99999904632568 Z M 0.3674905002117157 15.80252933502197 C 0.257478266954422 15.80254173278809 0.1538417637348175 15.75300216674805 0.0831424668431282 15.66662406921387 C 0.0130462720990181 15.5810079574585 -0.0145737174898386 15.4695463180542 0.007359803654253483 15.36084175109863 L 0.8968860507011414 10.91441535949707 L 9.87855339050293 1.931874871253967 L 13.87089729309082 5.924108505249023 L 4.888122081756592 14.90556621551514 L 0.4415992200374603 15.79507064819336 C 0.4171055257320404 15.80001735687256 0.3921810686588287 15.80252933502197 0.3674905002117157 15.80252933502197 Z M 9.87855339050293 3.673208713531494 L 9.878540992736816 3.673220872879028 L 2.030117988586426 11.52035427093506 L 1.467379093170166 14.33507537841797 L 4.282181262969971 13.77236175537109 L 12.12950897216797 5.924108505249023 L 9.87855339050293 3.673220872879028 L 9.87855339050293 3.673208713531494 Z M 16 13.5386323928833 L 15.99876880645752 13.5386323928833 L 11.07714176177979 13.5386323928833 L 11.07714176177979 12.30793476104736 L 16 12.30794715881348 L 16 13.53740119934082 L 16 13.5386323928833 Z M 14.93212413787842 4.861798763275146 L 14.93125152587891 4.860937118530273 L 10.93978118896484 0.8706730008125305 L 11.81047534942627 0 L 15.80281925201416 3.992245674133301 L 14.93299865722656 4.860937118530273 L 14.93212413787842 4.861798763275146 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-opacity="0.9" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ehpyic =
    '<svg viewBox="33.0 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_b970c5 =
    '<svg viewBox="337.0 385.8 20.0 16.0" ><path transform="translate(337.25, 385.5)" d="M 17.74979972839355 16.25040054321289 L 1.749600529670715 16.25040054321289 C 1.148320555686951 16.25040054321289 -0.2501994669437408 16.15287971496582 -0.2501994669437408 15.24960041046143 L -0.2501994669437408 1.250100374221802 C -0.2501994669437408 0.3476304113864899 1.148320555686951 0.2502004206180573 1.749600529670715 0.2502004206180573 L 13.75020027160645 0.2502004206180573 C 14.58189010620117 0.2502004206180573 14.75010013580322 0.4184104204177856 14.75010013580322 1.250100374221802 L 14.75010013580322 3.249900341033936 L 17.74979972839355 4.249800205230713 C 18.35086059570312 4.249800205230713 19.74960136413574 4.34734058380127 19.74960136413574 5.249700546264648 L 19.74960136413574 15.24960041046143 C 19.74960136413574 16.15287971496582 18.3510799407959 16.25040054321289 17.74979972839355 16.25040054321289 Z M 1.749600529670715 5.249700546264648 L 1.749600529670715 15.24960041046143 L 17.74979972839355 15.24960041046143 L 17.74979972839355 5.249700546264648 L 1.749600529670715 5.249700546264648 Z M 1.749600529670715 1.250100374221802 L 1.749600529670715 4.249800205230713 L 13.75020027160645 3.249900341033936 L 13.75020027160645 1.250100374221802 L 1.749600529670715 1.250100374221802 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_c5mbx =
    '<svg viewBox="0.0 0.0 26.0 26.0" ><path transform="matrix(0.0, -1.0, 1.0, 0.0, 0.0, 26.0)" d="M 26 0 L 26 26 L 0 26 L 0 0 L 26 0 Z" fill="none" fill-opacity="0.6" stroke="none" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_khxxur =
    '<svg viewBox="9.0 5.8 8.7 14.5" ><path transform="matrix(0.0, -1.0, 1.0, 0.0, 9.0, 20.25)" d="M 1.493763089179993 0 L 7.246881484985352 5.753118515014648 L 13 0 L 14.4937629699707 1.493763089179993 L 7.246881484985352 8.740644454956055 L 0 1.493763089179993 L 1.493763089179993 0 Z" fill="#000000" fill-opacity="0.6" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';

class UserCenterController extends BaseController {
  final CacheService cacheService;
  final GCPayApi gcpayApi;
  UserCenterController(this.cacheService, this.gcpayApi);
  get locale => null;
  RxString rxStrPath = ''.obs;
  Rx<PackageInfo> packageInfo =
      PackageInfo(appName: '', buildNumber: '', packageName: '', version: '')
          .obs;
  RxString rxStrVersion = ''.obs;
  RxInt selectedRadio = 0.obs;
  RxInt rxIntVersionClick = 0.obs;
  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    rxStrPath.value = cacheService.rxProfilePath.value;
    initVersion();
  }

  Future getImage() async {
    if (Platform.isIOS) {
      bool result = await permissionCheckAndRequest(
        Get.context!,
        Permission.photos,
        "相册",
      );
      if (!result) {
        return;
      }
      ;
    } else if (Platform.isAndroid) {
      bool result = await permissionCheckAndRequest(
        Get.context!,
        Permission.storage,
        "相册",
      );
      if (!result) {
        return;
      }
      ;
    }

    try {
      final currentLocale = await LocalizationService().getCurrentLocale();
      Language currentLanguage = Language.System;
      if (cacheService.rxLanguage.value == '1') {
        currentLanguage = Language.Chinese;
      } else {
        currentLanguage = Language.English;
      }
      List<Media>? res = await ImagesPicker.pick(
        count: 1,
        pickType: PickType.image,
        // when cropOpt isn't null, crop is enabled
        cropOpt: CropOption(
          aspectRatio: CropAspectRatio.custom,
          cropType: CropType.rect, // currently for android
        ),
        language: currentLanguage,
      );
      if (res != null && res.length > 0) {
        uploadCodeFromImage(res[0].path);
      }
    } catch (e) {
      debugPrint(e.toString());
      showToast(e.toString());
    }
  }

  Future<void> initVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    rxStrVersion.value = version;
  }

  Future<void> uploadCodeFromImage(String imageFile) async {
    try {
      var response = await gcpayApi.uploadUserPicture(imageFile);
      if (response.code == 200) {
        UploadPaymentPicDataEntity pictureEntity = response.data!;
        rxStrPath.value = pictureEntity.path!;
        cacheService.saveProfilePath(pictureEntity.path!);
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

class UserCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        UserCenterController(Get.find<CacheService>(), Get.find<GCPayApi>()));
  }
}
