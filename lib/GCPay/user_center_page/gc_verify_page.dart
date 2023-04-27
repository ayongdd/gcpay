import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get_storage/get_storage.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';
import 'package:images_picker/images_picker.dart';
import 'package:m7_livelyness_detection/index.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../base/controller/base_controller.dart';
import '../../constant/http_url.dart';
import '../../http/apiservice/gcpay_api.dart';
import '../../services/cache_service.dart';
import '../../services/lang/localization_service.dart';
import '../../utils/permission_handle.dart';
import '../../widget/webview_page.dart';
import '../Model/UploadPaymentPic_Data_entity.dart';
import '../home_page/Model/UserBalance_Amount_entity.dart';

class VerifyPage extends BaseStatefulWidget<VerifyPageController> {
  const VerifyPage({
    Key? key,
  }) : super(key: key);

  SliverToBoxAdapter getVerifyWidget() {
    SliverToBoxAdapter boxAdapter = SliverToBoxAdapter();
    if (controller.rxIntAuthFlag.value == 0) {
      boxAdapter = SliverToBoxAdapter(
          child: SizedBox(
            width: 284.0,
            height: 900.0,
            child: Pinned.fromPins(
              Pin(size: 435.0, middle: 0.5),
              Pin(size: 900.0, end: 0.0),
              child: SizedBox(
                width: 355.0,
                height: 900.0,
                child: Stack(
                  children: <Widget>[
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
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
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
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*body*/
                    Pinned.fromPins(
                      Pin(size: 440.0, start: 50.0),
                      Pin(size: 43.0, start: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff15056d),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 150.0, middle: 0.5),
                      Pin(size: 28.0, start: 10.0),
                      child: Text(
                        'verify'.tr,
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
                      Pin(size: 440.0, start: 40.0),
                      Pin(size: 77.0, start: 43.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffd4e3fc),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 36.0, end: 34.0),
                      Pin(size: 4.0, start: 65.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 18.0, start: 34.0),
                      Pin(size: 18.0, start: 59.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff6c646),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 8.0, start: 220.0),
                      Pin(size: 8.0, start: 63.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff6c646),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 8.0, start: 395.0),
                      Pin(size: 8.0, start: 63.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff6c646),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 121.0, start: 34.0),
                      Pin(size: 22.0, start: 90.0),
                      child: Text(
                        'uploadid'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),

                  Pinned.fromPins(
                    Pin(size: 120.0, middle: 0.5),
                    Pin(size: 22.0, start: 90.0),
                    child: Text(
                      'facerecog'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 16,
                        color: const Color(0xff1d4f8b),
                      ),
                    ),
                  ),


                    Pinned.fromPins(
                      Pin(size: 103.0, end: 0.0),
                      Pin(size: 22.0, start: 90.0),
                      child: Text(
                        'manualreview'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),
                    /*box1*/
                    Pinned.fromPins(
                      Pin(size: 355.0, start: 40.0),
                      Pin(size: 70.0, start: 140.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 2.0, color: const Color(0xff1d4f8b)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 95.0, start: 70.0),
                      Pin(size: 20.0, start: 150.0),
                      child: Text(
                        'Name'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 250.0, middle: 0.5),
                      Pin(size: 27.0, start: 173.0),
                      child: TextFormField(
                        controller: controller.identityNameController,
                        decoration: InputDecoration(
                          hintText: 'Enter Real Name'.tr,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 19,
                            color: const Color(0xff707070),
                            fontWeight: FontWeight.w500,
                          ),
                          labelStyle: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 29,
                            color: const Color(0xff707070),
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding:
                          EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                        ),
                        textAlign: TextAlign.center,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                      ),
                    ),
                    /*box2*/
                    Pinned.fromPins(
                      Pin(size: 355.0, start: 40.0),
                      Pin(size: 70.0, start: 230.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 2.0, color: const Color(0xff1d4f8b)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 121.0, start: 70.0),
                      Pin(size: 20.0, start: 240.0),
                      child: Text(
                        'identitynumber'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 300.0, middle: 0.5),
                      Pin(size: 27.0, start: 263.0),
                      child: TextFormField(
                        controller: controller.identityNumberController,
                        decoration: InputDecoration(
                          hintText: 'pleaseinputidentitynumber'.tr,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 19,
                            color: const Color(0xff707070),
                            fontWeight: FontWeight.w500,
                          ),
                          labelStyle: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 29,
                            color: const Color(0xff707070),
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding:
                          EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                        ),
                        textAlign: TextAlign.center,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 121.0, start: 40.0),
                      Pin(size: 20.0, start: 320.0),
                      child: Text(
                        'uploadidfront'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 249.0, start: 40.0),
                      Pin(size: 143.0, start: 350.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                                'assets/images/identifycard_background.png'),
                            fit: BoxFit.fill,
                          ),
                          color: const Color(0xff1d4f8b),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        child: Obx(
                                () => controller.rxIdentityFrontPath.value.length > 0
                                ? CachedNetworkImage(
                              height: 100,
                              width: 200,
                              imageUrl: HttpUrl.BASE_GCPAY_URL +
                                  controller.rxIdentityFrontPath.value,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    height: 100,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )
                                : Container()),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 50.0, start: 330.0),
                      Pin(size: 50.0, start: 380.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff1d4f8b),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.camera,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            controller.getImage(1);
                          },
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 121.0, start: 40.0),
                      Pin(size: 20.0, start: 510.0),
                      child: Text(
                        'uploadidback'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 249.0, start: 40.0),
                      Pin(size: 143.0, start: 550.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                                'assets/images/identifycard_background.png'),
                            fit: BoxFit.fill,
                          ),
                          color: const Color(0xff1d4f8b),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        child:
                        Obx(() => controller.rxIdentityBackPath.value.length > 0
                            ? CachedNetworkImage(
                          height: 100,
                          width: 200,
                          imageUrl: HttpUrl.BASE_GCPAY_URL +
                              controller.rxIdentityBackPath.value,
                          imageBuilder: (context, imageProvider) =>
                              Container(
                                height: 100,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        )
                            : Container()),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 50.0, start: 330.0),
                      Pin(size: 50.0, start: 575.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff1d4f8b),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.camera,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            controller.getImage(2);
                          },
                        ),
                      ),
                    ),
                    /*
                    Pinned.fromPins(
                      Pin(size: 150.0, start: 40.0),
                      Pin(size: 20.0, start: 710.0),
                      child: Text(
                        'uploadidhandfront'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 249.0, start: 40.0),
                      Pin(size: 143.0, start: 750.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                                'assets/images/identifycard_background.png'),
                            fit: BoxFit.fill,
                          ),
                          color: const Color(0xff1d4f8b),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        child: Obx(() =>
                        controller.rxIdentityHandFrontPath.value.length > 0
                            ? CachedNetworkImage(
                          height: 100,
                          width: 200,
                          imageUrl: HttpUrl.BASE_GCPAY_URL +
                              controller.rxIdentityHandFrontPath.value,
                          imageBuilder: (context, imageProvider) =>
                              Container(
                                height: 100,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        )
                            : Container()),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 50.0, start: 330.0),
                      Pin(size: 50.0, start: 780.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff1d4f8b),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.camera,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            controller.getImage(3);
                          },
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 150.0, start: 40.0),
                      Pin(size: 20.0, start: 910.0),
                      child: Text(
                        'uploadidhandback'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 249.0, start: 40.0),
                      Pin(size: 143.0, start: 950.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                                'assets/images/identifycard_background.png'),
                            fit: BoxFit.fill,
                          ),
                          color: const Color(0xff1d4f8b),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        child: Obx(
                                () => controller.rxIdentityHandBackPath.value.length > 0
                                ? CachedNetworkImage(
                              height: 100,
                              width: 200,
                              imageUrl: HttpUrl.BASE_GCPAY_URL +
                                  controller.rxIdentityHandBackPath.value,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    height: 100,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )
                                : Container()),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 50.0, start: 330.0),
                      Pin(size: 50.0, start: 980.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff1d4f8b),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.camera,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            controller.getImage(4);
                          },
                        ),
                      ),
                    ),
                    */
                    Pinned.fromPins(
                      Pin(size: 334.0, start: 50.5),
                      Pin(size: 43.0, start: 800.0),
                      child: InkWell(
                        child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff15056d),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.only(top: 10),
                            child: Obx(() => Text(
                              controller.capturedImagePath.value.isNotEmpty? 'submitverification'.tr:'next'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 18,
                                color: const Color(0xffffffff),
                              ),
                            ))),
                        onTap: () {
                          controller.realInfoAuthentication();
                        },
                      ),
                    ),
                    /*end*/
                  ],
                ),
              ),
            ),
          ));
    } else if (controller.rxIntAuthFlag.value == 1) {
      boxAdapter = SliverToBoxAdapter(
          child: SizedBox(
            width: 284.0,
            height: 600.0,
            child: Pinned.fromPins(
              Pin(size: 435.0, middle: 0.5),
              Pin(size: 600.0, end: 0.0),
              child: SizedBox(
                width: 355.0,
                height: 600.0,
                child: Stack(
                  children: <Widget>[
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
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
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
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*body*/
                    Pinned.fromPins(
                      Pin(size: 440.0, start: 50.0),
                      Pin(size: 43.0, start: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff15056d),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 150.0, middle: 0.5),
                      Pin(size: 22.0, start: 10.0),
                      child: Text(
                        'verify'.tr,
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
                      Pin(size: 440.0, start: 40.0),
                      Pin(size: 77.0, start: 43.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffd4e3fc),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 36.0, end: 36.0),
                      Pin(size: 4.0, start: 65.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 8.0, start: 34.0),
                      Pin(size: 8.0, start: 62.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff6c646),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 8.0, start: 220.0),
                      Pin(size: 8.0, start: 63.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff6c646),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 18.0, start: 385.0),
                      Pin(size: 18.0, start: 60.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff6c646),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 121.0, start: 34.0),
                      Pin(size: 22.0, start: 90.0),
                      child: Text(
                        'uploadid'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),

                  Pinned.fromPins(
                    Pin(size: 120.0, middle: 0.5),
                    Pin(size: 22.0, start: 90.0),
                    child: Text(
                      'facerecog'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 16,
                        color: const Color(0xff1d4f8b),
                      ),
                    ),
                  ),

                    Pinned.fromPins(
                      Pin(size: 350.0, start: 40.0),
                      Pin(size: 143.0, start: 150.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff1d4f8b),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 36,
                              icon: const Icon(
                                FontAwesomeIcons.userAstronaut,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            Text(
                              'manualreviewing'.tr,
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 16,
                                color: const Color(0xffffffff),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 103.0, end: 0.0),
                      Pin(size: 22.0, start: 90.0),
                      child: Text(
                        'manualreview'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),

                    /*end*/
                  ],
                ),
              ),
            ),
          ));
    } else if (controller.rxIntAuthFlag.value == 2) {
      boxAdapter = SliverToBoxAdapter(
          child: SizedBox(
        width: 284.0,
        height: 1300.0,
        child: Pinned.fromPins(
          Pin(size: 435.0, middle: 0.5),
          Pin(size: 1300.0, end: 0.0),
          child: SizedBox(
            width: 355.0,
            height: 1300.0,
            child: Stack(
              children: <Widget>[
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
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
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
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*body*/
                Pinned.fromPins(
                  Pin(size: 440.0, start: 50.0),
                  Pin(size: 43.0, start: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff15056d),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 150.0, middle: 0.5),
                  Pin(size: 22.0, start: 10.0),
                  child: Text(
                    'verify'.tr,
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
                  Pin(size: 440.0, start: 40.0),
                  Pin(size: 77.0, start: 43.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffd4e3fc),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 369.0, start: 34.0),
                  Pin(size: 4.0, start: 65.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 18.0, start: 34.0),
                  Pin(size: 18.0, start: 59.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfff6c646),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 8.0, start: 220.0),
                  Pin(size: 8.0, start: 63.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfff6c646),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 8.0, start: 395.0),
                  Pin(size: 8.0, start: 63.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfff6c646),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 121.0, start: 34.0),
                  Pin(size: 22.0, start: 90.0),
                  child: Text(
                    'uploadid'.tr,
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 16,
                      color: const Color(0xff1d4f8b),
                    ),
                  ),
                ),

                  Pinned.fromPins(
                    Pin(size: 120.0, middle: 0.5),
                    Pin(size: 22.0, start: 90.0),
                    child: Text(
                      'facerecog'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 16,
                        color: const Color(0xff1d4f8b),
                      ),
                    ),
                  ),


                Pinned.fromPins(
                  Pin(size: 103.0, end: 0.0),
                  Pin(size: 22.0, start: 90.0),
                  child: Text(
                    'manualreview'.tr,
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 16,
                      color: const Color(0xff1d4f8b),
                    ),
                  ),
                ),
                /*box1*/
                Pinned.fromPins(
                  Pin(size: 355.0, start: 40.0),
                  Pin(size: 70.0, start: 140.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          width: 2.0, color: const Color(0xff1d4f8b)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 95.0, start: 70.0),
                  Pin(size: 20.0, start: 150.0),
                  child: Text(
                    'Name'.tr,
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 16,
                      color: const Color(0xff1d4f8b),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 250.0, middle: 0.5),
                  Pin(size: 27.0, start: 173.0),
                  child: TextFormField(
                    controller: controller.identityNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter Real Name'.tr,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: 'PingFang SC',
                        fontSize: 19,
                        color: const Color(0xff707070),
                        fontWeight: FontWeight.w500,
                      ),
                      labelStyle: TextStyle(
                        fontFamily: 'PingFang SC',
                        fontSize: 29,
                        color: const Color(0xff707070),
                        fontWeight: FontWeight.w500,
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                    ),
                    textAlign: TextAlign.center,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                  ),
                ),
                /*box2*/
                Pinned.fromPins(
                  Pin(size: 355.0, start: 40.0),
                  Pin(size: 70.0, start: 230.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          width: 2.0, color: const Color(0xff1d4f8b)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 121.0, start: 70.0),
                  Pin(size: 20.0, start: 240.0),
                  child: Text(
                    'identitynumber'.tr,
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 16,
                      color: const Color(0xff1d4f8b),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 300.0, middle: 0.5),
                  Pin(size: 27.0, start: 263.0),
                  child: TextFormField(
                    controller: controller.identityNumberController,
                    decoration: InputDecoration(
                      hintText: 'pleaseinputidentitynumber'.tr,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: 'PingFang SC',
                        fontSize: 19,
                        color: const Color(0xff707070),
                        fontWeight: FontWeight.w500,
                      ),
                      labelStyle: TextStyle(
                        fontFamily: 'PingFang SC',
                        fontSize: 29,
                        color: const Color(0xff707070),
                        fontWeight: FontWeight.w500,
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                    ),
                    textAlign: TextAlign.center,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 121.0, start: 40.0),
                  Pin(size: 20.0, start: 320.0),
                  child: Text(
                    'uploadidfront'.tr,
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 16,
                      color: const Color(0xff1d4f8b),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 249.0, start: 40.0),
                  Pin(size: 143.0, start: 350.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/identifycard_background.png'),
                        fit: BoxFit.fill,
                      ),
                      color: const Color(0xff1d4f8b),
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    child: Obx(
                        () => controller.rxIdentityFrontPath.value.length > 0
                            ? CachedNetworkImage(
                                height: 100,
                                width: 200,
                                imageUrl: HttpUrl.BASE_GCPAY_URL +
                                    controller.rxIdentityFrontPath.value,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: 100,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              )
                            : Container()),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 50.0, start: 330.0),
                  Pin(size: 50.0, start: 380.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff1d4f8b),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.camera,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controller.getImage(1);
                      },
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 121.0, start: 40.0),
                  Pin(size: 20.0, start: 510.0),
                  child: Text(
                    'uploadidback'.tr,
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 16,
                      color: const Color(0xff1d4f8b),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 249.0, start: 40.0),
                  Pin(size: 143.0, start: 550.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/identifycard_background.png'),
                        fit: BoxFit.fill,
                      ),
                      color: const Color(0xff1d4f8b),
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    child:
                        Obx(() => controller.rxIdentityBackPath.value.length > 0
                            ? CachedNetworkImage(
                                height: 100,
                                width: 200,
                                imageUrl: HttpUrl.BASE_GCPAY_URL +
                                    controller.rxIdentityBackPath.value,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: 100,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              )
                            : Container()),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 50.0, start: 330.0),
                  Pin(size: 50.0, start: 575.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff1d4f8b),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.camera,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controller.getImage(2);
                      },
                    ),
                  ),
                ),
                /*
                Pinned.fromPins(
                  Pin(size: 150.0, start: 40.0),
                  Pin(size: 20.0, start: 710.0),
                  child: Text(
                    'uploadidhandfront'.tr,
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 16,
                      color: const Color(0xff1d4f8b),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 249.0, start: 40.0),
                  Pin(size: 143.0, start: 750.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/identifycard_background.png'),
                        fit: BoxFit.fill,
                      ),
                      color: const Color(0xff1d4f8b),
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    child: Obx(() =>
                        controller.rxIdentityHandFrontPath.value.length > 0
                            ? CachedNetworkImage(
                                height: 100,
                                width: 200,
                                imageUrl: HttpUrl.BASE_GCPAY_URL +
                                    controller.rxIdentityHandFrontPath.value,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: 100,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              )
                            : Container()),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 50.0, start: 330.0),
                  Pin(size: 50.0, start: 780.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff1d4f8b),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.camera,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controller.getImage(3);
                      },
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 150.0, start: 40.0),
                  Pin(size: 20.0, start: 910.0),
                  child: Text(
                    'uploadidhandback'.tr,
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 16,
                      color: const Color(0xff1d4f8b),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 249.0, start: 40.0),
                  Pin(size: 143.0, start: 950.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/identifycard_background.png'),
                        fit: BoxFit.fill,
                      ),
                      color: const Color(0xff1d4f8b),
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    child: Obx(
                        () => controller.rxIdentityHandBackPath.value.length > 0
                            ? CachedNetworkImage(
                                height: 100,
                                width: 200,
                                imageUrl: HttpUrl.BASE_GCPAY_URL +
                                    controller.rxIdentityHandBackPath.value,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: 100,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              )
                            : Container()),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 50.0, start: 330.0),
                  Pin(size: 50.0, start: 980.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff1d4f8b),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.camera,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controller.getImage(4);
                      },
                    ),
                  ),
                ),
                */
                Pinned.fromPins(
                  Pin(size: 334.0, start: 50.5),
                  Pin(size: 43.0, start: 800.0),
                  child: InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff15056d),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.only(top: 10),
                        child: Obx(() =>Text(
                          controller.capturedImagePath.value.isNotEmpty? 'submitverification'.tr:'next'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 18,
                            color: const Color(0xffffffff),
                          ),
                        ))),
                    onTap: () {
                      controller.realInfoAuthentication();
                    },
                  ),
                ),
                /*end*/
              ],
            ),
          ),
        ),
      ));
    }
    return boxAdapter;
  }

  SliverToBoxAdapter getVerifiedWidget() {
    SliverToBoxAdapter boxAdapter = SliverToBoxAdapter();
    if (controller.rxIntAuthFlag.value == 0) {
      boxAdapter = SliverToBoxAdapter(
          child: SizedBox(
            width: 284.0,
            height: 1300.0,
            child: Pinned.fromPins(
              Pin(size: 435.0, middle: 0.5),
              Pin(size: 1300.0, end: 0.0),
              child: SizedBox(
                width: 355.0,
                height: 1300.0,
                child: Stack(
                  children: <Widget>[
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
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
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
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*body*/
                    Pinned.fromPins(
                      Pin(size: 440.0, start: 50.0),
                      Pin(size: 43.0, start: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff15056d),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 150.0, middle: 0.5),
                      Pin(size: 22.0, start: 10.0),
                      child: Text(
                        'verify'.tr,
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
                      Pin(size: 440.0, start: 40.0),
                      Pin(size: 77.0, start: 43.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffd4e3fc),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 36.0, end: 36.0),
                      Pin(size: 4.0, start: 65.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 18.0, start: 34.0),
                      Pin(size: 18.0, start: 59.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff6c646),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 8.0, start: 220.0),
                      Pin(size: 8.0, start: 63.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff6c646),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 8.0, start: 395.0),
                      Pin(size: 8.0, start: 63.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff6c646),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 121.0, start: 34.0),
                      Pin(size: 22.0, start: 90.0),
                      child: Text(
                        'uploadid'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),

                  Pinned.fromPins(
                    Pin(size: 120.0, middle: 0.5),
                    Pin(size: 22.0, start: 90.0),
                    child: Text(
                      'facerecog'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 16,
                        color: const Color(0xff1d4f8b),
                      ),
                    ),
                  ),


                    Pinned.fromPins(
                      Pin(size: 103.0, end: 0.0),
                      Pin(size: 22.0, start: 90.0),
                      child: Text(
                        'manualreview'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),
                    /*box1*/
                    Pinned.fromPins(
                      Pin(size: 355.0, start: 40.0),
                      Pin(size: 70.0, start: 140.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 2.0, color: const Color(0xff1d4f8b)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 95.0, start: 70.0),
                      Pin(size: 20.0, start: 150.0),
                      child: Text(
                        'Name'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 250.0, middle: 0.5),
                      Pin(size: 27.0, start: 173.0),
                      child: TextFormField(
                        controller: controller.identityNameController,
                        decoration: InputDecoration(
                          hintText: 'Enter Real Name'.tr,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 19,
                            color: const Color(0xff707070),
                            fontWeight: FontWeight.w500,
                          ),
                          labelStyle: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 29,
                            color: const Color(0xff707070),
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding:
                          EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                        ),
                        textAlign: TextAlign.center,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                      ),
                    ),
                    /*box2*/
                    Pinned.fromPins(
                      Pin(size: 355.0, start: 40.0),
                      Pin(size: 70.0, start: 230.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 2.0, color: const Color(0xff1d4f8b)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 121.0, start: 70.0),
                      Pin(size: 20.0, start: 240.0),
                      child: Text(
                        'identitynumber'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 300.0, middle: 0.5),
                      Pin(size: 27.0, start: 263.0),
                      child: TextFormField(
                        controller: controller.identityNumberController,
                        decoration: InputDecoration(
                          hintText: 'pleaseinputidentitynumber'.tr,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 19,
                            color: const Color(0xff707070),
                            fontWeight: FontWeight.w500,
                          ),
                          labelStyle: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 29,
                            color: const Color(0xff707070),
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding:
                          EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                        ),
                        textAlign: TextAlign.center,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 121.0, start: 40.0),
                      Pin(size: 20.0, start: 320.0),
                      child: Text(
                        'uploadidfront'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 249.0, start: 40.0),
                      Pin(size: 143.0, start: 350.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                                'assets/images/identifycard_background.png'),
                            fit: BoxFit.fill,
                          ),
                          color: const Color(0xff1d4f8b),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        child: Obx(
                                () => controller.rxIdentityFrontPath.value.length > 0
                                ? CachedNetworkImage(
                              height: 100,
                              width: 200,
                              imageUrl: HttpUrl.BASE_GCPAY_URL +
                                  controller.rxIdentityFrontPath.value,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    height: 100,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )
                                : Container()),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 50.0, start: 330.0),
                      Pin(size: 50.0, start: 380.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff1d4f8b),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.camera,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            controller.getImage(1);
                          },
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 121.0, start: 40.0),
                      Pin(size: 20.0, start: 510.0),
                      child: Text(
                        'uploadidback'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 249.0, start: 40.0),
                      Pin(size: 143.0, start: 550.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                                'assets/images/identifycard_background.png'),
                            fit: BoxFit.fill,
                          ),
                          color: const Color(0xff1d4f8b),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        child:
                        Obx(() => controller.rxIdentityBackPath.value.length > 0
                            ? CachedNetworkImage(
                          height: 100,
                          width: 200,
                          imageUrl: HttpUrl.BASE_GCPAY_URL +
                              controller.rxIdentityBackPath.value,
                          imageBuilder: (context, imageProvider) =>
                              Container(
                                height: 100,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        )
                            : Container()),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 50.0, start: 330.0),
                      Pin(size: 50.0, start: 575.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff1d4f8b),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.camera,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            controller.getImage(2);
                          },
                        ),
                      ),
                    ),
                    /*
                    Pinned.fromPins(
                      Pin(size: 150.0, start: 40.0),
                      Pin(size: 20.0, start: 710.0),
                      child: Text(
                        'uploadidhandfront'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 249.0, start: 40.0),
                      Pin(size: 143.0, start: 750.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                                'assets/images/identifycard_background.png'),
                            fit: BoxFit.fill,
                          ),
                          color: const Color(0xff1d4f8b),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        child: Obx(() =>
                        controller.rxIdentityHandFrontPath.value.length > 0
                            ? CachedNetworkImage(
                          height: 100,
                          width: 200,
                          imageUrl: HttpUrl.BASE_GCPAY_URL +
                              controller.rxIdentityHandFrontPath.value,
                          imageBuilder: (context, imageProvider) =>
                              Container(
                                height: 100,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        )
                            : Container()),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 50.0, start: 330.0),
                      Pin(size: 50.0, start: 780.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff1d4f8b),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.camera,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            controller.getImage(3);
                          },
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 150.0, start: 40.0),
                      Pin(size: 20.0, start: 910.0),
                      child: Text(
                        'uploadidhandback'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 249.0, start: 40.0),
                      Pin(size: 143.0, start: 950.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                                'assets/images/identifycard_background.png'),
                            fit: BoxFit.fill,
                          ),
                          color: const Color(0xff1d4f8b),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        child: Obx(
                                () => controller.rxIdentityHandBackPath.value.length > 0
                                ? CachedNetworkImage(
                              height: 100,
                              width: 200,
                              imageUrl: HttpUrl.BASE_GCPAY_URL +
                                  controller.rxIdentityHandBackPath.value,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    height: 100,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )
                                : Container()),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 50.0, start: 330.0),
                      Pin(size: 50.0, start: 980.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff1d4f8b),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.camera,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            controller.getImage(4);
                          },
                        ),
                      ),
                    ),
                    */
                    Pinned.fromPins(
                      Pin(size: 334.0, start: 50.5),
                      Pin(size: 43.0, start: 800.0),
                      child: InkWell(
                        child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff15056d),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.only(top: 10),
                            child: Obx(() =>Text(
                              controller.capturedImagePath.value.isNotEmpty? 'submitverification'.tr:'next'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 18,
                                color: const Color(0xffffffff),
                              ),
                            ))),
                        onTap: () {
                          controller.realInfoAuthentication();
                        },
                      ),
                    ),
                    /*end*/
                  ],
                ),
              ),
            ),
          ));
    } else if (controller.rxIntAuthFlag.value == 1) {
      boxAdapter = SliverToBoxAdapter(
          child: SizedBox(
            width: 284.0,
            height: 600.0,
            child: Pinned.fromPins(
              Pin(size: 435.0, middle: 0.5),
              Pin(size: 600.0, end: 0.0),
              child: SizedBox(
                width: 355.0,
                height: 600.0,
                child: Stack(
                  children: <Widget>[
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
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
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
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*body*/
                    Pinned.fromPins(
                      Pin(size: 440.0, start: 50.0),
                      Pin(size: 43.0, start: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff15056d),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 150.0, middle: 0.5),
                      Pin(size: 22.0, start: 10.0),
                      child: Text(
                        'verify'.tr,
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
                      Pin(size: 440.0, start: 40.0),
                      Pin(size: 77.0, start: 43.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffd4e3fc),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 36.0, end: 36.0),
                      Pin(size: 4.0, start: 65.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 8.0, start: 34.0),
                      Pin(size: 8.0, start: 62.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff6c646),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 8.0, start: 220.0),
                      Pin(size: 8.0, start: 63.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff6c646),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 18.0, start: 385.0),
                      Pin(size: 18.0, start: 60.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff6c646),
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 121.0, start: 34.0),
                      Pin(size: 22.0, start: 90.0),
                      child: Text(
                        'uploadid'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),

                  Pinned.fromPins(
                    Pin(size: 120.0, middle: 0.5),
                    Pin(size: 22.0, start: 90.0),
                    child: Text(
                      'facerecog'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 16,
                        color: const Color(0xff1d4f8b),
                      ),
                    ),
                  ),

                    Pinned.fromPins(
                      Pin(size: 350.0, start: 40.0),
                      Pin(size: 143.0, start: 150.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff1d4f8b),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 36,
                              icon: const Icon(
                                FontAwesomeIcons.userAstronaut,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            Text(
                              'manualreviewing'.tr,
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 16,
                                color: const Color(0xffffffff),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 103.0, end: 0.0),
                      Pin(size: 22.0, start: 90.0),
                      child: Text(
                        'manualreview'.tr,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),

                    /*end*/
                  ],
                ),
              ),
            ),
          ));
    } else if (controller.rxIntAuthFlag.value == 2) {
      boxAdapter = SliverToBoxAdapter(
          child: SizedBox(
        width: 284.0,
        height: 600.0,
        child: Pinned.fromPins(
          Pin(size: 435.0, middle: 0.5),
          Pin(size: 600.0, end: 0.0),
          child: SizedBox(
            width: 355.0,
            height: 600.0,
            child: Stack(
              children: <Widget>[
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
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
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
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*body*/
                Pinned.fromPins(
                  Pin(size: 440.0, start: 50.0),
                  Pin(size: 43.0, start: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff15056d),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 150.0, middle: 0.5),
                  Pin(size: 22.0, start: 10.0),
                  child: Text(
                    'verify'.tr,
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
                  Pin(size: 440.0, start: 40.0),
                  Pin(size: 77.0, start: 43.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffd4e3fc),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 369.0, start: 34.0),
                  Pin(size: 4.0, start: 65.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 18.0, start: 34.0),
                  Pin(size: 18.0, start: 59.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfff6c646),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 8.0, start: 220.0),
                  Pin(size: 8.0, start: 63.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfff6c646),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 8.0, start: 395.0),
                  Pin(size: 8.0, start: 63.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfff6c646),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 121.0, start: 34.0),
                  Pin(size: 22.0, start: 90.0),
                  child: Text(
                    'uploadid'.tr,
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 16,
                      color: const Color(0xff1d4f8b),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 120.0, middle: 0.5),
                  Pin(size: 22.0, start: 90.0),
                  child: Text(
                    'facerecog'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 16,
                      color: const Color(0xff1d4f8b),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 103.0, end: 0.0),
                  Pin(size: 22.0, start: 90.0),
                  child: Text(
                    'manualreview'.tr,
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 16,
                      color: const Color(0xff1d4f8b),
                    ),
                  ),
                ),
                /*box1*/
                Pinned.fromPins(
                  Pin(start: 30.0, end: 30),
                  Pin(start: 140.0, end: 110.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xffd5e0ee),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/identity_verified.png',
                          height: 120,
                        ),
                        Container(
                          height: 20,
                        ),
                        Text(
                          'verified'.tr,
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 334.0, start: 50.5),
                  Pin(size: 60.0, start: 400.0),
                  child: InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff2072d3),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'verifiedupdatecontactcustomerservice'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 18,
                            color: const Color(0xffffffff),
                          ),
                        )),
                    onTap: () {
                      String strCSUrl = controller.cacheService.rxServiceLink.value;
                      Get.to(WebViewPage(
                        strUrl: strCSUrl,
                        strTitle: 'customerService'.tr,
                        blNavigation: false,
                      ));
                    },
                  ),
                ),
                /*end*/
              ],
            ),
          ),
        ),
      ));
    }
    return boxAdapter;
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
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
              Obx(() => controller.rxIntAuthFlag.value == 0
                  ? getVerifyWidget()
                  : getVerifiedWidget()),

              /*header*/
            ],
          ),
        ));
  }

  @override
  bool showTitleBar() {
    return false;
  }

  @override
  bool useLoadSir() => false;
}

class VerifyPageController extends BaseController {
  final CacheService cacheService;
  final GCPayApi gcpayApi;
  VerifyPageController(this.cacheService, this.gcpayApi);
  get locale => null;
  RxString rxIdentityFrontPath = ''.obs;
  RxString rxIdentityBackPath = ''.obs;
  RxString rxIdentityHandFrontPath = ''.obs;
  RxString rxIdentityHandBackPath = ''.obs;

  RxInt rxIntAuthFlag = 0.obs; //0未实名，1认证中，2实名成功

  final identityNameController = TextEditingController();
  final identityNumberController = TextEditingController();

  RxString capturedImagePath = ''.obs;
  final bool _isLoading = false;
  bool _startWithInfo = true;
  bool _allowAfterTimeOut = false;
  final List<M7LivelynessStepItem> _veificationSteps = [];
  int _timeOutDuration = 30;

  @override
  void onClose() {
    identityNameController.dispose();
    identityNumberController.dispose();
    super.onClose();
  }

  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    getUserBalanceInfo();
    initStepValues();
    rxIntAuthFlag.value = cacheService.rxAuthFlag.value;
  }

  //* MARK: - Private Methods for Business Logic
  //? =========================================================
  void initStepValues() {
    _veificationSteps.addAll(
      [
        M7LivelynessStepItem(
          step: M7LivelynessStep.turnLeft,
          title: Platform.isAndroid?"左转头":"右转头",
          isCompleted: false,
        ),
        M7LivelynessStepItem(
          step: M7LivelynessStep.smile,
          title: "微笑",
          isCompleted: false,
        ),
        M7LivelynessStepItem(
          step: M7LivelynessStep.blink,
          title: "眨眼",
          isCompleted: false,
        ),
      ],
    );
    M7LivelynessDetection.instance.configure(
      contourColor: Colors.white,
      thresholds: [
        M7SmileDetectionThreshold(
          probability: 0.8,
        ),
        M7BlinkDetectionThreshold(
          leftEyeProbability: 0.25,
          rightEyeProbability: 0.25,
        ),
      ],
    );
  }

  void onStartLivelyness() async {
    final String? response =
    await M7LivelynessDetection.instance.detectLivelyness(
      Get.context!,
      config: M7DetectionConfig(
        steps: _veificationSteps,
        startWithInfoScreen: _startWithInfo,
        maxSecToDetect: 100,
        allowAfterMaxSec: _allowAfterTimeOut,
        captureButtonColor: Colors.red,
      ),
    );
    if (response == null) {
      showToast('人脸识别失败，请重试',gravity: ToastGravity.CENTER);
      return;
    }
    showToast('人脸识别成功，请提交审核资料',gravity: ToastGravity.CENTER);
    uploadFaceImage(response);
  }

  Future<void> realInfoAuthentication() async {
    if (identityNameController.text.length <= 0) {
      showToast('Enter Real Name'.tr,gravity: ToastGravity.CENTER);
      return;
    }
    if (identityNumberController.text.length <= 0) {
      showToast('pleaseinputidentitynumber'.tr,gravity: ToastGravity.CENTER);
      return;
    }

    if (!rxIdentityFrontPath.value.isNotEmpty) {
      showToast('uploadidfront'.tr,gravity: ToastGravity.CENTER);
      return;
    }
    if (!rxIdentityBackPath.value.isNotEmpty) {
      showToast('uploadidback'.tr,gravity: ToastGravity.CENTER);
      return;
    }

    if(!capturedImagePath.value.isNotEmpty)
      {
        onStartLivelyness();
        return;
      }
    try {
      Map<String, dynamic> data = <String, dynamic>{
        'name': identityNameController.text,
        'identityCard': identityNumberController.text,
        'identityCardPic': rxIdentityFrontPath.value,
        'identityCardPicBack': rxIdentityBackPath.value,
        'videoAuthentication': capturedImagePath.value,
        //'identityCardHandPicBack': rxIdentityHandBackPath.value,
      };
      var response = await gcpayApi.realInfoAuthentication(data);
      showToast(response.msg);
      if (response.code == 401) {
        // Get.toNamed(Routes.LOGIN);
      }
      if (response.code == 200) {
        //return json.decode(response.body);
        rxIntAuthFlag.value = 1;
        cacheService.saveAuthFlag(rxIntAuthFlag.value.toString());

        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future<void> getUserBalanceInfo() async {
    try {
      String strAlias = '';
      strAlias = cacheService.loadPushAlias()!;
      Map<String, dynamic> data = <String, dynamic>{'alias': strAlias};
      var response = await gcpayApi.umsUserBalance(data);
      if (response.code == 401) {
        // Get.toNamed(Routes.LOGIN);
      }
      if (response.code == 200) {
        //return json.decode(response.body);
        UserBalanceAmountEntity balanceEntity = response.data!;
        cacheService.saveAuthFlag(balanceEntity.authFlag.toString());
        cacheService.saveServiceLink(balanceEntity.serviceLink!);

        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future getImage(int intIndex) async {
    if (Platform.isIOS) {
      bool result = await permissionCheckAndRequest(
        Get.context!,
        Permission.photos,
        "相册",
      );
      if (!result) {
        return;
      };
    }
    else if(Platform.isAndroid)
    {
      bool result = await permissionCheckAndRequest(
        Get.context!,
        Permission.storage,
        "相册",
      );
      if (!result) {
        return;
      };
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
        uploadCodeFromImage(res[0].path, intIndex);
      }
    } catch (e) {
      debugPrint(e.toString());
      showToast(e.toString());
    }
  }

  Future<void> uploadCodeFromImage(String imageFile, int intIndex) async {
    try {
      var response = await gcpayApi.realInfoPicture(imageFile);
      if (response.code == 200) {
        UploadPaymentPicDataEntity pictureEntity = response.data!;
        if (intIndex == 1) {
          rxIdentityFrontPath.value = pictureEntity.path!;
        } else if (intIndex == 2) {
          rxIdentityBackPath.value = pictureEntity.path!;
        } else if (intIndex == 3) {
          rxIdentityHandFrontPath.value = pictureEntity.path!;
        } else if (intIndex == 4) {
          rxIdentityHandBackPath.value = pictureEntity.path!;
        }
        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future<void> uploadFaceImage(String imageFile) async {
    try {
      var response = await gcpayApi.realInfoPicture(imageFile);
      if (response.code == 200) {
        UploadPaymentPicDataEntity pictureEntity = response.data!;

        capturedImagePath.value = pictureEntity.path!;
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

class VerifyPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        VerifyPageController(Get.find<CacheService>(), Get.find<GCPayApi>()));
  }
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

const String _svg_ehpyic =
    '<svg viewBox="33.0 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_haq7mp =
    '<svg viewBox="0.0 0.0 97.0 1.0" ><path transform="translate(0.0, 0.0)" d="M 0 0 L 96.97104644775391 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yk8u4d =
    '<svg viewBox="0.0 13.9 35.4 1.0" ><path transform="translate(0.0, 13.95)" d="M 0 0 L 35.42134475708008 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_b1xemi =
    '<svg viewBox="0.0 29.9 73.9 1.0" ><path transform="translate(0.0, 29.89)" d="M 0 0 L 73.92280578613281 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cmsjpd =
    '<svg viewBox="0.0 47.8 87.7 1.0" ><path transform="translate(0.0, 47.82)" d="M 0 0 L 87.73069000244141 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xn4l1 =
    '<svg viewBox="23.0 61.8 66.2 1.0" ><path transform="translate(23.05, 61.77)" d="M 0 0 L 66.22251129150391 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
