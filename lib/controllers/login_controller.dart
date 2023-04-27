import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GCPay/constant/common_constant.dart';
import 'package:GCPay/controllers/auth_controller.dart';
import 'package:GCPay/http/apiservice/haxi_api.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:GCPay/widget/Loading_overlay.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../GCPay/home_page/Model/HomePage_Record_entity.dart';
import '../http/apiservice/gcpay_api.dart';
import '../http/result/base_result.dart';
import '../services/auth_api_service.dart';
import '../utils/create_image.dart';

class LoginController extends AuthController {
  GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(debugLabel: '__loginFormKey__');
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final verifycodeController = TextEditingController();
  final formTrc20FieldKey = GlobalKey<FormFieldState>();
  RxString rxStrPath = ''.obs;
  Rx<PackageInfo> packageInfo = PackageInfo(appName: '',buildNumber: '',packageName: '',version: '').obs;
  RxString rxStrVersion = ''.obs;
  RxInt rxIntVersionClick = 0.obs;
  @override
  void loadNet() {}

  FocusNode trc20FocusNode = FocusNode();
  RxBool isButtonEnable = false.obs;      //按钮初始状态  是否可点击
  RxInt count = 30.obs;                     //初始倒计时时间
  Timer? timer;
  RxString buttonText = '30'.obs;   //初始文本
  RxString strdeviceid = ''.obs;   //图形验证码
  RxString rxStrPushAlias = ''.obs;
  RxList<UmsPaymentSell> paymentmethods = <UmsPaymentSell>[].obs;
  RxBool isLoginPasswordDisplay = true.obs;
  RxInt selectedRadio = 0.obs;

  LoginController(
      AuthApiService authenticationService, CacheService cacheServices,GCPayApi gcpayapi)
      : super(authenticationService, cacheServices, gcpayapi);

  void initTimer() {
    timer =
        Timer.periodic(const Duration(seconds: 1), (Timer timer) {
          count--;

          if (count == 0) {
            timer.cancel(); //倒计时结束取消定时器
            isButtonEnable.value = true; //按钮可点击
            count.value = 30; //重置时间
            buttonText.value = ''; //重置按钮文本
          } else {
            buttonText.value = count.value.toString(); //更新文本内容
          }
        });
  }

  Future<void> buttonClickListen() async {
    if (isButtonEnable.value) {
      //当按钮可点击时
      isButtonEnable.value = false; //按钮状态标记
      initTimer();
    }
  }

  bool getButtonEnable()
  {
    if(count.value == 30)
      {
        isButtonEnable.value = true;

      }
    return isButtonEnable.value;

  }
  Future<void> initVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    rxStrVersion.value = version;
  }

  @override
  Future<void> onInit() async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    cacheServices.rxDeviceid.value = deviceId!;
    cacheServices.saveDeviceId(deviceId);
    strdeviceid.value = deviceId;
    rxStrPushAlias.value = cacheServices.loadPushAlias()!;
    log("login controller" + deviceId);
    initTimer();
    ImageCache  imageCache = PaintingBinding.instance.imageCache;
    imageCache.clear();
    imageCache.clearLiveImages();
    initVersion();
  }
  @override
  void onClose() {
    //emailController.dispose();
    //passwordController.dispose();
    timer?.cancel();
    timer=null;
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    rxStrPath.value = cacheServices.rxProfilePath.value;
  }

  String? validator(String? value) {
    log('validatoooor');

    if (value != null && value.isEmpty) {
      return 'Please this field must be filled'.tr;
    }
    return null;
  }

//  "password": "string",
//   "playerName": "string",
//   "trc20Address": "string"
  Future<bool> login() async {
    bool blLoginSuccess = false;
    log('${emailController.text}, ${passwordController.text}');
    if (loginFormKey.currentState!.validate()) {
      try {
        String strDeviceType = '';
        if (Platform.isIOS) {
          strDeviceType = "IOS";
        } else if (Platform.isAndroid) {
          strDeviceType = "Android";
        }


        blLoginSuccess = await signIn(<String, String>{
          'nickname': emailController.text,
          'loginPassword': passwordController.text,
          'captcha': verifycodeController.text,
          'deviceId': strdeviceid.value,
          'deviceType':strDeviceType,
          'alias':rxStrPushAlias.value,
        });
      } catch (err, _) {
        // message = 'There is an issue with the app during request the data, '
        //         'please contact admin for fixing the issues ' +

        //passwordController.clear();
        rethrow;
      }
    } else {
      throw Exception('An error occurred, invalid inputs value'.tr);
    }
    return blLoginSuccess;
  }

  Future<void> getPaymentManageInfo() async {
    try {

      var response = await api.getUmsPayment();
      if (response.code == 400) {}
      if (response.code == 200) {
        paymentmethods.value = response.data!;
        cacheServices.paymentmethods.value = response.data!;
        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }


  String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please this field must be filled'.tr;
    }
    if (value.trim().length < 6) {
      return 'Password must be at least 6 characters in length'.tr;
    }
    // Return null if the entered password is valid
    return null;
  }

  String? verifyCodeValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please this field must be filled'.tr;
    }
    if (value.trim().length < 4) {
      return 'VerifyCode must be at  4 characters in length'.tr;
    }
    // Return null if the entered password is valid
    return null;
  }
}

