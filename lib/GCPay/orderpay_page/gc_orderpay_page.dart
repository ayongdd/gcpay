import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
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
import '../../utils/log_utils.dart';
import '../../utils/permission_handle.dart';
import '../Model/UploadPaymentPic_Data_entity.dart';
import '../home_page/Model/HomePage_Record_entity.dart';
import '../home_page/Model/PendingOrderList_Data_entity.dart';
import '../order_page/gc_order_page.dart';
import '../order_page/gc_orderlobby_page.dart';
import '../sellcoin_page/gc_sellcoin_page.dart';
import 'merchant_order_entity.dart';

class OrderPayPage extends BaseStatefulWidget<OrderPayController> {
  const OrderPayPage({Key? key}) : super(key: key);

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
          child: Column(children: [Expanded(child:           PhotoView(imageProvider:NetworkImage(HttpUrl
              .BASE_GCPAY_URL +
              '/api/mmsMerchant/gcPayQr?tradeNo=' +
              controller
                  .rxTradeOrderNo
                  .value,)
          )),ElevatedButton(
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
              if (controller
                  .rxTradeOrderNo
                  .value.isNotEmpty) {
                Uint8List imagebytes = (await NetworkAssetBundle(
                    Uri.parse(HttpUrl
                        .BASE_GCPAY_URL +
                        '/api/mmsMerchant/gcPayQr?tradeNo=' +
                        controller
                            .rxTradeOrderNo
                            .value))
                    .load(HttpUrl
                    .BASE_GCPAY_URL +
                    '/api/mmsMerchant/gcPayQr?tradeNo=' +
                    controller
                        .rxTradeOrderNo
                        .value,))
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
          )],)
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
                      height: 220.0,
                      child: Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 220.0, start: 0.0),
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
                                              'merchantorder'.tr,
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
                                  Pinned.fromPins(Pin(size: 150.0, middle: 0.2),
                                      Pin(size: 150.0, start: 50),
                                      child: Container(
                                        height: 120.0,
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: const AssetImage(
                                                'assets/images/paymentcode_frame.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )),
                                  Pinned.fromPins(
                                    Pin(size: 70.0, middle: 0.28),
                                    Pin(size: 70.0, start: 70),
                                    child: Obx(
                                      () => Container(
                                        height: 70.0,
                                        width: 70.0,
                                        child: controller.rxTradeOrderNo.value
                                                    .length >
                                                0
                                            ? SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: InkWell(
                                                  child: CachedNetworkImage(
                                                    height: 50,
                                                    width: 50,
                                                    imageUrl: HttpUrl
                                                            .BASE_GCPAY_URL +
                                                        '/api/mmsMerchant/gcPayQr?tradeNo=' +
                                                        controller
                                                            .rxTradeOrderNo
                                                            .value,
                                                    placeholder: (context,
                                                            url) =>
                                                        CircularProgressIndicator(),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ),
                                                  onTap: () {
                                                    openQrCode();
                                                  },
                                                ),
                                              )
                                            : Container(),
                                      ),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 170.0, middle: 0.8),
                                    Pin(size: 70.0, start: 100),
                                    child: Obx(
                                      () => controller
                                                  .rxTradeOrderNo.value.length >
                                              0
                                          ? Container(
                                              child: Text(
                                              'merchantamount'.tr +
                                                  controller.rxOrderEntity.value
                                                      .gcAmount
                                                      .toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 16,
                                                color: const Color(0xff333333),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ))
                                          : Container(),
                                    ),
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
                                                  .rxTradeOrderNo !=
                                              null
                                          ? Text(
                                              'ordernum'.tr +
                                                  controller
                                                      .rxTradeOrderNo.value,
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
                                      Pin(size: 250.0, start: 25.0),
                                      Pin(size: 20.0, start: 60),
                                      child: Obx(() => controller.rxOrderEntity
                                                  .value.merchantName.length >
                                              0
                                          ? Text(
                                              'merchantname'.tr +
                                                  controller.rxOrderEntity.value
                                                      .merchantName,
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
                                    Pinned.fromPins(
                                      Pin(size: 300.0, start: 25.0),
                                      Pin(size: 20.0, start: 100),
                                      child: Obx(() => controller.rxOrderEntity
                                                  .value.createTime.length >
                                              0
                                          ? Text(
                                              'orderdate'.tr +
                                                  controller.rxOrderEntity.value
                                                      .createTime,
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
            Obx(() => controller.intPaymentPasswordButtonDisplay.value == 1
                ? SliverToBoxAdapter(
                    child: Stack(
                      children: <Widget>[
                        SizedBox(
                            width: 400.0,
                            height: 220.0,
                            child: Pinned.fromPins(
                              Pin(start: 0, end: 0),
                              Pin(start: 0.0, end: 0.0),
                              child: Container(
                                /*container2*/
                                width: 355.0,
                                height: 220.0,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromPins(
                                      Pin(start: 25.0, end: 25.0),
                                      Pin(size: 50.0, start: 30.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xffffffff),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                                      Pin(start: 0.0, end: 0.0),
                                      Pin(size: 100.0, start: 20.0),
                                      child: Stack(
                                        children: <Widget>[
                                          TextFormField(
                                            controller: controller
                                                .paymentPasswordController,
                                            decoration: InputDecoration(
                                              hintText: 'pay_code_hint'.tr,
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
                                                  EdgeInsets.fromLTRB(
                                                      20.0, 20.0, 20.0, 5.0),
                                              suffixIcon: Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 10, 50, 0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    controller.isPasswordDisplay.value =
                                                    !controller.isPasswordDisplay.value;
                                                  },
                                                  child: Icon(
                                                    controller.isPasswordDisplay.value
                                                        ? Icons.visibility_rounded
                                                        : Icons.visibility_off_rounded,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            textAlign: TextAlign.center,
                                            obscureText: !controller.isPasswordDisplay.value,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .singleLineFormatter
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 200.0, middle: 0.5),
                                      Pin(size: 50.0, start: 120.0),
                                      child: Container(
                                        width: 100,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            controller.orderConfirm();
                                          },
                                          child: Text('confirm'.tr),
                                        ),
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
  bool showBackButton() => true;

  @override
  bool useLoadSir() => false;
}

class OrderPayController extends BaseController {
  var _listTextTabToggle = ["sellnotsplit".tr, "sellsplit".tr];
  final GCPayApi gcpayApi;
  final CacheService cacheservice;
  OrderPayController(this.cacheservice, this.gcpayApi);

  RxString gcAmountUsable = ''.obs;
  RxString orderNo = ''.obs;
  RxInt sellerUserId = 0.obs;
  RxInt buyerUserId = 0.obs;
  RxInt tradeStatus = 0.obs;
  RxString rxIdentify = ''.obs;
  RxInt rxIntIdentify = 0.obs;
  ButtonSize selectedSize = ButtonSize.medium;
  ButtonSelectedStyle selectedStyle = ButtonSelectedStyle.both;

  int alipayPaymentId = 0;
  int bankPaymentId = 0;
  int weChatPaymentId = 0;
  int eCnyPaymentId = 0;
  RxString rxButtonConfirmTitle = ''.obs;
  RxString rxButtonCancelTitle = ''.obs;
  RxInt intButtonDisplay = 0.obs;
  RxInt intPaymentReceiptButtonDisplay = 0.obs;
  RxInt intPaymentPasswordButtonDisplay = 0.obs;
  RxBool isPasswordDisplay = false.obs;
  RxString paymentReceiptPic = ''.obs;
  final paymentPasswordController = TextEditingController();

  RxInt rxIntPaymentType = 0.obs;
  Rx<PaymentData> rxPaymentData = PaymentData(0, 0, '', '', '', '', '').obs;
  RxString rxTradeOrderNo = ''.obs;
  Rx<merchant_order_entity> rxOrderEntity = merchant_order_entity(
    '',
    0,
    '',
    '',
    '',
  ).obs;

  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    var dataArguments = Get.parameters;
    rxTradeOrderNo.value = dataArguments['id']!;
    if(rxTradeOrderNo.value.length<=0)
      {
        rxTradeOrderNo.value = dataArguments['id']!;
      }
    LogE('gcorderpay===: ${rxTradeOrderNo.value}');
    queryOrder();
  }

  @override
  void onClose() {
    paymentPasswordController.dispose();
    super.onClose();
  }

  Future<void> queryOrder() async {
    try {
      Map<String, dynamic> data = <String, dynamic>{
        'tradeNo': rxTradeOrderNo.value,
      };
      var response = await gcpayApi.getTradeOrder(data);
      if (response.code == 400) {
        showToast(response.msg);
      }
      if (response.code == 200||response.code == 201) {
        rxOrderEntity.value = response.data!;
        intPaymentPasswordButtonDisplay.value = 1;
      } else {
        showToast(response.msg);
      }
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future<void> getPayQr() async {
    try {
      Map<String, dynamic> data = <String, dynamic>{
        'tradeNo': rxTradeOrderNo.value,
      };
      var response = await gcpayApi.merchantGetPayQr(data);
      if (response.code == 400) {}
      if (response.code == 200) {
        String strPayQr = response.data!;
        intPaymentPasswordButtonDisplay.value = 1;
      } else {}
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future<void> orderConfirm() async {
    try {
      if(paymentPasswordController.text.length<=0)
        {
          showToast('pay_code_hint'.tr);
          return;
        }
      Map<String, dynamic> data = <String, dynamic>{
        'payPassword': paymentPasswordController.text,
        'tradeNo': rxTradeOrderNo.value,
      };
      var response = await gcpayApi.merchantOrderPayConfirm(data);
      Fluttertoast.showToast(msg: response.msg!,gravity: ToastGravity.CENTER);
      if (response.code == 400) {}
      if (response.code == 200) {
        intPaymentReceiptButtonDisplay.value = 0;
        intButtonDisplay.value = 0;
        queryOrder();
        // 延时2s执行返回
        Future.delayed(Duration(seconds: 2), (){
          Get.back(result: true);
        });

      } else {}
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

}

class OrderPayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => OrderPayController(Get.put(CacheService()), Get.put(GCPayApi())));
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
