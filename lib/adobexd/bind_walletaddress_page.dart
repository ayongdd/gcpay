import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:regexpattern/regexpattern.dart';

import '../base/controller/base_controller.dart';
import '../business/home_page/model/BetAddressData.dart';
import '../http/apiservice/gcpay_api.dart';
import '../http/apiservice/haxi_api.dart';
import '../utils/log_utils.dart';
import '../widget/Loading_overlay.dart';

class BindWalletaddressPage extends GetView<WalletAddressController> {
  BindWalletaddressPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textScheme = themeData.textTheme;
    CacheService cacheService = Get.find<CacheService>();
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        leading: IconButton(
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
        title: Text('WalletAddress'.tr,style: TextStyle(color: Colors.white),),
      ),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 142.0, start: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: themeData.colorScheme.primary,
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 290.0, start: 48.0),
            Pin(size: 70.0, start: 66),
            child: Text(
              'Attention'.tr,
              style: TextStyle(
                fontFamily: 'PingFang SC',
                fontSize: 11.3,
                color: const Color(0xffffffff),
                height: 1.5333333333333333,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 14.2, start: 30.0),
            Pin(size: 20.7, start: 34.0),
            child: SvgPicture.string(
              _svg_kcy037,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 242.0, start: 48),
            Pin(size: 30.0, start: 27.0),
            child: Text(
              'Betting wallet binding'.tr,
              style: TextStyle(
                fontFamily: 'inpin nanzhengbeizhanNZBZti',
                fontSize: 22,
                color: const Color(0xffff984b),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 380.0, start: 18.0),
            Pin(size: 25.0, start: 170),
            child: Text(
              'enterTRC20'.tr,
              style: TextStyle(
                fontFamily: 'PingFang SC',
                fontSize: 14,
                color: const Color(0xff000000),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 60.0, start: 210),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfff4f4f4),
                    borderRadius: BorderRadius.circular(6.0),
                    border:
                        Border.all(width: 1.0, color: const Color(0xffd8d8d8)),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 10.0, end: 10.0),
                  Pin(size: 50.0, start: 210),
                  child: Stack(
                    children: <Widget>[
                  Form(
                  key: controller.walletaddressFormKey,
                      child:
                      TextFormField(
                        key: controller.formTrc20FieldKey,
                        controller: controller.trc20AddressController,
                        decoration: InputDecoration(
                          hintText: cacheService.userTrc20AddressString.value,
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                        focusNode: controller.trc20FocusNode,
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: controller.validator,
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 50.0, start: 280),
            child:
            InkWell(child: Stack(
              children: <Widget>[

                Container(
                  decoration: BoxDecoration(
                    color: themeData.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                Align(
                  alignment: Alignment(0.003, 0.0),
                  child: SizedBox(
                    width: 144.0,
                    height: 22.0,
                    child: Text(
                      'bindEmmi'.tr,
                      style:themeData.textTheme.titleMedium,
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ),
              ],
            ),onTap:() async {
              try {
                await controller.walletaddress();
              } catch (err, _) {
                printError(info: err.toString());
                Get.snackbar(
                  "error".tr,
                  err.toString(),
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.red.withOpacity(.75),
                  colorText: Colors.white,
                  icon: const Icon(Icons.error,
                      color: Colors.white),
                  shouldIconPulse: true,
                  barBlur: 20,
                );
              } finally {}
            } ,),

          ),

        ],
      ),
    );
  }
}


const String _svg_gu7j7h =
    '<svg viewBox="25.1 53.5 7.4 14.9" ><path transform="translate(-3056.39, -5242.41)" d="M 3088.940673828125 5295.9091796875 L 3081.505859375 5303.34423828125 L 3088.940673828125 5310.77880859375" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kcy037 =
    '<svg viewBox="38.0 131.0 14.2 20.7" ><path transform="translate(38.0, 122.04)" d="M 5.546086311340332 8.95654296875 L 14.22046089172363 8.95654296875 L 8.674374580383301 29.68017578125 L 0 29.68017578125 L 5.546086311340332 8.95654296875 Z" fill="#ff984b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

class BindWalletaddressPageBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => BindWalletaddressController());
  }
}

class WalletAddressController extends BaseController{

  final GCPayApi api;

  final GlobalKey<FormState> walletaddressFormKey =
  GlobalKey<FormState>(debugLabel: '__walletaddressFormKey__');
  final formTrc20FieldKey = GlobalKey<FormFieldState>();
  FocusNode trc20FocusNode = FocusNode();
  WalletAddressController(this.api);
  final trc20AddressController = TextEditingController();

  @override
  void loadNet() {}

  @override
  void dispose() {
    trc20AddressController.dispose();
  }

  void onReady() {
    super.onReady();
    LogD("WalletAddressPage初始化onResume");
    showSuccess();
  }

  String? validator(String? value) {
    log('validatoooor');

    bool hasMatch = RegVal.hasMatch(value, 'T[A-Za-z1-9]{33}');

    if (value != null && value.isEmpty) {
      return 'Please this field must be filled'.tr;
    }

    if (!hasMatch) {
      return 'Invalid Trc20 Address'.tr;
    }
    return null;
  }

  Future<void> walletaddress() async {
    if (walletaddressFormKey.currentState!.validate()) {
    try {
      Map<String, dynamic> data = <String, String>{
        'trc20Address': trc20AddressController.text,
      };
      var response = await api.editTrc20(data);
      if (response.code == 408) {
        showToast(response.msg,
            gravity: ToastGravity.CENTER);
      }
      if (response.code == 200) {
        //return json.decode(response.body);
        showToast(response.msg,
            gravity: ToastGravity.CENTER);
        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
      // var message = response.toString();
      //

      // log('${json.decode(response.body)}');
      // log('All ovens loaded successfully');
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
    } else {
      //throw Exception('An error occurred, invalid inputs value');
    }
  }

  getBetAddress() async {
    // make status to loading
    change(null, status: RxStatus.loading());
    log('loading walletaddress success');
    // Code to get data
    log('load walletaddress success');
    // if done, change status to success
    change(null, status: RxStatus.success());
  }
}

class WalletAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
            () => WalletAddressController(Get.find<GCPayApi>()));
  }
}