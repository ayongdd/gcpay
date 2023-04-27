import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:GCPay/routes/app_routes.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';
import '../../base/controller/base_controller.dart';
import '../../base/pageWidget/base_stateful_widget.dart';
import '../../constant/http_url.dart';
import '../../http/apiservice/gcpay_api.dart';
import '../../services/cache_service.dart';
import '../../utils/event_bus.dart';
import '../../utils/permission_handle.dart';
import '../../widget/popup/Notification.dart';
import '../../widget/popup/popup.dart';
import '../home_page/Model/UserBalance_Amount_entity.dart';
import 'Model/AddOrUpUmsPayment_Data.dart';
import 'Model/AddOrUpUmsPayment_Data.dart';
import '../home_page/Model/HomePage_Record_entity.dart';

class ManagementPage extends BaseStatefulWidget<ManageController> {
  const ManagementPage({Key? key}) : super(key: key);

  void openPaymentQrcode(String paymentQrcode) {
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
                    paymentQrcode.contains('http') ||
                            paymentQrcode.contains('https')
                        ? paymentQrcode
                        : HttpUrl.BASE_GCPAY_URL + paymentQrcode,
                  )),
                ),
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
                    if (paymentQrcode != null) {
                      Uint8List imagebytes = (await NetworkAssetBundle(
                                  Uri.parse(paymentQrcode.contains('http') ||
                                          paymentQrcode.contains('https')
                                      ? paymentQrcode
                                      : HttpUrl.BASE_GCPAY_URL + paymentQrcode))
                              .load(paymentQrcode.contains('http') ||
                                      paymentQrcode.contains('https')
                                  ? paymentQrcode
                                  : HttpUrl.BASE_GCPAY_URL + paymentQrcode))
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

  String strLoadUserName()
  {
    String strUserName = controller.cacheservice.loadUserName()!;
    if(!strUserName.isNotEmpty)
      {
        strUserName = controller.cacheservice.loadUserNickName()!;
      }
    return strUserName;
  }

  List<Widget> paymentListItem() {
    List<Widget> list = [];
    //i<5, pass your dynamic limit as per your requirment
    String strPayImage = '';

    for (int i = 0; i < controller.paymentmethods.value.length; i++) {
      UmsPaymentSell paymentmethods = controller.paymentmethods.value[i];
      String strPayMethodName = '';
      String strPayMethodIconName = '';
      String strUserName = '';
      String strUserRealName = '';
      String strAccountName = '';
      String strAccountMethodName = 'Account'.tr;
      String strPaymentQrCode = '';
      if (paymentmethods.paymentType == 2) {
        strPayMethodName = 'wechat'.tr;
        strPayMethodIconName = 'wechat.png';
        strPaymentQrCode = paymentmethods.qrCode!;
        if (paymentmethods.realName != null) {
          strUserName = paymentmethods.realName!;
        } else {
          strUserName = strLoadUserName();
        }
      } else if (paymentmethods.paymentType == 1) {
        strPayMethodName = 'alipay'.tr;
        strPayMethodIconName = 'alipay.png';
        strPaymentQrCode = paymentmethods.qrCode!;
        if (paymentmethods.account != null) {
          strAccountName = paymentmethods.account!;
        }
        if (paymentmethods.realName != null) {
          strUserName = paymentmethods.realName!;
        } else {
          strUserName = strLoadUserName();
        }
      } else if (paymentmethods.paymentType == 3) {
        strPayMethodName = 'bank'.tr;
        strPayMethodIconName = 'union_pay.png';
        strUserName = paymentmethods.bankName!;
        strAccountName = paymentmethods.bankCard!;
        strAccountMethodName = 'BankCardNumber'.tr;
        if(paymentmethods.realName == null)
          {
            strUserRealName = strLoadUserName();
          }
      } else if (paymentmethods.paymentType == 4) {
        strPayMethodName = 'ECNY'.tr;
        strPayMethodIconName = 'ECNY.png';
        strPaymentQrCode = paymentmethods.qrCode!;
        if (paymentmethods.realName != null) {
          strUserName = paymentmethods.realName!;
        } else {
          strUserName = strLoadUserName();
        }

        if (paymentmethods.account != null) {
          strAccountName = paymentmethods.account!;
        }
      } else if (paymentmethods.paymentType == 5) {
        strPayMethodName = 'qqpay'.tr;
        strPayMethodIconName = 'qqpay.png';
        strPaymentQrCode = paymentmethods.qrCode!;
        if (paymentmethods.realName != null) {
          strUserName = paymentmethods.realName!;
        } else {
          strUserName = strLoadUserName();
        }

        if (paymentmethods.account != null) {
          strAccountName = paymentmethods.account!;
        }
      }
      list.add(
        Container(
          decoration: BoxDecoration(
            color: const Color(0x00000000),
          ),
          child: SizedBox(
            width: 360.0,
            height: 200.0,
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 120.0, start: 30.0),
                  Pin(size: 45.0, start: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffd3e0f0),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                          width: 2.0, color: const Color(0xff1d4f8b)),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        strPayMethodName,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 18,
                          color: const Color(0xff1d4f8b),
                        ),
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 30.0, end: 30.0),
                  Pin(size: 80.0, start: 80.0),
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            width: 2.0, color: const Color(0xff1d4f8b)),
                      ),
                    ),
                    onTap: () async {
                      controller.cacheservice.paymentManagerEntity =
                          controller.paymentmethods[i];
                      var ret = await Get.toNamed(AppRoutes.PaymentInfo);
                      controller.PaymentManageInfo();
                    },
                  ),
                ),
                strPaymentQrCode.length > 0
                    ? Pinned.fromPins(
                        Pin(size: 60.0, start: 40.0),
                        Pin(size: 60.0, end: 50),
                        child: Container(
                          child: Image.asset('assets/images/paymentcode.png'),
                        ),
                      )
                    : Pinned.fromPins(
                        Pin(size: 60.0, start: 15.0),
                        Pin(size: 60.0, end: 0.0),
                        child: Container(),
                      ),
                strPaymentQrCode.length > 0
                    ? Pinned.fromPins(
                        Pin(size: 40.0, start: 50.0),
                        Pin(size: 40.0, end: 60),
                        child: InkWell(
                          child: CachedNetworkImage(
                            height: 40,
                            width: 40,
                            imageUrl: strPaymentQrCode.contains('http') ||
                                    strPaymentQrCode.contains('https')
                                ? strPaymentQrCode
                                : HttpUrl.BASE_GCPAY_URL + strPaymentQrCode,
                            imageBuilder: (context, imageProvider) => Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
                          ),
                          onTap: () async {
                            String strPaymentQrcode =
                                strPaymentQrCode.contains('http') ||
                                        strPaymentQrCode.contains('https')
                                    ? strPaymentQrCode
                                    : HttpUrl.BASE_GCPAY_URL + strPaymentQrCode;
                            openPaymentQrcode(strPaymentQrcode);
                          },
                        ),
                      )
                    : Pinned.fromPins(Pin(size: 50.0, start: 40.0),
                        Pin(size: 50.0, end: 55.0),
                        child: InkWell(
                          child: Container(
                              child:
                                  Image.asset('assets/images/union_pay.png')),
                          onTap: () async {},
                        )),
                Pinned.fromPins(
                  Pin(size: 40.0, start: 110.0),
                  Pin(size: 40.0, start: 90.0),
                  child: InkWell(
                      child: Container(
                        width: 39.0,
                        height: 39.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/' + strPayMethodIconName),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      onTap: () async {
                        controller.cacheservice.paymentManagerEntity =
                            controller.paymentmethods[i];
                        var ret = await Get.toNamed(AppRoutes.PaymentInfo);
                        controller.PaymentManageInfo();
                      }),
                ),
                Pinned.fromPins(Pin(size: 100.0, end: 170.0),
                    Pin(size: 18.0, start: 100.0),
                    child: InkWell(
                        child: Text(
                          strUserName == null
                              ? controller.cacheservice.loadUserName()!
                              : strUserName,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 15,
                            color: const Color(0xff1d4f8b),
                          ),
                        ),
                        onTap: () async {
                          controller.cacheservice.paymentManagerEntity =
                              controller.paymentmethods[i];
                          var ret = await Get.toNamed(AppRoutes.PaymentInfo);
                          controller.PaymentManageInfo();
                        })),
                paymentmethods.paymentType == 3
                    ? Pinned.fromPins(Pin(start: 200.0, end: 60.0),
                        Pin(size: 20.0, start: 100.0),
                        child: InkWell(
                            child: Text(
                              'Name'.tr + ':' + strUserRealName,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 15,
                                color: const Color(0xff1d4f8b),
                              ),
                            ),
                            onTap: () async {
                              controller.cacheservice.paymentManagerEntity =
                                  controller.paymentmethods[i];
                              var ret =
                                  await Get.toNamed(AppRoutes.PaymentInfo);
                              controller.PaymentManageInfo();
                            }))
                    : Container(),
                Pinned.fromPins(Pin(size: 300.0, start: 110.0),
                    Pin(size: 28.0, start: 130.0),
                    child: InkWell(
                        child: Text(
                          strAccountMethodName + strAccountName,
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 18,
                            color: const Color(0xff1d4f8b),
                          ),
                        ),
                        onTap: () async {
                          controller.cacheservice.paymentManagerEntity =
                              controller.paymentmethods[i];
                          var ret = await Get.toNamed(AppRoutes.PaymentInfo);
                          controller.PaymentManageInfo();
                        })),
              ],
            ),
          ),
        ),
      ); //add any Widget in place of Text("Index $i")
    }
    return list; // all widget added now retrun the list here
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          //bubbles
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
                                alignment: Alignment(0, 0.9),
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
                    Pin(size: 28.0, start: 190.0),
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
                  Obx(() => controller.paymentmethods.length > 0
                      ? Pinned.fromPins(
                          Pin(start: 35.0, end: 35.0),
                          Pin(start: 223.0, end: 0.0),
                          child: SizedBox(
                            width: 284.0,
                            height: 490.0,
                            child: Stack(
                              children: <Widget>[
                                Pinned.fromPins(Pin(size: 420.0, middle: 0.5),
                                    Pin(start: 0.0, end: 10.0),
                                    child:
                                        ListView(children: paymentListItem())),
                              ],
                            ),
                          ),
                        )
                      : Pinned.fromPins(
                          Pin(size: 370.0, start: 32.5),
                          Pin(size: 290.0, start: 190.0),
                          child: SizedBox(
                            width: 284.0,
                            height: 300.0,
                            child: Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(start: 10.0, end: 10),
                                  Pin(start: 84.0, end: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Color(0xffd5e0ee),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/payment_wallet.png',
                                          height: 120,
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        Text(
                                          'nopayment'.tr,
                                          style: TextStyle(
                                            fontFamily: 'Helvetica Neue',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.85, 0.7),
            child: FloatingActionButton(
              heroTag: UniqueKey(),
              onPressed: () async {
                if (controller.rxAuthFlag.value == 0) {
                  controller.openAuthReminder(
                      "WarmReminder".tr, 'notverifyfirstly'.tr, '');
                } else if (controller.rxAuthFlag.value == 1) {
                  Fluttertoast.showToast(
                      msg: 'verifying'.tr, gravity: ToastGravity.CENTER);
                } else if (controller.rxAuthFlag.value == 2) {
                  var data = await Get.toNamed(AppRoutes.AddPayment);
                  controller.PaymentManageInfo();
                }
              },
              backgroundColor: Color(0xff15056d),
              child: Icon(
                Icons.add,
                size: 35,
                color: Colors.white,
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

class ManageController extends BaseController {
  final GCPayApi gcpayApi;
  final CacheService cacheservice;
  ManageController(this.cacheservice, this.gcpayApi);

  int intPopup = 0;
  RxInt rxAuthFlag = 0.obs;
  RxInt paymentType = 1.obs;
  RxString qrCode = ''.obs;
  RxString zfbAccount = ''.obs;
  RxString remark = ''.obs;
  RxList<UmsPaymentSell> paymentmethods = <UmsPaymentSell>[].obs;
  var eventBusFn;
  @override
  void loadNet() {}

  @override
  void onClose() {
    eventBusFn.cancel();
    super.onClose();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await getUserBalanceInfo();
    PaymentManageInfo();
    // 注册监听器，订阅 eventbus
    eventBusFn = eventBus.on<EventFn>().listen((event) {
      //  event为 event.obj 即为 eventBus.dart 文件中定义的 EventFn 类中监听的数据
      print(event.obj);
      var eventObj = event.obj;
      if (eventObj['eventbus'] == 'payment') {
        PaymentManageInfo();
        getUserBalanceInfo();
      }
    });
  }

  Future<void> openAuthReminder(
      String strNoticeTitle, String strNoticeContent, String strNoticeTime) async {
    if (intPopup == 1) {
      return;
    }
    final popup = BeautifulPopup(
      context: Get.context!,
      template: TemplateNotification,
    );
    var shouldUpdate = await popup.show(
      title: strNoticeTitle,
      content: strNoticeContent,
      actions: [
        popup.button(
            label: 'cancel'.tr,
            onPressed: () {
              intPopup = 0;
              Get.back();
            }),
        popup.button(
          label: 'confirm'.tr,
          onPressed: () async {
            Get.back();
            var data = await Get.toNamed(AppRoutes.VerifyPage);
            await getUserBalanceInfo();
            await PaymentManageInfo();
          },
        ),
      ],
    );
    cacheservice.intPopup = 0;
  }

  Future<void> getUserBalanceInfo() async {
    try {
      String strAlias = '';
      strAlias = cacheservice.loadPushAlias()!;
      Map<String, dynamic> data = <String, dynamic>{'alias': strAlias};
      var response = await gcpayApi.umsUserBalance(data);
      if (response.code == 401) {}
      if (response.code == 200) {
        //return json.decode(response.body);
        UserBalanceAmountEntity balanceEntity = response.data!;
        if (balanceEntity.realName != null) {
          cacheservice.saveUserName(balanceEntity.realName!);
        }
        if (balanceEntity.nickname != null) {
          cacheservice.saveUserNickName(balanceEntity.nickname!);
        }
        cacheservice.saveServiceLink(balanceEntity.serviceLink!);
        cacheservice.saveAuthFlag(balanceEntity.authFlag.toString());
        rxAuthFlag.value = balanceEntity.authFlag!.toInt();
      } else {}
      // var message = response.toString();
      //
      // log('${json.decode(response.body)}');
      // log('All ovens loaded successfully');
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future<void> PaymentManageInfo() async {
    try {
      var response = await gcpayApi.getUmsPayment();
      if (response.code == 400) {}
      if (response.code == 200) {
        paymentmethods.value = response.data!;
        cacheservice.paymentmethods.value = paymentmethods.value;
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

class ManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => ManageController(Get.put(CacheService()), Get.put(GCPayApi())));
  }
}

const String _svg_ehpyic =
    '<svg viewBox="33.0 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_o6w7v1 =
    '<svg viewBox="0.0 0.0 34.0 34.0" ><path  d="M 34 0 L 34 34 L 0 34 L 0 0 L 34 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_mdz9os =
    '<svg viewBox="7.4 7.4 19.1 19.1" ><path transform="translate(7.44, 7.44)" d="M 8.181198120117188 19.125 L 10.94369792938232 19.125 L 10.94369792938232 10.94395732879639 L 19.125 10.94395732879639 L 19.125 8.18145751953125 L 10.94369792938232 8.18145751953125 L 10.94369792938232 0 L 8.181198120117188 0 L 8.181198120117188 8.18145751953125 L 0 8.18145751953125 L 0 10.94395732879639 L 8.181198120117188 10.94395732879639 L 8.181198120117188 19.125 Z" fill="#0052d9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
