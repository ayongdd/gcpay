import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:copy_paste/copy_paste.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:group_button/group_button.dart';
import 'package:GCPay/base/controller/base_controller.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';
import 'package:GCPay/http/apiservice/gcpay_api.dart';
import 'package:GCPay/routes/app_routes.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';

import '../../3rdparty/button_multiselect.dart';
import '../../3rdparty/utils/button_multiselect_item.dart';
import '../../3rdparty/utils/button_selected_style.dart';
import '../../3rdparty/utils/button_size.dart';
import '../../constant/http_url.dart';
import '../../utils/permission_handle.dart';
import '../../widget/paypass/flutter_verification_code.dart';
import '../../widget/paypass/onscreen_num_keyboard.dart';
import '../home_page/Model/HomePage_Record_entity.dart';
import '../home_page/Model/PendingOrderList_Data_entity.dart';
import '../order_page/gc_order_page.dart';
import '../order_page/gc_orderlobby_page.dart';
import '../sellcoin_page/gc_sellcoin_page.dart';

class MySellOrderPage extends BaseStatefulWidget<MySellOrderController> {
  const MySellOrderPage({Key? key}) : super(key: key);

  List<Widget> paymentIcon(List<PaymentData> paymentmethods) {
    List<Widget> list = [];
    //i<5, pass your dynamic limit as per your requirment
    String strPayImage = '';
    for (int i = 0; i < paymentmethods.length; i++) {
      if (paymentmethods[i].paymentType == 1) {
        strPayImage = 'assets/images/alipay.png';
      } else if (paymentmethods[i].paymentType == 2) {
        strPayImage = 'assets/images/wechat.png';
      } else if (paymentmethods[i].paymentType == 3) {
        strPayImage = 'assets/images/union_pay.png';
      } else if (paymentmethods[i].paymentType == 4) {
        strPayImage = 'assets/images/ECNY.png';
      } else if (paymentmethods[i].paymentType == 5) {
        strPayImage = 'assets/images/qqpay.png';
      }
      list.add(InkWell(
        child: Image.asset(
          strPayImage,
          height: 32,
        ),onTap: () {
        controller.sellpaymentIndex = i;
        controller.rxCurrentSellPayment
            .value =
        controller
            .sellpaymentList[i];
        controller.rxCurrentSellQrcode
            .value =
        controller
            .sellpaymentList[i]
            .qrCode!;
        controller
            .rxCurrentSellPaymentType
            .value =
            controller
                .rxCurrentSellPayment
                .value
                .paymentType;
      },));
      //add any Widget in place of Text("Index $i")
    }
    return list; // all widget added now retrun the list here
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
                  controller.rxCurrentSellQrcode.value.contains('http') ||
                          controller.rxCurrentSellQrcode.value.contains('https')
                      ? controller.rxCurrentSellQrcode.value
                      : HttpUrl.BASE_GCPAY_URL +
                          controller.rxCurrentSellQrcode.value,
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
                    if (controller.rxCurrentSellQrcode.value.isNotEmpty) {
                      Uint8List imagebytes = (await NetworkAssetBundle(
                                  Uri.parse(controller.rxCurrentSellQrcode.value
                                              .contains('http') ||
                                          controller.rxCurrentSellQrcode.value
                                              .contains('https')
                                      ? controller.rxCurrentSellQrcode.value
                                      : HttpUrl.BASE_GCPAY_URL +
                                          controller.rxCurrentSellQrcode.value))
                              .load(controller.rxCurrentSellQrcode.value
                                          .contains('http') ||
                                      controller.rxCurrentSellQrcode.value
                                          .contains('https')
                                  ? controller.rxCurrentSellQrcode.value
                                  : HttpUrl.BASE_GCPAY_URL +
                                      controller.rxCurrentSellQrcode.value))
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
            ));
      },
    );
  }

  String getOrderStatus(int intOrderStatus) {
    if (intOrderStatus == 1) {
      return 'processing'.tr;
    } else if (intOrderStatus == 2) {
      return 'cancelled'.tr;
    } else if (intOrderStatus == 3) {
      return 'completed'.tr;
    }
    return '';
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
                        alignment: Alignment.center,
                        child: ClipPath(
                          clipper:
                              CustomShape(), // this is my own class which extendsCustomClipper
                          child: Container(
                            width: 700,
                            height: 600,
                            color: Color(0xff2072d3),
                            child: Align(
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
              child: Stack(
                children: <Widget>[
                  SizedBox(
                      width: 435.0,
                      height: 320.0,
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
                                      width: 152.0,
                                      height: 28.0,
                                      child: Stack(
                                        children: <Widget>[
                                          Pinned.fromPins(
                                            Pin(start: 0.0, end: 0.0),
                                            Pin(size: 28.0, middle: 0.5),
                                            child: Text(
                                              'mysellorder'.tr,
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
                                    Pin(size: 206.0, start: 53.0),
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
                                  Pinned.fromPins(
                                    Pin(size: 200.0, start: 15),
                                    Pin(size: 150.0, start: 45.0),
                                    child: Obx(() => controller
                                                .paymentmethods.value.length <=4
                                        ? SizedBox(
                                            width: 200,
                                            height: 150,
                                            child: GroupButton(
                                              isRadio: false,
                                              controller: controller
                                                  .sellgroupcontroller,
                                              onSelected: (val, i, selected) {
                                                controller.sellpaymentIndex = i;
                                                controller.rxCurrentSellPayment
                                                        .value =
                                                    controller
                                                        .sellpaymentList[i];
                                                controller.rxCurrentSellQrcode
                                                        .value =
                                                    controller
                                                        .sellpaymentList[i]
                                                        .qrCode!;
                                                controller
                                                        .rxCurrentSellPaymentType
                                                        .value =
                                                    controller
                                                        .rxCurrentSellPayment
                                                        .value
                                                        .paymentType;
                                              },
                                              buttons:
                                                  controller.sellpaymentList,
                                              buttonBuilder:
                                                  (selected, data, context) {
                                                bool pressAttention = false;
                                                PaymentData paymentdata =
                                                    data as PaymentData;
                                                return Card(
                                                  color: paymentdata.name ==
                                                          controller
                                                                  .sellpaymentListName[
                                                              controller
                                                                  .sellpaymentIndex]
                                                      ? Colors.blueAccent
                                                      : Colors.white,
                                                  child: Container(
                                                      height: 34,
                                                      width: 34,
                                                      alignment:
                                                          Alignment.center,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                              paymentdata
                                                                  .icon!),
                                                        ],
                                                      )),
                                                );
                                              },
                                            ),
                                          )
                                        : Container(
                                      width: 230,
                                      height: 150,
                                      alignment: Alignment.center,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child:                                             Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: paymentIcon(controller
                                              .sellpaymentList),
                                        ),),
                                    )),
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
                                    Pin(start: 40.0, size: 150.0),
                                    Pin(size: 30.0, end: 65.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xff2072d3),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 130.0, start: 50.0),
                                    Pin(size: 20.0, end: 69.0),
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
                                      alignment: Alignment(-0.400, 0.735),
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
                                  Pinned.fromPins(
                                    Pin(size: 125.0, end: 0.0),
                                    Pin(size: 20.0, middle: 0.3001),
                                    child: Obx(() => Text(
                                          'sellername'.tr +
                                              controller
                                                  .tmsSellOrder.value.realName!,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'Helvetica Neue',
                                            fontSize: 14,
                                            color: const Color(0xff5d5d5d),
                                          ),
                                        )),
                                  ),
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
                                            controller
                                                .tmsSellOrder.value.realName!);
                                        Fluttertoast.showToast(
                                            msg: "CopySuccess".tr,
                                            gravity: ToastGravity.CENTER);
                                      },
                                    ),
                                  ),
                                  Obx(() => controller
                                              .rxCurrentSellPaymentType.value ==
                                          3
                                      ? Pinned.fromPins(
                                          Pin(size: 125.0, end: 0.0),
                                          Pin(size: 55.0, start: 105),
                                          child: Text('bank'.tr +
                                              ':' +
                                              controller.rxCurrentSellPayment
                                                  .value.bankName!),
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
                                  Obx(() => controller
                                              .rxCurrentSellPaymentType.value ==
                                          3
                                      ? Pinned.fromPins(
                                          Pin(size: 160.0, end: 0.0),
                                          Pin(size: 80.0, end: 40),
                                          child: Stack(
                                            children: [
                                              Pinned.fromPins(
                                                Pin(size: 100.0, start: 15.0),
                                                Pin(size: 40.0, end: 30),
                                                child: Text(
                                                  'bankcardnum'.tr,
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
                                                    alignment: Alignment.center,
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomRight:
                                                                  Radius
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
                                                        .copyToClipboard(controller
                                                            .rxCurrentSellPayment
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
                                                    .rxCurrentSellPayment
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
                                                                        .rxCurrentSellQrcode
                                                                        .value
                                                                        .contains(
                                                                            'http') ||
                                                                    controller
                                                                        .rxCurrentSellQrcode
                                                                        .value
                                                                        .contains(
                                                                            'https')
                                                                ? controller
                                                                    .rxCurrentSellQrcode
                                                                    .value
                                                                : HttpUrl
                                                                        .BASE_GCPAY_URL +
                                                                    controller
                                                                        .rxCurrentSellQrcode
                                                                        .value,
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
                                                            openQrCode();
                                                          }),
                                                    )
                                                  : Container(),
                                            ),
                                          ))),
                                ],
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 161.0, start: 26.0),
                              Pin(size: 20.0, start: 265.0),
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
                                alignment: Alignment(0.7, 0.85),
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
                      height: 200.0,
                      child: Pinned.fromPins(
                        Pin(start: 0, end: 0),
                        Pin(start: 0.0, end: 0.0),
                        child: Container(
                          /*container2*/
                          width: 355.0,
                          height: 200.0,
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
                                      Pin(start: 25.0, end: 0.0),
                                      Pin(size: 20.0, start: 25),
                                      child: Obx(() => controller
                                                  .tmsSellOrder !=
                                              null
                                          ? Text(
                                              'preordernum'.tr +
                                                  controller.tmsSellOrder.value
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
                                      Pin(size: 203.0, start: 25.0),
                                      Pin(size: 20.0, start: 60),
                                      child: Obx(() => controller
                                                  .tmsSellOrder !=
                                              null
                                          ? Text(
                                              'preorderstatus'.tr +
                                                  getOrderStatus(controller
                                                      .tmsSellOrder
                                                      .value
                                                      .status!),
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 15,
                                                color: const Color(0xff5d5d5d),
                                              ))
                                          : Text(
                                              'preorderstatus'.tr,
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 15,
                                                color: const Color(0xff5d5d5d),
                                              ),
                                            )),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 300.0, start: 25.0),
                                      Pin(size: 20.0, start: 100),
                                      child: Obx(() => controller
                                                  .tmsSellOrder !=
                                              null
                                          ? Text(
                                              'preorderdate'.tr +
                                                  controller.tmsSellOrder.value
                                                      .createDate!,
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 15,
                                                color: const Color(0xff5d5d5d),
                                              ))
                                          : Text(
                                              'preorderdate'.tr,
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
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Stack(
                children: <Widget>[
                  SizedBox(
                      width: 435.0,
                      height: 150.0,
                      child: Pinned.fromPins(
                        Pin(start: 0, end: 0),
                        Pin(start: 0.0, end: 0.0),
                        child: Container(
                          /*container2*/
                          width: 355.0,
                          height: 150.0,
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
                                          onPressed: () {
                                            controller.cancelOrder();
                                          },
                                          child: Text("pendingordercancel".tr),
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

class MySellOrderController extends BaseController {
  var _listTextTabToggle = ["sellnotsplit".tr, "sellsplit".tr];
  final GCPayApi gcpayApi;
  final CacheService cacheservice;
  MySellOrderController(this.cacheservice, this.gcpayApi);
  Rx<TmsSellOrder> tmsSellOrder = TmsSellOrder(
    '',
    '',
    '',
    0,
    0,
    '',
    0,
    0,
    0,
    0,
    '',
    [],
    0,
    '',
    0,
  ).obs;

  RxList<UmsPaymentSell> paymentmethods = <UmsPaymentSell>[].obs;
  List<Payment> sellpaymentmethods = <Payment>[].obs;
  RxInt splitType = 1.obs;
  RxString gcAmountUsable = ''.obs;
  RxString orderNo = ''.obs;
  RxInt sellerUserId = 0.obs;
  RxInt buyerUserId = 0.obs;

  ButtonSize selectedSize = ButtonSize.medium;
  ButtonSelectedStyle selectedStyle = ButtonSelectedStyle.both;
  List<ButtonMultiSelectItem<PaymentData>> paymentList =
      <ButtonMultiSelectItem<PaymentData>>[].obs;
  int alipayPaymentId = 0;
  int bankPaymentId = 0;
  int weChatPaymentId = 0;
  int eCnyPaymentId = 0;
  int sellpaymentIndex = 0;
  final sellgroupcontroller = GroupButtonController(
    selectedIndex: 0,
    onDisablePressed: (i) => print('Button #$i is disabled'),
  );

  RxInt rxCurrentSellPaymentType = 0.obs;
  RxString rxCurrentSellQrcode = ''.obs;
  Rx<PaymentData> rxCurrentSellPayment =
      PaymentData(0, 0, '', '', '', '', '').obs;
  RxList sellpaymentListName = [].obs;
  RxList sellpaymentListIcon = [].obs;
  RxList<PaymentData> sellpaymentList = <PaymentData>[].obs;
  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    getPaymentManageInfo();
    tmsSellOrder.value = cacheservice.mySellOrderEntity;
    splitType.value = tmsSellOrder.value.sellType!;
    gcAmountUsable.value = tmsSellOrder.value.gcAmountUsable.toString();
    orderNo.value = tmsSellOrder.value.orderNo.toString();
    sellerUserId.value = tmsSellOrder.value.sellerUserId!;

    buyerUserId.value = int.parse(cacheservice.cacheuserId!);
    sellpaymentmethods = cacheservice.mySellOrderEntity.payment;
    setSellPaymentMultiSelectItem();
  }

  Future<void> getPaymentManageInfo() async {
    try {
      var response = await gcpayApi.getUmsPayment();
      if (response.code == 400) {}
      if (response.code == 200) {
        paymentmethods.value = response.data!;
        setBuyPaymentMultiSelectItem();
      } else {}
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future<void> cancelOrder() async {
    try {
      Map<String, dynamic> data = <String, dynamic>{
        'orderNo': BigInt.parse(tmsSellOrder.value.orderNo!),
      };
      var response = await gcpayApi.cancel(data);
      if (response.code == 400) {}
      if (response.code == 200) {
        showToast(response.msg);
        Future.delayed(Duration(seconds: 2), () {
          Get.back();
        });
      } else {}
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  bool getQrcode() {
    bool blValideQrcode = false;
    if (rxCurrentSellQrcode.value.length > 0) {
      if (rxCurrentSellQrcode.value.contains('png') ||
          rxCurrentSellQrcode.value.contains('jpg') ||
          rxCurrentSellQrcode.value.contains('jpeg')) {
        blValideQrcode = true;
      }
    }
    return blValideQrcode;
  }

  void setBuyPaymentMultiSelectItem() {
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

  void setSellPaymentMultiSelectItem() {
    for (int i = 0; i < sellpaymentmethods.length; i++) {
      Payment paymentEntity = sellpaymentmethods[i];
      PaymentData paymentData = PaymentData(0, 0, '', '', '', '', '');
      if (paymentEntity.paymentType == 1) {
        sellpaymentListName.add('alipay'.tr);
        sellpaymentListIcon.add("assets/images/alipay.png");
        paymentData = PaymentData(
            paymentEntity.paymentType!,
            paymentEntity.id!,
            "assets/images/alipay.png",
            'alipay'.tr,
            paymentEntity.qrCode!,
            '',
            '');
        sellpaymentList.add(paymentData);
      } else if (paymentEntity.paymentType == 2) {
        sellpaymentListName.add('wechat'.tr);
        sellpaymentListIcon.add("assets/images/wechat.png");
        paymentData = PaymentData(
            paymentEntity.paymentType!,
            paymentEntity.id!,
            "assets/images/wechat.png",
            'wechat'.tr,
            paymentEntity.qrCode!,
            '',
            '');
        sellpaymentList.add(paymentData);
      } else if (paymentEntity.paymentType == 3) {
        sellpaymentListName.add('bank'.tr);
        sellpaymentListIcon.add("assets/images/union_pay.png");
        paymentData = PaymentData(
            paymentEntity.paymentType!,
            paymentEntity.id!,
            "assets/images/union_pay.png",
            'bank'.tr,
            '',
            paymentEntity.bankName,
            paymentEntity.bankCard);
        sellpaymentList.add(paymentData);
      } else if (paymentEntity.paymentType == 4) {
        sellpaymentListName.add('ECNY'.tr);
        sellpaymentListIcon.add("assets/images/ECNY.png");
        paymentData = PaymentData(paymentEntity.paymentType!, paymentEntity.id!,
            "assets/images/ECNY.png", 'ECNY'.tr, paymentEntity.qrCode!, '', '');
        sellpaymentList.add(paymentData);
      } else if (paymentEntity.paymentType == 5) {
        sellpaymentListName.add('qqpay'.tr);
        sellpaymentListIcon.add("assets/images/qqpay.png");
        paymentData = PaymentData(paymentEntity.paymentType!, paymentEntity.id!,
            "assets/images/qqpay.png", 'ECNY'.tr, paymentEntity.qrCode!, '', '');
        sellpaymentList.add(paymentData);
      }

      if (i == 0) {
        if (paymentEntity.qrCode != null) {
          rxCurrentSellQrcode.value = paymentEntity.qrCode!;
        }
        rxCurrentSellPaymentType.value = paymentEntity.paymentType!;
        rxCurrentSellPayment.value = paymentData;
      }
    }
  }
}

class MySellOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        MySellOrderController(Get.put(CacheService()), Get.put(GCPayApi())));
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
