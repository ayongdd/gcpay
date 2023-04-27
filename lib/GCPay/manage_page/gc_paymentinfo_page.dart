import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';
import 'package:images_picker/images_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../base/controller/base_controller.dart';
import '../../constant/http_url.dart';
import '../../http/apiservice/gcpay_api.dart';
import '../../services/cache_service.dart';
import '../../services/lang/localization_service.dart';
import '../../utils/permission_handle.dart';
import '../Model/UploadPaymentPic_Data_entity.dart';
import '../home_page/Model/HomePage_Record_entity.dart';
import 'Model/AddOrUpUmsPayment_Data.dart';

class PaymentInfoPage extends BaseStatefulWidget<PaymentInfoController> {
  const PaymentInfoPage({Key? key}) : super(key: key);
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
              actions: [
                IconButton(
                  icon: Icon(Icons.delete_forever_rounded),
                  onPressed: () {
                    controller.deletePayment();
                  },
                ),
              ],
            ),
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(
                width: 284.0,
                height: 500.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 500.0, end: 188.0),
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
                                    'addpayment'.tr,
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
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
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
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 420.0, middle: 0.5),
                      Pin(start: 44.0, end: 10.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(Pin(size: 141.0, start: 145.0),
                              Pin(size: 20.0, start: 20.0),
                              child: Obx(
                                () => Text(
                                  controller
                                      .paymentManagerEntity.value.updateDate!,
                                  style: TextStyle(
                                    fontFamily: 'Helvetica Neue',
                                    fontSize: 15,
                                    color: const Color(0xff1d4f8b),
                                  ),
                                ),
                              )),
                          Pinned.fromPins(
                            Pin(size: 300.0, start: 45.0),
                            Pin(size: 21.0, start: 55.0),
                            child: Text(
                              'paymethod'.tr,
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 18,
                                color: const Color(0xff1d4f8b),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 345.0, start: 38.0),
                            Pin(size: 50.0, start: 82.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    width: 2.0, color: const Color(0xff1d4f8b)),
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
                          Obx(() => controller.rxPaymentIcon.value.length > 0
                              ? Pinned.fromPins(
                                  Pin(size: 27.0, start: 165.0),
                                  Pin(size: 27.0, start: 93.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            controller.rxPaymentIcon.value),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                )
                              : Pinned.fromPins(
                                  Pin(size: 27.0, start: 165.0),
                                  Pin(size: 27.0, start: 93.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                  ),
                                )),
                          Pinned.fromPins(Pin(size: 145.0, start: 205.0),
                              Pin(size: 20.0, start: 98.0),
                              child: Obx(
                                () => Text(
                                  controller.rxPaymentName.value,
                                  style: TextStyle(
                                    fontFamily: 'Helvetica Neue',
                                    fontSize: 15,
                                    color: const Color(0xff5d5d5d),
                                  ),
                                ),
                              )),
                          Pinned.fromPins(Pin(size: 138.0, start: 45.0),
                              Pin(size: 21.0, start: 155.0),
                              child: Obx(
                                () => Text(
                                  controller.rxPaymentAccount.value,
                                  style: TextStyle(
                                    fontFamily: 'Helvetica Neue',
                                    fontSize: 18,
                                    color: const Color(0xff1d4f8b),
                                  ),
                                ),
                              )),
                          Pinned.fromPins(
                            Pin(size: 345.0, start: 38.0),
                            Pin(size: 50.0, start: 180.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    width: 2.0, color: const Color(0xff1d4f8b)),
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
                          Pinned.fromPins(Pin(size: 120.0, start: 165.0),
                              Pin(size: 20.0, start: 195.0),
                              child: Obx(
                                () => Text(
                                  controller.rxAccountName.value,
                                  style: TextStyle(
                                    fontFamily: 'Helvetica Neue',
                                    fontSize: 15,
                                    color: const Color(0xff5d5d5d),
                                  ),
                                ),
                              )),
                          Pinned.fromPins(Pin(size: 157.0, start: 45.0),
                              Pin(size: 21.0, start: 253.0),
                              child: Obx(
                                () => Text(
                                  controller.rxPayType.value,
                                  style: TextStyle(
                                    fontFamily: 'Helvetica Neue',
                                    fontSize: 18,
                                    color: const Color(0xff1d4f8b),
                                  ),
                                ),
                              )),
                          Pinned.fromPins(
                            Pin(size: 345.0, start: 38.0),
                            Pin(size: 50.0, start: 278.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    width: 2.0, color: const Color(0xff1d4f8b)),
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
                          Pinned.fromPins(Pin(size: 150.0, start: 165.0),
                              Pin(size: 20.0, start: 293.0),
                              child: Obx(
                                () => Text(
                                  controller.rxAccount.value,
                                  style: TextStyle(
                                    fontFamily: 'Helvetica Neue',
                                    fontSize: 15,
                                    color: const Color(0xff5d5d5d),
                                  ),
                                ),
                              )),
                          Pinned.fromPins(
                            Pin(size: 157.0, start: 145.0),
                            Pin(size: 21.0, start: 345.0),
                            child: Text(
                              'paymentinfo'.tr,
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 18,
                                color: const Color(0xff1d4f8b),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 273.0, start: 70.5),
                            Pin(size: 131.0, end: -60.0),
                            child: SvgPicture.string(
                              _svg_eek,
                              allowDrawingOutsideViewBox: true,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 1.0, start: 250.0),
                            Pin(size: 102.2, end: -44.0),
                            child: SvgPicture.string(
                              _svg_srmu,
                              allowDrawingOutsideViewBox: true,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Obx(() => controller.paymentType.value != 3
                              ? Pinned.fromPins(
                            Pin(size: 120.0, start: 85.0),
                            Pin(size: 120.0, end: -53.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/paymentcode.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          )
                              : Pinned.fromPins(
                            Pin(size: 23.0, start: 265.0),
                            Pin(size: 23.0, end: -5.0),
                            child: Container(
                              decoration: BoxDecoration(),
                            ),
                          )),
                          Obx(() => controller.rxPaymentQrcode.value.length > 0
                              ? Pinned.fromPins(
                                  Pin(size: 95.0, start: 97.0),
                                  Pin(size: 95.0, end: -40.05),
                                  child:InkWell(child: CachedNetworkImage(
                                    height: 95,
                                    width: 95,
                                    imageUrl: controller.rxPaymentQrcode.value
                                        .contains('http') ||
                                        controller.rxPaymentQrcode.value
                                            .contains('https')
                                        ? controller.rxPaymentQrcode.value
                                        : HttpUrl.BASE_GCPAY_URL +
                                        controller.rxPaymentQrcode.value,
                                    imageBuilder:
                                        (context, imageProvider) =>
                                        Container(
                                          height: 120,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(60)),
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
                                  ),onTap: () async {
                                    controller.getImage();
                                  },
                                ))
                              : Pinned.fromPins(
                                  Pin(size: 90.0, start: 100.0),
                                  Pin(size: 100.0, end: -45),
                                  child: Obx(() =>controller.rxPaymentIcon.value.length > 0?Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(60.0),),
                                    child: Image.asset(controller.rxPaymentIcon.value),
                                  ):Container()),
                                )),
                          Obx(() => controller.rxPaymentIcon.value.length > 0
                              ? Pinned.fromPins(
                                  Pin(size: 23.0, start: 265.0),
                                  Pin(size: 23.0, end: -5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            controller.rxPaymentIcon.value),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                )
                              : Pinned.fromPins(
                                  Pin(size: 23.0, start: 265.0),
                                  Pin(size: 23.0, end: -5.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                  ),
                                )),
                          Obx(() => Pinned.fromPins(
                                Pin(size: 50.0, start: 290.0),
                                Pin(size: 14.0, start: 650.0),
                                child: Text(
                                  controller.rxPaymentName.value,
                                  style: TextStyle(
                                    fontFamily: 'Helvetica Neue',
                                    fontSize: 12,
                                    color: const Color(0xff5d5d5d),
                                  ),
                                ),
                              )),
                        ],
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

class PaymentInfoController extends BaseController {
  final GCPayApi gcpayApi;
  final CacheService cacheservice;
  PaymentInfoController(this.cacheservice, this.gcpayApi);

  RxInt paymentType = 1.obs;
  RxInt paymentId = 0.obs;
  RxString zfbAccount = ''.obs;
  RxString remark = ''.obs;
  RxString rxAccountName = ''.obs;
  RxString rxAccount = ''.obs;
  RxString rxPaymentQrcode = ''.obs;
  RxString rxPayType = ''.obs;
  RxString rxPaymentIcon = ''.obs;
  RxString rxPaymentName = ''.obs;
  RxString rxPaymentAccount = ''.obs;

  Rx<UmsPaymentSell> paymentManagerEntity =
      UmsPaymentSell(0, 0, 0, '', '', '', '', '', '', '', '', '', 0).obs;
  @override
  void loadNet() {}
  @override
  void onReady() {
    super.onReady();
    paymentManagerEntity.value = cacheservice.paymentManagerEntity;
    if (paymentManagerEntity.value.qrCode != null) {
      rxPaymentQrcode.value = paymentManagerEntity.value.qrCode!;
    }
    paymentId.value = paymentManagerEntity.value.id!;
    getAccount();
    getAccountName();
    getPaymentType();
    getPaymentAccountType();
    getPaymentIcon();
    getPaymentName();
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
      if(cacheservice.rxLanguage.value == '1')
      {
        currentLanguage = Language.Chinese;
      }
      else
      {
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
        language:currentLanguage,
      );
      if (res != null&& res.length >0) {
        uploadCodeFromImage(res[0].path);
      }
    } catch (e) {
      debugPrint(e.toString());
      showToast(e.toString());
    }
  }

  Future<void> uploadCodeFromImage(String imageFile) async {
    try {
      var response = await gcpayApi.uploadPaymentQrcode(imageFile);
      if (response.code == 200) {
        UploadPaymentPicDataEntity paymentQrcodePictureEntity = response.data!;
        rxPaymentQrcode.value = paymentQrcodePictureEntity.url!;
        AddPaymentInfo();
        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future<void> AddPaymentInfo() async {
    try {
      late Map<String, dynamic> data;
      int intPaymentId = paymentManagerEntity.value.id!;
      int intPaymentType = paymentManagerEntity.value.paymentType!;
      if (intPaymentId != 0) {
        if (intPaymentType == 1) {
          data = <String, dynamic>{
            "paymentType": intPaymentType,
            "qrCode": rxPaymentQrcode.value,
            "account": rxAccount.value,
            "realName": rxAccountName.value,
            "id": intPaymentId,
          };
        } else if (intPaymentType == 2) {
          data = <String, dynamic>{
            "paymentType": intPaymentType,
            "qrCode": rxPaymentQrcode.value,
            "account": rxAccount.value,
            "realName": rxAccountName.value,
            "id": intPaymentId,
          };
        } else if (intPaymentType == 3) {

        } else if (intPaymentType == 4) {
          data = <String, dynamic>{
            "paymentType": intPaymentType,
            "qrCode": rxPaymentQrcode.value,
             "account": rxAccount.value,
             "realName": rxAccountName.value,
            "id": intPaymentId,
          };
        }
      }
      var response = await gcpayApi.addorUpUmsPayment(data);
      if (response.code == 200) {
        Future.delayed(Duration(seconds: 2), () {
          Get.back();
        });
        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
      showToast(response.msg);
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  String getPaymentIcon() {
    String strPayImage = '';
    if (paymentManagerEntity.value.paymentType == 1) {
      strPayImage = 'assets/images/alipay.png';
    } else if (paymentManagerEntity.value.paymentType == 2) {
      strPayImage = 'assets/images/wechat.png';
    } else if (paymentManagerEntity.value.paymentType == 3) {
      strPayImage = 'assets/images/union_pay.png';
    } else if (paymentManagerEntity.value.paymentType == 4) {
      strPayImage = 'assets/images/ECNY.png';
    }
    rxPaymentIcon.value = strPayImage;
    return strPayImage;
  }

  String getPaymentName() {
    String strPayName = '';
    if (paymentManagerEntity.value.paymentType == 1) {
      strPayName = 'Alipay'.tr;
    } else if (paymentManagerEntity.value.paymentType == 2) {
      strPayName = 'Wechat'.tr;
    } else if (paymentManagerEntity.value.paymentType == 3) {
      strPayName = 'bankcard'.tr;
    } else if (paymentManagerEntity.value.paymentType == 4) {
      strPayName = 'ECNY'.tr;
    }
    rxPaymentName.value = strPayName;
    return strPayName;
  }

  String getAccount() {
    String strAccountName = '';

    if (paymentManagerEntity.value.paymentType == 3) {
      strAccountName = paymentManagerEntity.value.bankCard!;
    } else {
      if (paymentManagerEntity.value.account != null) {
        strAccountName = paymentManagerEntity.value.account!;
      }
    }
    rxAccount.value = strAccountName;
    return strAccountName;
  }

  String getAccountName() {
    String strAccountName = '';

    if (paymentManagerEntity.value.paymentType == 3) {
      strAccountName = paymentManagerEntity.value.bankName!;
    } else {
      if (paymentManagerEntity.value.realName != null) {
        strAccountName = paymentManagerEntity.value.realName!;
      } else {
        strAccountName = cacheservice.userNameString.value;
      }
    }
    rxAccountName.value = strAccountName;
    return strAccountName;
  }

  String getPaymentType() {
    String strPayType = '';
    if (paymentManagerEntity.value.paymentType == 3) {
      strPayType = 'bankcardnum'.tr;
    } else {
      strPayType = 'paymentaccount'.tr;
    }
    rxPayType.value = strPayType;
    return strPayType;
  }

  String getPaymentAccountType() {
    String strPayType = '';
    if (paymentManagerEntity.value.paymentType == 3) {
      strPayType = 'bank'.tr;
    } else {
      strPayType = 'Name'.tr;
    }
    rxPaymentAccount.value = strPayType;
    return strPayType;
  }

  Future<void> deletePayment() async {
    try {
      Map<String, dynamic> data = {'id':paymentId.value};
      var response = await gcpayApi.delUmsPayment(data);
      if (response.code == 400) {}
      if (response.code == 200) {
        change(response.data, status: RxStatus.success());
        Get.back();
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future<void> PaymentInfo() async {
    try {
      var response = await gcpayApi.getUmsPayment();
      if (response.code == 400) {}
      if (response.code == 200) {
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

class PaymentInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        PaymentInfoController(Get.put(CacheService()), Get.put(GCPayApi())));
  }
}

const String _svg_ehpyic =
    '<svg viewBox="33.0 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_eek =
    '<svg viewBox="87.0 709.0 273.0 131.0" ><path transform="translate(87.0, 709.0)" d="M 155.3580017089844 131.0005340576172 L 155.3569946289062 131.0005340576172 L 15.00032901763916 130.9995269775391 C 10.99359607696533 130.9995269775391 7.226696014404297 129.4392242431641 4.393496036529541 126.6060638427734 C 1.560296058654785 123.7728958129883 -3.995768111053621e-06 120.0059661865234 -3.995768111053621e-06 115.9992294311523 L -3.995768111053621e-06 14.99942970275879 C -3.995768111053621e-06 10.99309635162354 1.560296058654785 7.226463317871094 4.393496036529541 4.393396854400635 C 7.226729393005371 1.560296773910522 10.99362945556641 3.015543552464806e-05 15.00032901763916 3.015543552464806e-05 L 155.3580322265625 3.015543552464806e-05 C 155.3580017089844 3.332463502883911 156.6654968261719 6.465096950531006 159.0406646728516 8.821829795837402 C 161.4154968261719 11.17813014984131 164.5728302001953 12.475830078125 167.9310302734375 12.475830078125 C 171.2892303466797 12.475830078125 174.4463653564453 11.17813014984131 176.8208923339844 8.821829795837402 C 179.1954345703125 6.465529918670654 180.5031280517578 3.332563400268555 180.5031280517578 3.015543552464806e-05 L 257.9994201660156 3.015543552464806e-05 C 262.0061340332031 3.015543552464806e-05 265.7730407714844 1.560296773910522 268.6062622070312 4.393396854400635 C 271.4394226074219 7.226496696472168 272.9997253417969 10.99312973022461 272.9997253417969 14.99942970275879 L 272.9997253417969 115.9992294311523 C 272.9997253417969 120.0059661865234 271.4394226074219 123.7728652954102 268.6062622070312 126.6060638427734 C 265.7730712890625 129.4392242431641 262.0061645507812 130.9995269775391 257.9994201660156 130.9995269775391 L 180.5031280517578 130.9995269775391 C 180.5031280517578 127.6669616699219 179.1957702636719 124.5341949462891 176.8208923339844 122.1772613525391 C 174.4462890625 119.8206634521484 171.2891235351562 118.5228271484375 167.9310302734375 118.5228271484375 C 164.5727996826172 118.5228271484375 161.4154663085938 119.8206634521484 159.0406646728516 122.1772613525391 C 156.6658630371094 124.5338973999023 155.3580017089844 127.6670303344727 155.3580017089844 130.9995269775391 L 155.3580017089844 131.0005340576172 Z" fill="#d3e0f0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_srmu =
    '<svg viewBox="254.2 723.1 1.0 102.2" ><path transform="translate(254.17, 723.1)" d="M 0 102.2413482666016 L 0 0" fill="none" stroke="#5e5e5e" stroke-width="2" stroke-dasharray="4 4" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
