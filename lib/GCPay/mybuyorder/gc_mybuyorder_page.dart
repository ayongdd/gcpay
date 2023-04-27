import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:copy_paste/copy_paste.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:GCPay/base/controller/base_controller.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';
import 'package:GCPay/http/apiservice/gcpay_api.dart';
import 'package:GCPay/routes/app_routes.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:images_picker/images_picker.dart';
import 'package:ntp/ntp.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';

import '../../3rdparty/button_multiselect.dart';
import '../../3rdparty/utils/button_multiselect_item.dart';
import '../../3rdparty/utils/button_selected_style.dart';
import '../../3rdparty/utils/button_size.dart';
import '../../constant/http_url.dart';
import '../../services/lang/localization_service.dart';
import '../../utils/event_bus.dart';
import '../../utils/permission_handle.dart';
import '../../utils/web_socket_utility.dart';
import '../../widget/paypass/pin_input_controller.dart';
import '../../widget/paypass/pin_plus_keyboard_package.dart';
import '../../widget/webview_page.dart';
import '../Model/UploadPaymentPic_Data_entity.dart';
import '../home_page/Model/HomePage_Record_entity.dart';
import '../home_page/Model/PendingOrderList_Data_entity.dart';
import '../order_page/gc_order_page.dart';
import '../order_page/gc_orderlobby_page.dart';
import '../sellcoin_page/gc_sellcoin_page.dart';

class MyBuyOrderPage extends BaseStatefulWidget<MyBuyOrderController> {
  const MyBuyOrderPage({Key? key}) : super(key: key);

  void openPayVerifyDialog() async {
    PinInputController pinInputController = PinInputController(length: 6);
    Size size = MediaQuery.of(Get.context!).size;
    locationDialog({
      required AlignmentGeometry alignment,
      double width = double.infinity,
      double height = double.infinity,
    }) async {
      await SmartDialog.show(
        alignment: alignment,
        builder: (_) {
          return Container(
            height: 600,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            alignment: Alignment.topCenter,
            child: Center(
                child: Container(
                    width: size.width,
                    height: size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PinPlusKeyBoardPackage(
                          spacing: 80,
                          keyboardFontSize:28,
                          btnHasBorder:false,
                          extraInput: '',
                          pinInputController: pinInputController,
                          onSubmit: () {
                            /// ignore: avoid_print
                            print("Pay Code Password is : " + pinInputController.text);
                            controller.orderConfirm(pinInputController.text);
                          }, keyboardFontFamily: 'Helvetica Neue',
                        ),
                      ],
                    ))),
          );
        },
      );
      await Future.delayed(Duration(milliseconds: 100));
    }

    //bottom
    var resDialog = await locationDialog(height: 70, alignment: Alignment.bottomCenter);
    pinInputController.dispose();
  }

  void openQrCode() {
    SmartDialog.show(
      backDismiss: false,
      clickMaskDismiss: true,
      builder: (_) {
        return Container(
          height: 480,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Expanded(
                  child: PhotoView(
                      imageProvider: NetworkImage(
                controller.rxPaymentData.value.qrCode!.contains('http') ||
                        controller.rxPaymentData.value.qrCode!.contains('https')
                    ? controller.rxPaymentData.value.qrCode!
                    : HttpUrl.BASE_GCPAY_URL +
                        controller.rxPaymentData.value.qrCode!,
              ))),
              ElevatedButton(
                onPressed: () async {
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
                  if (controller.rxPaymentData.value.qrCode!.isNotEmpty) {
                    Uint8List imagebytes = (await NetworkAssetBundle(Uri.parse(
                        controller.rxPaymentData.value.qrCode!
                                            .contains('http') ||
                            controller.rxPaymentData.value.qrCode!
                                            .contains('https')
                                    ? controller.rxPaymentData.value.qrCode!
                                    : HttpUrl.BASE_GCPAY_URL +
                            controller.rxPaymentData.value.qrCode!))
                            .load(controller.rxPaymentData.value.qrCode!
                                        .contains('http') ||
                        controller.rxPaymentData.value.qrCode!
                                        .contains('https')
                                ? controller.rxPaymentData.value.qrCode!
                                : HttpUrl.BASE_GCPAY_URL +
                        controller.rxPaymentData.value.qrCode!))
                        .buffer
                        .asUint8List();

                    final result =
                        await ImageGallerySaver.saveImage(imagebytes);
                    bool resultMap = result['isSuccess'];
                    if (resultMap) {
                      SmartDialog.showToast('savegallery'.tr);
                    }
                  }
                  SmartDialog.dismiss();
                },
                child: Text('保存至相册'),
              )
            ],
          ),
        );
      },
    );
  }

  void openPaymentReceipt() {
    SmartDialog.show(
      backDismiss: false,
      clickMaskDismiss: true,
      builder: (_) {
        return Container(
          height: 480,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          alignment: Alignment.topCenter,
          child: Column(children: [Expanded(child:PhotoView(
              imageProvider: NetworkImage(
                controller.paymentReceiptPic.value.contains('http') ||
                    controller.paymentReceiptPic.value.contains('https')
                    ? controller.paymentReceiptPic.value
                    : HttpUrl.BASE_GCPAY_URL + controller.paymentReceiptPic.value,
              ))),ElevatedButton(
            onPressed: () async {
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
              if (controller.paymentReceiptPic.value.isNotEmpty) {
                Uint8List imagebytes = (await NetworkAssetBundle(
                    Uri.parse(controller.paymentReceiptPic.value.contains('http') ||
                        controller.paymentReceiptPic.value.contains('https')
                        ? controller.paymentReceiptPic.value
                        : HttpUrl.BASE_GCPAY_URL + controller.paymentReceiptPic.value))
                    .load(controller.paymentReceiptPic.value.contains('http') ||
                    controller.paymentReceiptPic.value.contains('https')
                    ? controller.paymentReceiptPic.value
                    : HttpUrl.BASE_GCPAY_URL + controller.paymentReceiptPic.value))
                    .buffer
                    .asUint8List();

                final result =
                await ImageGallerySaver.saveImage(imagebytes);
                bool resultMap = result['isSuccess'];
                if (resultMap) {
                  SmartDialog.showToast('savegallery'.tr);
                }
              }
              SmartDialog.dismiss();
            },
            child: Text('保存至相册'),
          )],),
        );
      },
    );
  }

  String getOrderStatus(int intOrderStatus) {
    if (intOrderStatus == 1) {
      return 'processing'.tr;
    } else if (intOrderStatus == 2) {
      return 'cancelled'.tr;
    } else if (intOrderStatus == 3) {
      return 'paused'.tr;
    } else if (intOrderStatus == 4) {
      return 'completed'.tr;
    }
    return '';
  }

  String getTradeStatus(int intOrderStatus) {
    if (intOrderStatus == 1) {
      return 'tradestatus1'.tr;
    } else if (intOrderStatus == 2) {
      return 'tradestatus2'.tr;
    } else if (intOrderStatus == 3) {
      return 'tradestatus3'.tr;
    } else if (intOrderStatus == 4) {
      return 'tradestatus4'.tr;
    } else if (intOrderStatus == 5) {
      return 'tradestatus5'.tr;
    } else if (intOrderStatus == 6) {
      return 'tradestatus6'.tr;
    }
    return '';
  }

  String getTradeOrderSellName() {
    String strTradeOrderName = '';
    if (controller.tmsTradeOrder.value.buyerPayType == 2) {
      strTradeOrderName = controller.tmsTradeOrder.value.sellerRealName!;
    } else if (controller.tmsTradeOrder.value.buyerPayType == 3) {
      strTradeOrderName =
          controller.tmsTradeOrder.value.umsPaymentSell!.realName!;
    } else {
      strTradeOrderName =
          controller.tmsTradeOrder.value.umsPaymentSell!.account!;
    }
    return strTradeOrderName;
  }

  String getTradeOrderBuyName() {
    String strTradeOrderName = '';
    if (controller.tmsTradeOrder.value.buyerPayType == 2) {
      strTradeOrderName = controller.tmsTradeOrder.value.buyerRealName!;
    } else if (controller.tmsTradeOrder.value.buyerPayType == 3) {
      strTradeOrderName =
          controller.tmsTradeOrder.value.umsPaymentBuyer!.realName!;
    } else {
      strTradeOrderName =
          controller.tmsTradeOrder.value.umsPaymentBuyer!.account!;
    }
    return strTradeOrderName;
  }

  Widget getStatusWidget(int intStatus) {
    if (intStatus == 1) {
      return Pinned.fromPins(
        Pin(size: 300.0, start: 34.0),
        Pin(size: 40.0, start: 62.0),
        child: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(size: 300.0, start: 34.0),
              Pin(size: 4.0, start: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 18.0, start: 0.0),
              Pin(size: 18.0, start: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c646),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 8.0, start: 100.0),
              Pin(size: 8.0, start: 28.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c646),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 8.0, start: 200.0),
              Pin(size: 8.0, start: 28.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c646),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 8.0, start: 325.0),
              Pin(size: 8.0, start: 28.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c646),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (intStatus == 2) {
      return Pinned.fromPins(
        Pin(size: 300.0, start: 34.0),
        Pin(size: 40.0, start: 62.0),
        child: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(size: 300.0, start: 34.0),
              Pin(size: 4.0, start: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 8.0, start: 0.0),
              Pin(size: 8.0, start: 28.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c646),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 18.0, start: 100.0),
              Pin(size: 18.0, start: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c646),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 8.0, start: 200.0),
              Pin(size: 8.0, start: 28.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c646),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 8.0, start: 325.0),
              Pin(size: 8.0, start: 28.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c646),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (intStatus == 3) {
      return Pinned.fromPins(
        Pin(size: 300.0, start: 34.0),
        Pin(size: 40.0, start: 62.0),
        child: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(size: 300.0, start: 34.0),
              Pin(size: 4.0, start: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 8.0, start: 0.0),
              Pin(size: 8.0, start: 28.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c646),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 8.0, start: 100.0),
              Pin(size: 8.0, start: 28.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c646),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 18.0, start: 200.0),
              Pin(size: 18.0, start: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c646),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 8.0, start: 325.0),
              Pin(size: 8.0, start: 28.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c646),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (intStatus == 4) {
      return Pinned.fromPins(
        Pin(size: 300.0, start: 34.0),
        Pin(size: 40.0, start: 62.0),
        child: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(size: 300.0, start: 34.0),
              Pin(size: 4.0, start: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 8.0, start: 0.0),
              Pin(size: 8.0, start: 28.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c646),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 8.0, start: 100.0),
              Pin(size: 8.0, start: 28.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c646),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 8.0, start: 200.0),
              Pin(size: 8.0, start: 28.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c646),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 18.0, start: 325.0),
              Pin(size: 18.0, start: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6c646),
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
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
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.headset_mic),
                  onPressed: () {
                    CacheService cacheservice = Get.find<CacheService>();
                    String? getLocal = cacheservice.loadLanguage();
                    String strCSUrl = cacheservice.rxServiceLink.value;
                    Get.to(WebViewPage(
                      strUrl: strCSUrl,
                      strTitle: 'customerService'.tr,
                      blNavigation: false,
                    ));
                  },
                ),
              ],
            ),
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Stack(
                children: <Widget>[
                  SizedBox(
                      width: 435.0,
                      height: 300.0,
                      child: Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 250.0, start: 0.0),
                              child: Stack(
                                children: <Widget>[
                                  Pinned.fromPins(
                                    Pin(start: 0.0, end: 0.0),
                                    Pin(size: 43.0, middle: 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xff15056d),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(0.0, -0.9),
                                    child: SizedBox(
                                      width: 180.0,
                                      height: 22.0,
                                      child: Stack(
                                        children: <Widget>[
                                          Pinned.fromPins(
                                            Pin(start: 0.0, end: 0.0),
                                            Pin(size: 28.0, middle: 0.5),
                                            child: Text(
                                              'mybuyorder'.tr,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 18,
                                                color: const Color(0xffffffff),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 7.0, end: 7.0),
                                    Pin(size: 172.0, end: 25.0),
                                    child: SvgPicture.string(
                                      _svg_hfmv3,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 206.0, start: 22.0),
                                    Pin(size: 21.0, middle: 0.29),
                                    child: Stack(
                                      children: <Widget>[
                                        Pinned.fromPins(
                                          Pin(start: 0.0, end: 0.0),
                                          Pin(size: 21.0, middle: 0.5),
                                          child: Text(
                                            'paymethod'.tr,
                                            style: TextStyle(
                                              fontFamily: 'Helvetica Neue',
                                              fontSize: 16,
                                              color: const Color(0xff1d4f8b),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(0.215, 0.25),
                                    child: SizedBox(
                                      width: 1.5,
                                      height: 129.0,
                                      child: SvgPicture.string(
                                        _svg_tggv8o,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 35.0, size: 140.0),
                                    Pin(size: 30.0, end: 60.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xff2072d3),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 50.0, start: 30.0),
                                    Pin(size: 50.0, start: 90),
                                    child: Obx(() =>
                                        controller.rxIntPaymentType.value != 0
                                            ? Image.asset(controller
                                                .rxPaymentData.value.icon!)
                                            : Container()),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 120.0, start: 90.0),
                                    Pin(size: 50.0, start: 100),
                                    child: Obx(() =>
                                        controller.rxIntPaymentType.value != 0
                                            ? Text(
                                                controller
                                                    .rxPaymentData.value.name!,
                                                style: TextStyle(
                                                  fontFamily: 'Helvetica Neue',
                                                  fontSize: 16,
                                                  color:
                                                      const Color(0xff1d4f8b),
                                                ),
                                              )
                                            : Container()),
                                  ),
                                  Obx(() =>
                                      controller.rxIntPaymentType.value == 3
                                          ? Pinned.fromPins(
                                              Pin(size: 120.0, end: 5.0),
                                              Pin(size: 55.0, start: 105),
                                              child: Text('bank'.tr +
                                                  ':' +
                                                  controller.rxPaymentData.value
                                                      .bankName!),
                                            )
                                          : Pinned.fromPins(
                                              Pin(size: 125.0, end: 15.0),
                                              Pin(size: 125.0, middle: 0.7861),
                                              child: Container(
                                                height: 100.0,
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: const AssetImage(
                                                        'assets/images/paymentcode_frame.png'),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ))),
                                  Obx(
                                    () => controller.rxIntPaymentType.value == 3
                                        ? Pinned.fromPins(
                                            Pin(size: 160.0, end: 0.0),
                                            Pin(size: 80.0, end: 30),
                                            child: Stack(
                                              children: [
                                                Pinned.fromPins(
                                                  Pin(size: 100.0, start: 15.0),
                                                  Pin(size: 40.0, end: 30),
                                                  child: Text(
                                                    'bankcardnum'.tr + ':',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Pinned.fromPins(
                                                  Pin(size: 50.0, end: 0.0),
                                                  Pin(size: 40.0, end: 60),
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
                                                              controller
                                                                  .rxPaymentData
                                                                  .value
                                                                  .bankCard!);
                                                      Fluttertoast.showToast(
                                                          msg: "CopySuccess".tr,
                                                          gravity: ToastGravity
                                                              .CENTER);
                                                    },
                                                  ),
                                                ),
                                                Pinned.fromPins(
                                                  Pin(size: 120.0, start: 28.0),
                                                  Pin(size: 40.0, end: 5),
                                                  child: Text(controller
                                                      .rxPaymentData
                                                      .value
                                                      .bankCard!),
                                                ),
                                              ],
                                            ))
                                        : Pinned.fromPins(
                                            Pin(size: 50.0, end: 52.0),
                                            Pin(size: 50.0, start: 118),
                                            child: Obx(
                                              () => Container(
                                                height: 50.0,
                                                width: 50.0,
                                                child: controller.getQrcode()
                                                    ? SizedBox(
                                                        height: 50,
                                                        width: 50,
                                                        child: InkWell(
                                                          child:
                                                              CachedNetworkImage(
                                                            height: 50,
                                                            width: 50,
                                                            imageUrl: controller
                                                                        .rxPaymentData
                                                                        .value
                                                                        .qrCode!
                                                                        .contains(
                                                                            'http') ||
                                                                    controller
                                                                        .rxPaymentData
                                                                        .value
                                                                        .qrCode!
                                                                        .contains(
                                                                            'https')
                                                                ? controller
                                                                    .rxPaymentData
                                                                    .value
                                                                    .qrCode!
                                                                : HttpUrl
                                                                        .BASE_GCPAY_URL +
                                                                    controller
                                                                        .rxPaymentData
                                                                        .value
                                                                        .qrCode!,
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
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Icon(Icons
                                                                        .error),
                                                          ),
                                                          onTap: () {
                                                            if(controller.tmsTradeOrder.value.tradeStatus !=1)
                                                              {
                                                                openQrCode();
                                                              }

                                                          },
                                                        ),
                                                      )
                                                    : Container(),
                                              ),
                                            ),
                                          ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 130.0, start: 40.0),
                                    Pin(size: 20.0, end: 64),
                                    child: Text(
                                      'totalavaible'.tr + ' (GC)',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 15,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => Align(
                                      alignment: Alignment(-0.477, 0.768),
                                      child: SizedBox(
                                        width: 100.0,
                                        height: 33.0,
                                        child: Text(
                                          controller.gcAmountUsable.value,
                                          style: TextStyle(
                                            fontFamily: 'Helvetica Neue',
                                            fontSize: 28,
                                            color: const Color(0xe05d5d5d),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Obx(() => controller.rxIntPaymentType.value ==
                                          3
                                      ? Pinned.fromPins(
                                          Pin(size: 90.0, end: 35.0),
                                          Pin(size: 40.0, middle: 0.3001),
                                          child: Obx(() => AutoSizeText(
                                                'sellername'.tr +
                                                    controller.getSellerName(),
                                                textAlign: TextAlign.left,
                                                maxLines: 2,
                                                style: TextStyle(
                                                  fontFamily: 'Helvetica Neue',
                                                  color:
                                                      const Color(0xff5d5d5d),
                                                ),
                                              )),
                                        )
                                      : Pinned.fromPins(
                                          Pin(size: 100.0, end: 30),
                                          Pin(size: 20.0, middle: 0.3001),
                                          child: Obx(() => AutoSizeText(
                                                'sellername'.tr +
                                                    controller.getSellerName(),
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: TextStyle(
                                                  fontFamily: 'Helvetica Neue',
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xff5d5d5d),
                                                ),
                                              )),
                                        )),
                                  Pinned.fromPins(
                                    Pin(size: 50.0, end: 0.0),
                                    Pin(size: 21.0, middle: 0.3),
                                    child: InkWell(
                                      child: Container(
                                        height: 55,
                                        width: 45,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(10.0),
                                              topRight: Radius.circular(10.0)),
                                        ),
                                        child: Image.asset(
                                          color: Colors.black.withOpacity(0.8),
                                          'assets/images/menuicon/copypaste.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      onTap: () async {
                                        await CopyPaste.copyToClipboard(
                                            controller.tmsTradeOrder.value
                                                .umsPaymentSell!.realName!);
                                        Fluttertoast.showToast(
                                            msg: "CopySuccess".tr,
                                            gravity: ToastGravity.CENTER);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 161.0, start: 26.0),
                              Pin(size: 20.0, start: 270.0),
                              child: Text(
                                'whethertosplit'.tr,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 14,
                                  color: const Color(0xff5d5d5d),
                                ),
                              ),
                            ),
                            Align(
                                alignment: Alignment(0.7, 1.02),
                                child: Obx(() => FlutterToggleTab(
                                      // width in percent
                                      width: 48,
                                      borderRadius: 20,
                                      height: 47,
                                      selectedIndex:
                                          controller.splitType.value - 1,
                                      selectedBackgroundColors: [
                                        const Color(0xff1d4f8b)
                                      ],
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
                                        // controller.getExchangeInfo(index);
                                      },
                                      isScroll: false,
                                    ))),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Stack(
                children: <Widget>[
                  SizedBox(
                      width: 435.0,
                      height: 250.0,
                      child: Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(start: -20.0, end: 0.0),
                        child: Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 250.0, start: 0.0),
                              child: Stack(
                                children: <Widget>[
                                  Pinned.fromPins(
                                    Pin(start: 7.0, end: 7.0),
                                    Pin(size: 172.0, end: 25.0),
                                    child: SvgPicture.string(
                                      _svg_hfmv3,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(0.215, 0.25),
                                    child: SizedBox(
                                      width: 1.5,
                                      height: 129.0,
                                      child: SvgPicture.string(
                                        _svg_tggv8o,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 206.0, start: 22.0),
                                    Pin(size: 21.0, middle: 0.29),
                                    child: Stack(
                                      children: <Widget>[
                                        Pinned.fromPins(
                                          Pin(size: 100.0, start: 10.0),
                                          Pin(size: 21.0, middle: 0.5),
                                          child: Text(
                                            'sellername'.tr,
                                            style: TextStyle(
                                              fontFamily: 'Helvetica Neue',
                                              fontSize: 16,
                                              color: const Color(0xff1d4f8b),
                                            ),
                                          ),
                                        ),
                                        Pinned.fromPins(
                                          Pin(size: 50.0, start: 60.0),
                                          Pin(size: 21.0, middle: 0.5),
                                          child: InkWell(
                                            child: Container(
                                              height: 55,
                                              width: 45,
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0)),
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
                                              await CopyPaste.copyToClipboard(
                                                  getTradeOrderSellName());
                                              Fluttertoast.showToast(
                                                  msg: "CopySuccess".tr,
                                                  gravity: ToastGravity.CENTER);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Obx(() =>
                                      controller.rxIntPaymentType.value == 3
                                          ? Pinned.fromPins(
                                              Pin(size: 50.0, start: 30.0),
                                              Pin(size: 50.0, start: 100),
                                              child: Text('Name'.tr + ':'))
                                          : Pinned.fromPins(
                                              Pin(size: 70.0, start: 30.0),
                                              Pin(size: 50.0, start: 100),
                                              child: Text('Account'.tr))),
                                  Pinned.fromPins(
                                    Pin(size: 120.0, start: 95.0),
                                    Pin(size: 50.0, start: 100),
                                    child: Obx(() => controller.tmsTradeOrder
                                                .value.buyerPayType! >
                                            0
                                        ? AutoSizeText(
                                            maxLines: 2,
                                            getTradeOrderSellName(),
                                            style: TextStyle(
                                              fontFamily: 'Helvetica Neue',
                                              fontSize: 16,
                                              color: const Color(0xff1d4f8b),
                                            ),
                                          )
                                        : Container()),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 206.0, start: 22.0),
                                    Pin(size: 21.0, middle: 0.62),
                                    child: Stack(
                                      children: <Widget>[
                                        Pinned.fromPins(
                                          Pin(size: 100.0, start: 10.0),
                                          Pin(size: 21.0, middle: 0.5),
                                          child: Text(
                                            'buyername'.tr,
                                            style: TextStyle(
                                              fontFamily: 'Helvetica Neue',
                                              fontSize: 16,
                                              color: const Color(0xff1d4f8b),
                                            ),
                                          ),
                                        ),
                                        Pinned.fromPins(
                                          Pin(size: 50.0, start: 60.0),
                                          Pin(size: 21.0, middle: 0.5),
                                          child: InkWell(
                                            child: Container(
                                              height: 55,
                                              width: 45,
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0)),
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
                                              await CopyPaste.copyToClipboard(
                                                  getTradeOrderBuyName());
                                              Fluttertoast.showToast(
                                                  msg: "CopySuccess".tr,
                                                  gravity: ToastGravity.CENTER);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 70.0, start: 30.0),
                                    Pin(size: 50.0, start: 170),
                                    child: Obx(() =>
                                        controller.rxIntPaymentType.value == 3
                                            ? Text('Name'.tr + ':')
                                            : Text('Account'.tr)),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 120.0, start: 95.0),
                                    Pin(size: 50.0, start: 170),
                                    child: Obx(() => controller.tmsTradeOrder
                                                .value.buyerPayType! >
                                            0
                                        ? AutoSizeText(
                                      maxLines: 2,
                                            getTradeOrderBuyName(),
                                            style: TextStyle(
                                              fontFamily: 'Helvetica Neue',
                                              fontSize: 16,
                                              color: const Color(0xff1d4f8b),
                                            ),
                                          )
                                        : Container()),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 100.0, end: 30.0),
                                    Pin(size: 100.0, start: 60),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      child: Obx(() => controller
                                                  .orderStatus.value ==
                                              1
                                          ? Obx(() => CircularPercentIndicator(
                                                radius: 50.0,
                                                animation: false,
                                                animationDuration: 1000,
                                                lineWidth: 5.0,
                                                percent:
                                                    controller.rxPercent.value,
                                                circularStrokeCap:
                                                    CircularStrokeCap.butt,
                                                backgroundColor:
                                                    Color(0xff15056d),
                                                progressColor:
                                                    Color(0xff2072d3),
                                              ))
                                          : CircularPercentIndicator(
                                              radius: 50.0,
                                              animation: false,
                                              animationDuration: 1000,
                                              lineWidth: 5.0,
                                              percent: 1,
                                              circularStrokeCap:
                                                  CircularStrokeCap.butt,
                                              backgroundColor:
                                                  Color(0xff15056d),
                                              progressColor: Color(0xff2072d3),
                                            )),
                                    ),
                                  ),
                                  Pinned.fromPins(Pin(size: 100.0, end: 8.0),
                                      Pin(size: 120.0, start: 50),
                                      child: Obx(
                                        () => controller.orderStatus.value ==
                                                    1 &&
                                                controller.rxIntStartSeconds
                                                        .value !=
                                                    0
                                            ? TimerCountdown(
                                                enableDescriptions: false,
                                                spacerWidth: 5,
                                                format: CountDownTimerFormat
                                                    .minutesSeconds,
                                                endTime: DateTime.now().add(
                                                  Duration(
                                                    minutes: controller
                                                        .rxIntStartMinutes
                                                        .value,
                                                    seconds: controller
                                                        .rxIntStartSeconds
                                                        .value,
                                                  ),
                                                ),
                                                onEnd: () {
                                                  print("Timer finished");
                                                },
                                              )
                                            : Align(
                                                alignment: Alignment(-0.5, 0.1),
                                                child: Text('')),
                                      )),
                                  Pinned.fromPins(
                                    Pin(size: 120.0, end: 20.0),
                                    Pin(size: 120.0, end: -45),
                                    child: Obx(
                                        () => controller.orderStatus.value == 1
                                            ? Text(
                                                'orderfinishontime'.tr,
                                                style: TextStyle(
                                                  fontFamily: 'Helvetica Neue',
                                                  fontSize: 12,
                                                  color: Colors.red,
                                                ),
                                              )
                                            : Text(
                                                'order'.tr +
                                                    getOrderStatus(controller
                                                        .orderStatus.value),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(),
                                              )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Stack(
                children: <Widget>[
                  SizedBox(
                      width: 500.0,
                      height: 150.0,
                      child: Pinned.fromPins(
                        Pin(start: 0, end: 0),
                        Pin(start: 0.0, end: 0.0),
                        child: Container(
                          /*container2*/
                          width: 500.0,
                          height: 150.0,
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromPins(
                                Pin(start: 0.0, end: 0.0),
                                Pin(size: 150.0, start: 0.0),
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromPins(
                                      Pin(start: 7.0, end: 7.0),
                                      Pin(size: 142.0, start: 2.4),
                                      child: SvgPicture.string(
                                        _svg_wha9,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Pinned.fromPins(
                                      Pin(start: 25.0, end: 50.0),
                                      Pin(size: 20.0, start: 25),
                                      child: Obx(() => controller
                                                  .tmsTradeOrder !=
                                              null
                                          ? Text(
                                              'ordernum'.tr +
                                                  controller.tmsTradeOrder.value
                                                      .orderNo!,
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 15,
                                                color: const Color(0xff5d5d5d),
                                              ))
                                          : Text(
                                              'ordernum'.tr,
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 15,
                                                color: const Color(0xff5d5d5d),
                                              ),
                                            )),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 50.0, end: 5.0),
                                      Pin(size: 40.0, start: 15),
                                      child: InkWell(
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10.0),
                                                topRight:
                                                    Radius.circular(10.0)),
                                          ),
                                          child: Image.asset(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            'assets/images/menuicon/copypaste.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                        ),
                                        onTap: () async {
                                          await CopyPaste.copyToClipboard(
                                              controller.tmsTradeOrder.value
                                                  .orderNo!);
                                          Fluttertoast.showToast(
                                              msg: "CopySuccess".tr,
                                              gravity: ToastGravity.CENTER);
                                        },
                                      ),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 250.0, start: 25.0),
                                      Pin(size: 20.0, start: 60),
                                      child: Obx(() => controller
                                                  .tmsTradeOrder !=
                                              null
                                          ? Text(
                                              'tradestatus'.tr +
                                                  getTradeStatus(controller
                                                      .tmsTradeOrder
                                                      .value
                                                      .tradeStatus!),
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 15,
                                                color: const Color(0xff5d5d5d),
                                              ))
                                          : Text(
                                              'tradestatus'.tr,
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 15,
                                                color: const Color(0xff5d5d5d),
                                              ),
                                            )),
                                    ),
                                    Obx(() => controller.tmsTradeOrder != null
                                        ? getStatusWidget(controller
                                            .tmsTradeOrder.value.tradeStatus!)
                                        : Container()),
                                    Pinned.fromPins(
                                      Pin(size: 300.0, start: 25.0),
                                      Pin(size: 20.0, start: 110),
                                      child: Obx(() => controller
                                                  .tmsTradeOrder !=
                                              null
                                          ? Text(
                                              'orderdate'.tr +
                                                  controller.tmsTradeOrder.value
                                                      .createDate!,
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 15,
                                                color: const Color(0xff5d5d5d),
                                              ))
                                          : Text(
                                              'orderdate'.tr,
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 15,
                                                color: const Color(0xff5d5d5d),
                                              ),
                                            )),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 203.0, end: 20.0),
                                      Pin(size: 20.0, start: 110),
                                      child: Obx(() => controller
                                                  .tmsTradeOrder !=
                                              null
                                          ? Text(
                                              'orderstatus'.tr +
                                                  getOrderStatus(controller
                                                      .tmsTradeOrder
                                                      .value
                                                      .orderStatus!),
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 15,
                                                color: const Color(0xff5d5d5d),
                                              ))
                                          : Text(
                                              'orderstatus'.tr,
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 15,
                                                color: const Color(0xff5d5d5d),
                                              ),
                                            )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
              Obx(() => controller
                  .orderStatus.value == 1 || controller
                  .orderStatus.value == 3?
                  Positioned(
                    bottom: 45,
                    right: 0,
                    child: FloatingActionButton(
                        heroTag: UniqueKey(),
                        onPressed: () {
                          controller.contactIm();
                        },
                        backgroundColor: Color(0xff2072d3),
                        child: Icon(Icons.call)),
                  ):Container()),
                ],
              ),
            ),
            Obx(() => controller.intPaymentReceiptButtonDisplay.value == 1
                ? SliverToBoxAdapter(
                    child: Stack(
                      children: <Widget>[
                        SizedBox(
                            width: 400.0,
                            height: 180.0,
                            child: Pinned.fromPins(
                              Pin(start: 0, end: 0),
                              Pin(start: 0.0, end: 0.0),
                              child: Container(
                                /*container2*/
                                width: 355.0,
                                height: 180.0,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromPins(
                                      Pin(start: 0.0, end: 0.0),
                                      Pin(size: 180.0, start: 0.0),
                                      child: Stack(
                                        children: <Widget>[
                                          Pinned.fromPins(
                                            Pin(size: 120.0, start: 50),
                                            Pin(size: 40.0, middle: 0.5),
                                            child: ElevatedButton(
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
                                                  if (controller
                                                              .rxIntIdentify ==
                                                          2 &&
                                                      controller.tradeStatus
                                                              .value ==
                                                          2) {
                                                    controller.getImage();
                                                  }
                                                },
                                                child: Text(controller
                                                    .rxButtonPaymentReceiptTitle
                                                    .value)),
                                          ),
                                          Pinned.fromPins(
                                            Pin(size: 120.0, end: 40.0),
                                            Pin(size: 120.0, start: 20.0),
                                            child: Container(
                                                height: 90,
                                                child: Image.asset(
                                                  'assets/images/paymentreceipt.png',
                                                  fit: BoxFit.cover,
                                                  key: UniqueKey(),
                                                )),
                                          ),
                                          Obx(() => controller.paymentReceiptPic
                                                      .value.length >
                                                  0
                                              ? Pinned.fromPins(
                                                  Pin(size: 100.0, end: 50.0),
                                                  Pin(size: 100.0, start: 30.0),
                                                  child: Container(
                                                      width: 100,
                                                      child: InkWell(
                                                        child:
                                                            CachedNetworkImage(
                                                          width: 100,
                                                          imageUrl: controller
                                                                      .paymentReceiptPic
                                                                      .value
                                                                      .contains(
                                                                          'http') ||
                                                                  controller
                                                                      .paymentReceiptPic
                                                                      .value
                                                                      .contains(
                                                                          'https')
                                                              ? controller
                                                                  .paymentReceiptPic
                                                                  .value
                                                              : HttpUrl
                                                                      .BASE_GCPAY_URL +
                                                                  controller
                                                                      .paymentReceiptPic
                                                                      .value,
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
                                                        onTap: () {
                                                          openPaymentReceipt();
                                                        },
                                                      )),
                                                )
                                              : Container(
                                                  height: 50,
                                                  width: 50,
                                                )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Container(
                    height: 10,
                  ))),
            Obx(() => controller.intButtonDisplay.value == 1
                ? SliverToBoxAdapter(
                    child: Stack(
                      children: <Widget>[
                        SizedBox(
                            width: 400.0,
                            height: 100.0,
                            child: Pinned.fromPins(
                              Pin(start: 0, end: 0),
                              Pin(start: 0.0, end: 0.0),
                              child: Container(
                                /*container2*/
                                width: 355.0,
                                height: 100.0,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromPins(
                                      Pin(start: 0.0, end: 0.0),
                                      Pin(size: 50.0, start: 0.0),
                                      child: Stack(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
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
                                                  if(controller.tradeStatus == 3)
                                                    {
                                                      openPayVerifyDialog();
                                                    }
                                                  else
                                                    {
                                                      controller.orderConfirm('');
                                                    }

                                                },
                                                child: Obx(() => Text(controller
                                                    .rxButtonConfirmTitle
                                                    .value)),
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
                                                  controller.orderCancel();
                                                },
                                                child: Obx(() => Text(controller
                                                    .rxButtonCancelTitle
                                                    .value)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Container(
                    height: 10,
                  ))),
            Obx(() => controller.intButtonBuyerCancelDisplay.value == 1
                ? SliverToBoxAdapter(
                    child: Stack(
                      children: <Widget>[
                        SizedBox(
                            width: 400.0,
                            height: 100.0,
                            child: Pinned.fromPins(
                              Pin(start: 0, end: 0),
                              Pin(start: 0.0, end: 0.0),
                              child: Container(
                                /*container2*/
                                width: 355.0,
                                height: 100.0,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromPins(
                                      Pin(start: 0.0, end: 0.0),
                                      Pin(size: 50.0, start: 0.0),
                                      child: Stack(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
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
                                                  controller.orderCancel();
                                                },
                                                child: Obx(() => Text(controller
                                                    .rxButtonCancelTitle
                                                    .value)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Container(
                    height: 10,
                  ))),
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

class MyBuyOrderController extends BaseController {
  var _listTextTabToggle = ["sellnotsplit".tr, "sellsplit".tr];
  final GCPayApi gcpayApi;
  final CacheService cacheservice;
  MyBuyOrderController(this.cacheservice, this.gcpayApi);

  Rx<TmsTradeOrder> tmsTradeOrder = TmsTradeOrder(
    0,
    0,
    '',
    0,
    '',
    '',
    '',
    0,
    '',
    '',
    '',
    '',
    0,
    '',
    '',
    '',
    UmsPaymentBuyer(0, 0, 0, '', '', '', '', '', '', '', '', '', 0),
    UmsPaymentSell(0, 0, 0, '', '', '', '', '', '', '', '', '', 0),
    0,
    0,
    0,
    0,
    0,
    '',
    0,
    '',
    0,
    '',
  ).obs;

  RxList<UmsPaymentSell> paymentmethods = <UmsPaymentSell>[].obs;
  RxInt splitType = 1.obs;
  RxString gcAmountUsable = ''.obs;
  RxString orderNo = ''.obs;
  RxInt sellerUserId = 0.obs;
  RxInt buyerUserId = 0.obs;
  RxInt tradeStatus = 0.obs;
  RxInt orderStatus = 0.obs;
  RxString rxIdentify = ''.obs;
  RxInt rxIntIdentify = 0.obs;
  ButtonSize selectedSize = ButtonSize.medium;
  ButtonSelectedStyle selectedStyle = ButtonSelectedStyle.both;
  List<ButtonMultiSelectItem<PaymentData>> paymentList =
      <ButtonMultiSelectItem<PaymentData>>[].obs;
  int alipayPaymentId = 0;
  int bankPaymentId = 0;
  int weChatPaymentId = 0;
  int eCnyPaymentId = 0;
  RxString rxButtonConfirmTitle = ''.obs;
  RxString rxButtonCancelTitle = ''.obs;
  RxString rxButtonPaymentReceiptTitle = ''.obs;
  RxInt intButtonDisplay = 0.obs;
  RxInt intButtonBuyerCancelDisplay = 0.obs;
  RxInt intPaymentReceiptButtonDisplay = 0.obs;
  RxInt intPaymentPasswordButtonDisplay = 0.obs;

  RxString paymentReceiptPic = ''.obs;
  final paymentPasswordController = TextEditingController();

  RxInt rxIntPaymentType = 0.obs;
  Rx<PaymentData> rxPaymentData = PaymentData(0, 0, '', '', '', '', '').obs;
  RxDouble count = 600.0.obs;
  RxDouble rxPercent = 0.0.obs; //初始倒计时时间
  Timer? timer;
  Timer? queryordertimer;
  RxInt intTimer = 0.obs;
  RxInt intQueryOrderTimer = 0.obs;
  RxInt rxIntStartMinutes = 0.obs;
  RxInt rxIntStartSeconds = 0.obs;
  RxBool isPasswordDisplay = false.obs;
  var eventBusFn;
  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    //getPaymentManageInfo();

    var dataArguments = Get.parameters;
    if(dataArguments.length<=0)
      {
        initDataMember(cacheservice.myTradeOrderEntity);
        queryOrder('');
      }
    else
      {
        orderNo.value = dataArguments['tradeOrderNo']!;
        queryOrder(orderNo.value);
      }


    if (intTimer.value == 1) {
      initTimer();
    }
    eventBusFn = eventBus.on<EventFn>().listen((event) {
      //  event为 event.obj 即为 eventBus.dart 文件中定义的 EventFn 类中监听的数据
      print(event.obj);
      var eventObj = event.obj;
      if (eventObj['eventbus'] == 'websocket') {
        String strOrderNo = eventObj['tradOrderNo'];
        if(strOrderNo == orderNo.value)
          {
            queryOrder(strOrderNo);
          }

      }
    });
  }

  void initTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (rxPercent.value >= 1) {
        timer.cancel(); //倒计时结束取消定时器//按钮可点击
        rxPercent.value = 0; //重置时间
        orderStatus.value = 2;
        showToast('order'.tr + 'cancelled'.tr);
        Future.delayed(Duration(seconds: 2), () {
          Get.back();
        });
//重置按钮文本
      } else {
        //更新文本内容
      }
      double intPercent = rxPercent.value;
      if ((intPercent + 1 / 1200) > 1) {
        rxPercent.value = 1;
      } else {
        rxPercent.value = rxPercent.value + 1 / 1200;
      }
    });
  }

  void initQueryOrderTimer() {
    queryordertimer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (orderNo.value.length > 0) {
        queryOrder(orderNo.value);
      }
    });
  }
    @override
  void onClose() {
    paymentPasswordController.dispose();
    timer?.cancel();
    timer = null;
    //queryordertimer?.cancel();
    //queryordertimer = null;
    eventBusFn.cancel();
    super.onClose();
  }

  Future<void> initDataMember(TmsTradeOrder tradeOrder) async {
    tmsTradeOrder.value = tradeOrder;
    tradeStatus.value = tmsTradeOrder.value.tradeStatus!;
    orderStatus.value = tmsTradeOrder.value.orderStatus!;
    if (tmsTradeOrder.value.sellerUserId.toString() ==
        cacheservice.cacheuserId) {
      rxIdentify.value = 'iamseller'.tr;
      rxIntIdentify.value = 1;
      if (tradeStatus.value == 1) {
        intButtonDisplay.value = 1;
        rxButtonConfirmTitle.value = 'orderconfirm'.tr;
        rxButtonCancelTitle.value = 'ordercancel'.tr;
      } else if (tradeStatus.value == 2) {
        intButtonDisplay.value = 0;
      } else if (tradeStatus.value == 3) {
        intButtonDisplay.value = 1;
        intPaymentReceiptButtonDisplay.value = 1;
        intPaymentPasswordButtonDisplay.value = 1;
        rxButtonConfirmTitle.value = 'orderconfirm'.tr;
        rxButtonCancelTitle.value = 'crappeal'.tr;
        rxButtonPaymentReceiptTitle.value = 'buypayreceipt'.tr;
        paymentReceiptPic.value = tmsTradeOrder.value.paymentPic!;
      } else if (tradeStatus.value == 4) {
        intButtonDisplay.value = 0;
        intPaymentPasswordButtonDisplay.value = 0;
        intPaymentReceiptButtonDisplay.value = 1;
        rxButtonPaymentReceiptTitle.value = 'buypayreceipt'.tr;
        paymentReceiptPic.value = tmsTradeOrder.value.paymentPic!;
      }
    } else if (tmsTradeOrder.value.buyerUserId.toString() ==
        cacheservice.cacheuserId) {
      rxIdentify.value = 'iambuyer'.tr;
      rxIntIdentify.value = 2;
      if (tradeStatus.value == 1) {
        intButtonDisplay.value = 0;
        rxButtonCancelTitle.value = 'ordercancel'.tr;
        intButtonBuyerCancelDisplay.value = 1;
      } else if (tradeStatus.value == 2) {
        intButtonDisplay.value = 1;
        intPaymentReceiptButtonDisplay.value = 1;
        rxButtonConfirmTitle.value = 'tradetransfer'.tr;
        rxButtonCancelTitle.value = 'ordercancel'.tr;
        rxButtonPaymentReceiptTitle.value = 'uploadpayreceipt'.tr;
        intButtonBuyerCancelDisplay.value = 0;
      } else if (tradeStatus.value == 3) {
        intButtonDisplay.value = 0;
        intPaymentReceiptButtonDisplay.value = 0;
      } else if (tradeStatus.value == 4) {
        intButtonDisplay.value = 0;
        intPaymentReceiptButtonDisplay.value = 1;
        rxButtonPaymentReceiptTitle.value = 'buypayreceipt'.tr;
        paymentReceiptPic.value = tmsTradeOrder.value.paymentPic!;
      }
    }

    if (tmsTradeOrder.value.orderStatus == 4) {
      intButtonDisplay.value = 0;
      intPaymentPasswordButtonDisplay.value = 0;
    } else if (tmsTradeOrder.value.orderStatus == 2) {
      intButtonDisplay.value = 0;
      intButtonBuyerCancelDisplay.value = 0;
      intPaymentReceiptButtonDisplay.value = 0;
      intPaymentPasswordButtonDisplay.value = 0;
    } else if (tmsTradeOrder.value.orderStatus == 1) {
      intTimer.value = 1;
    }
    if (tmsTradeOrder.value.sellType != null) {
      splitType.value = tmsTradeOrder.value.sellType!;
    }

    gcAmountUsable.value = tmsTradeOrder.value.gcAmount.toString();
    orderNo.value = tmsTradeOrder.value.tradeOrderNo.toString();
    sellerUserId.value = tmsTradeOrder.value.sellerUserId!;
    buyerUserId.value = int.parse(cacheservice.cacheuserId!);
    int intPaymentType = tmsTradeOrder.value.umsPaymentSell!.paymentType!;
    getStrSellPaymentIcon(intPaymentType);
    rxIntPaymentType.value = tmsTradeOrder.value.umsPaymentSell!.paymentType!;
    String strOrderStartTime = tmsTradeOrder.value.orderStartTime!;
    //String strSystemNowTime = tmsTradeOrder.value.nowTime!.toString();
    DateTime dateOrder = DateTime.parse(strOrderStartTime);
    DateTime dateNow = await NTP.now();
    print('NTP DateTime: ${dateNow}');
    //DateTime dateNow = DateTime.now();
    int intTimeDifference =
        dateNow.millisecondsSinceEpoch - dateOrder.millisecondsSinceEpoch;
    double dbDifference = (intTimeDifference / 1000);
    rxIntStartMinutes.value = ((1200 - dbDifference.toInt()) / 60).toInt();
    rxIntStartSeconds.value = ((1200 - dbDifference.toInt()) % 60).toInt();
    rxPercent.value = dbDifference / 1200;
    if (rxPercent.value > 1) {
      rxPercent.value = 1;
    }
  }

  String getSellerName() {
    String strSellerName = '';
    if (tmsTradeOrder.value.sellerRealName != null) {
      strSellerName = tmsTradeOrder.value.sellerRealName!;
    } else if (tmsTradeOrder.value.sellerNickname != null) {
      strSellerName = tmsTradeOrder.value.sellerNickname!;
    }
    return strSellerName;
  }

  void getStrSellPaymentIcon(intPaymentType) {
    if (intPaymentType == 1) {
      rxPaymentData.value.name = 'alipay'.tr;
      rxPaymentData.value.icon = "assets/images/alipay.png";
      rxPaymentData.value.qrCode = tmsTradeOrder.value.umsPaymentSell!.qrCode;
    } else if (intPaymentType == 2) {
      rxPaymentData.value.name = 'wechat'.tr;
      rxPaymentData.value.icon = "assets/images/wechat.png";
      rxPaymentData.value.qrCode = tmsTradeOrder.value.umsPaymentSell!.qrCode;
    } else if (intPaymentType == 3) {
      rxPaymentData.value.name = 'bank'.tr;
      rxPaymentData.value.icon = "assets/images/union_pay.png";
      rxPaymentData.value.qrCode = tmsTradeOrder.value.umsPaymentSell!.qrCode;
      rxPaymentData.value.bankName =
          tmsTradeOrder.value.umsPaymentSell!.bankName;
      rxPaymentData.value.bankCard =
          tmsTradeOrder.value.umsPaymentSell!.bankCard;
    } else if (intPaymentType == 4) {
      rxPaymentData.value.name = 'ECNY'.tr;
      rxPaymentData.value.icon = "assets/images/ECNY.png";
      rxPaymentData.value.qrCode = tmsTradeOrder.value.umsPaymentSell!.qrCode;
    } else if (intPaymentType == 5) {
      rxPaymentData.value.name = 'qqpay'.tr;
      rxPaymentData.value.icon = "assets/images/qqpay.png";
      rxPaymentData.value.qrCode = tmsTradeOrder.value.umsPaymentSell!.qrCode;
    }
  }

  bool getQrcode() {
    bool blValideQrcode = false;
    if (rxPaymentData.value.qrCode!.length > 0) {
      if (rxPaymentData.value.qrCode!.contains('png') ||
          rxPaymentData.value.qrCode!.contains('jpg') ||
          rxPaymentData.value.qrCode!.contains('jpeg')) {
        blValideQrcode = true;
      }
    }
    if(tmsTradeOrder.value.tradeStatus==1)
      {
        blValideQrcode = false;
      }
    return blValideQrcode;
  }

  Future<void> getPaymentManageInfo() async {
    try {
      var response = await gcpayApi.getUmsPayment();
      if (response.code == 400) {}
      if (response.code == 200) {
        paymentmethods.value = response.data!;
        setPaymentMultiSelectItem();
      } else {}
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future<void> queryOrder(String strTradeOrderNo) async {
    try {
      String strtradeorderno = '';
      if(strTradeOrderNo.length > 0)
        {
          strtradeorderno = strTradeOrderNo;
        }
      else
        {
          strTradeOrderNo = tmsTradeOrder.value.tradeOrderNo!;
        }
      Map<String, dynamic> data = <String, dynamic>{
        'tradeOrderNo': strTradeOrderNo,
      };
      var response = await gcpayApi.queryOrder(data);
      if (response.code == 400) {}
      if (response.code == 200) {
        TmsTradeOrder tradeOrder = response.data!;
        initDataMember(tradeOrder);
      } else {}
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future<void> orderCancel() async {
    if (rxIntIdentify.value == 1) {
      if (tradeStatus.value == 3) {
        Get.to(WebViewPage(
          strUrl: cacheservice.rxServiceLink.value,
          strTitle: 'customerService'.tr,
          blNavigation: false,
        ));
      } else {
        try {
          Map<String, dynamic> data = <String, dynamic>{
            'confirmFlag': false,
            'tradeOrderNo': tmsTradeOrder.value.tradeOrderNo!,
          };
          var response = await gcpayApi.sellerConfirm(data);
          if (response.code == 400) {}
          if (response.code == 200) {
            queryOrder('');
            showToast(response.msg);
          } else {}
        } catch (err, _) {
          log('${err}');
          rethrow;
        }
      }
    } else if (rxIntIdentify.value == 2) {
      try {
        Map<String, dynamic> data = <String, dynamic>{
          'confirmFlag': false,
          'tradeOrderNo': tmsTradeOrder.value.tradeOrderNo!,
        };
        var response = await gcpayApi.buyersTransfer(data);
        if (response.code == 400) {}
        if (response.code == 200) {
          showToast(response.msg);
          Get.back();
        } else {}
      } catch (err, _) {
        log('${err}');
        rethrow;
      }
    }
  }

  Future<void> contactIm() async {
    if (rxIntIdentify == 1) {
      WebSocketUtility().sentCallOrder(tmsTradeOrder.value.buyerUserId.toString(),tmsTradeOrder.value.tradeOrderNo!);
      showToast('sendwscalltobuyer'.tr);
    } else if (rxIntIdentify == 2) {
      WebSocketUtility().sentCallOrder(tmsTradeOrder.value.sellerUserId.toString(),tmsTradeOrder.value.tradeOrderNo!);
      showToast('sendwscalltoseller'.tr);
    }

  }

  Future<void> orderConfirm(String strPayPassword) async {
    //1 Seller 2 Buyer
    if (rxIntIdentify.value == 1) {
      if (tradeStatus.value == 3) {
        try {
          Map<String, dynamic> data = <String, dynamic>{
            'confirmFlag': true,
            'payPassword': strPayPassword,
            'tradeOrderNo': tmsTradeOrder.value.tradeOrderNo!,
          };
          var response = await gcpayApi.sellerRelease(data);
          if (response.code == 400) {}
          if (response.code == 200) {
            queryOrder('');
            intButtonDisplay.value = 0;
            SmartDialog.dismiss();
            showToast(response.msg);
          } else {
            showToast(response.msg);
          }
        } catch (err, _) {
          log('${err}');
          rethrow;
        }
      } else {
        try {
          Map<String, dynamic> data = <String, dynamic>{
            'confirmFlag': true,
            'tradeOrderNo': tmsTradeOrder.value.tradeOrderNo!,
          };
          var response = await gcpayApi.sellerConfirm(data);
          showToast(response.msg);
          if (response.code == 400) {}
          if (response.code == 200) {
            intButtonDisplay.value = 0;
            queryOrder('');
          } else {}
        } catch (err, _) {
          log('${err}');
          rethrow;
        }
      }
    } else if (rxIntIdentify.value == 2) {
      if (tradeStatus.value == 1) {
        showToast('waitingsellerconfirm'.tr);
      } else {
        try {
          Map<String, dynamic> data = <String, dynamic>{
            'confirmFlag': true,
            'paymentPic': paymentReceiptPic.value,
            'tradeOrderNo': tmsTradeOrder.value.tradeOrderNo!,
          };
          var response = await gcpayApi.buyersTransfer(data);
          showToast(response.msg);
          if (response.code == 400) {}
          if (response.code == 200) {
            intPaymentReceiptButtonDisplay.value = 0;
            intButtonDisplay.value = 0;
            queryOrder('');
          } else {}
        } catch (err, _) {
          log('${err}');
          rethrow;
        }
      }
    }
  }

  Future<void> uploadPaymentReceiptFromImage(String imageFile) async {
    try {
      var response = await gcpayApi.uploadPaymentPic(imageFile);
      if (response.code == 200) {
        UploadPaymentPicDataEntity paymentQrcodePictureEntity = response.data!;
        paymentReceiptPic.value = paymentQrcodePictureEntity.url!;

        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
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
      if (cacheservice.rxLanguage.value == '1') {
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
        uploadPaymentReceiptFromImage(res[0].path);
      }
    } catch (e) {
      debugPrint(e.toString());
      showToast(e.toString());
    }
  }

  void setPaymentMultiSelectItem() {
    for (int i = 0; i < paymentmethods.value.length; i++) {
      UmsPaymentSell paymentEntity = paymentmethods.value[i];
      if (paymentEntity.paymentType == 1) {
        ButtonMultiSelectItem<PaymentData> _itemTest1 =
            ButtonMultiSelectItem<PaymentData>(
          label: 'alipay'.tr,
          value: PaymentData(
              paymentEntity.paymentType!,
              paymentEntity.id!,
              "assets/images/alipay.png",
              'alipay',
              paymentEntity.qrCode != null ? paymentEntity.qrCode! : '',
              '',
              ''),
          icon: Image(
            image: AssetImage("assets/images/alipay.png"),
          ),
        );
        paymentList.add(_itemTest1);
      } else if (paymentEntity.paymentType == 2) {
        ButtonMultiSelectItem<PaymentData> _itemTest2 =
            ButtonMultiSelectItem<PaymentData>(
          label: 'wechat'.tr,
          value: PaymentData(
              paymentEntity.paymentType!,
              paymentEntity.id!,
              "assets/images/wechat.png",
              'wechat',
              paymentEntity.qrCode != null ? paymentEntity.qrCode! : '',
              '',
              ''),
          icon: Image(
            image: AssetImage("assets/images/wechat.png"),
          ),
        );
        paymentList.add(_itemTest2);
      } else if (paymentEntity.paymentType == 3) {
        ButtonMultiSelectItem<PaymentData> _itemTest3 =
            ButtonMultiSelectItem<PaymentData>(
          label: 'bank'.tr,
          value: PaymentData(
              paymentEntity.paymentType!,
              paymentEntity.id!,
              "assets/images/union_pay.png",
              'bank',
              paymentEntity.qrCode != null ? paymentEntity.qrCode! : '',
              paymentEntity.bankName,
              paymentEntity.bankCard),
          icon: Image(
            image: AssetImage("assets/images/union_pay.png"),
          ),
        );
        paymentList.add(_itemTest3);
      } else if (paymentEntity.paymentType == 4) {
        ButtonMultiSelectItem<PaymentData> _itemTest4 =
            ButtonMultiSelectItem<PaymentData>(
          label: 'ECNY'.tr,
          value: PaymentData(
              paymentEntity.paymentType!,
              paymentEntity.id!,
              "assets/images/ECNY.png",
              'ecny',
              paymentEntity.qrCode != null ? paymentEntity.qrCode! : '',
              '',
              ''),
          icon: Image(
            image: AssetImage("assets/images/ECNY.png"),
          ),
        );
        paymentList.add(_itemTest4);
      } else if (paymentEntity.paymentType == 5) {
        ButtonMultiSelectItem<PaymentData> _itemTest5 =
        ButtonMultiSelectItem<PaymentData>(
          label: 'qqpay'.tr,
          value: PaymentData(
              paymentEntity.paymentType!,
              paymentEntity.id!,
              "assets/images/qqpay.png",
              'qqpay',
              paymentEntity.qrCode != null ? paymentEntity.qrCode! : '',
              '',
              ''),
          icon: Image(
            image: AssetImage("assets/images/qqpay.png"),
          ),
        );
        paymentList.add(_itemTest5);
      }
    }
  }
}

class MyBuyOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        MyBuyOrderController(Get.put(CacheService()), Get.put(GCPayApi())));
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

const String _svg_hfmv3 =
    '<svg viewBox="21.0 594.0 406.0 172.0" ><path transform="translate(21.0, 594.0)" d="M 231.0462036132812 172 L 231.0452117919922 172 L 15.00030422210693 171.9990081787109 C 10.99355411529541 171.9990081787109 7.226654052734375 170.4387054443359 4.393454074859619 167.6055603027344 C 1.560304164886475 164.7723541259766 4.223632913635811e-06 161.0054473876953 4.223632913635811e-06 156.9987030029297 L 4.223632913635811e-06 15.00030422210693 C 4.223632913635811e-06 10.99360466003418 1.560304164886475 7.22685432434082 4.393454074859619 4.393904209136963 C 7.226604461669922 1.561054229736328 10.99355411529541 0.0009042236488312483 15.00030422210693 0.0009042236488312483 L 231.0462036132812 0.0009042236488312483 C 231.0462036132812 2.211854219436646 231.5402069091797 4.356704235076904 232.5155029296875 6.376904010772705 C 233.4571990966797 8.327404022216797 234.8052978515625 10.0791540145874 236.5224609375 11.58345413208008 C 240.0538482666016 14.67715454101562 244.7492523193359 16.38090515136719 249.7436981201172 16.38090515136719 C 254.7378082275391 16.38090515136719 259.43310546875 14.67715454101562 262.964599609375 11.58345413208008 C 264.6817932128906 10.07910442352295 266.0299987792969 8.327404022216797 266.9717407226562 6.376904010772705 C 267.9468078613281 4.357504367828369 268.4411926269531 2.21230411529541 268.4411926269531 0.0009042236488312483 L 391.0005187988281 0.0009042236488312483 C 395.0068969726562 0.0009042236488312483 398.7735595703125 1.561054229736328 401.6065673828125 4.393904209136963 C 404.4396667480469 7.226904392242432 405.9999084472656 10.99365425109863 405.9999084472656 15.00030422210693 L 405.9999084472656 156.9987030029297 C 405.9999084472656 161.0054016113281 404.4396667480469 164.7723083496094 401.6065673828125 167.6055603027344 C 398.7734985351562 170.4387054443359 395.0068664550781 171.9990081787109 391.0005187988281 171.9990081787109 L 268.4411926269531 171.9990081787109 C 268.4411926269531 169.7879486083984 267.9471435546875 167.6430511474609 266.9717407226562 165.6229095458984 C 266.0299987792969 163.6723022460938 264.6817932128906 161.9204559326172 262.964599609375 160.4160003662109 C 259.4330139160156 157.3220520019531 254.7377014160156 155.6181030273438 249.7436981201172 155.6181030273438 C 244.7492980957031 155.6181030273438 240.0539093017578 157.3220520019531 236.5224609375 160.4160003662109 C 234.8052978515625 161.9204559326172 233.4571533203125 163.6723022460938 232.5155029296875 165.6229095458984 C 231.5405578613281 167.6424102783203 231.0462036132812 169.7876586914062 231.0462036132812 171.9990081787109 L 231.0462036132812 172 Z" fill="#d3e0f0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wha9 =
    '<svg viewBox="21.0 356.0 406.0 172.0" ><path transform="translate(21.0, 356.0)" d="M 231.0462036132812 172 L 231.0452117919922 172 L 15.00030422210693 171.9990081787109 C 10.99355411529541 171.9990081787109 7.226654052734375 170.4387054443359 4.393454074859619 167.6055603027344 C 1.560304164886475 164.7723541259766 4.223632913635811e-06 161.0054473876953 4.223632913635811e-06 156.9987030029297 L 4.223632913635811e-06 15.00030422210693 C 4.223632913635811e-06 10.99360466003418 1.560304164886475 7.22685432434082 4.393454074859619 4.393904209136963 C 7.226604461669922 1.561054229736328 10.99355411529541 0.0009042236488312483 15.00030422210693 0.0009042236488312483 L 231.0462036132812 0.0009042236488312483 C 231.0462036132812 2.211854219436646 231.5402069091797 4.356704235076904 232.5155029296875 6.376904010772705 C 233.4571990966797 8.327404022216797 234.8052978515625 10.0791540145874 236.5224609375 11.58345413208008 C 240.0538482666016 14.67715454101562 244.7492523193359 16.38090515136719 249.7436981201172 16.38090515136719 C 254.7378082275391 16.38090515136719 259.43310546875 14.67715454101562 262.964599609375 11.58345413208008 C 264.6817932128906 10.07910442352295 266.0299987792969 8.327404022216797 266.9717407226562 6.376904010772705 C 267.9468078613281 4.357504367828369 268.4411926269531 2.21230411529541 268.4411926269531 0.0009042236488312483 L 391.0005187988281 0.0009042236488312483 C 395.0068969726562 0.0009042236488312483 398.7735595703125 1.561054229736328 401.6065673828125 4.393904209136963 C 404.4396667480469 7.226904392242432 405.9999084472656 10.99365425109863 405.9999084472656 15.00030422210693 L 405.9999084472656 156.9987030029297 C 405.9999084472656 161.0054016113281 404.4396667480469 164.7723083496094 401.6065673828125 167.6055603027344 C 398.7734985351562 170.4387054443359 395.0068664550781 171.9990081787109 391.0005187988281 171.9990081787109 L 268.4411926269531 171.9990081787109 C 268.4411926269531 169.7879486083984 267.9471435546875 167.6430511474609 266.9717407226562 165.6229095458984 C 266.0299987792969 163.6723022460938 264.6817932128906 161.9204559326172 262.964599609375 160.4160003662109 C 259.4330139160156 157.3220520019531 254.7377014160156 155.6181030273438 249.7436981201172 155.6181030273438 C 244.7492980957031 155.6181030273438 240.0539093017578 157.3220520019531 236.5224609375 160.4160003662109 C 234.8052978515625 161.9204559326172 233.4571533203125 163.6723022460938 232.5155029296875 165.6229095458984 C 231.5405578613281 167.6424102783203 231.0462036132812 169.7876586914062 231.0462036132812 171.9990081787109 L 231.0462036132812 172 Z" fill="#d3e0f0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_tggv8o =
    '<svg viewBox="268.6 373.0 1.0 138.5" ><path transform="translate(268.59, 372.98)" d="M 0 138.5389556884766 L 0 0" fill="none" stroke="#5e5e5e" stroke-width="2" stroke-dasharray="4 4" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ehpyic =
    '<svg viewBox="33.0 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ai0gea =
    '<svg viewBox="33.5 572.0 381.5 1.0" ><path transform="translate(33.5, 572.0)" d="M 0 0 L 381.50048828125 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
