import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:GCPay/constant/common_constant.dart';
import 'package:GCPay/controllers/auth_controller.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:openinstall_flutter_plugin/openinstall_flutter_plugin.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:uuid/uuid.dart';

import '../http/apiservice/gcpay_api.dart';
import '../http/apiservice/haxi_api.dart';
import '../services/auth_api_service.dart';

class SignupController extends AuthController {
  final GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(debugLabel: '__signupFormKey__');
  final phoneNumController = TextEditingController();
  final formUsernameFieldKey = GlobalKey<FormFieldState>();
  final phoneVerifyCodeController = TextEditingController();
  final formTrc20FieldKey = GlobalKey<FormFieldState>();
  final emailController = TextEditingController();
  final formEmailFieldKey = GlobalKey<FormFieldState>();
  final passwordController = TextEditingController();
  final formPasswordFieldKey = GlobalKey<FormFieldState>();
  final confirmPasswordController = TextEditingController();
  final formConfirmPasswordFieldKey = GlobalKey<FormFieldState>();
  final payCodeController = TextEditingController();
  final formInviteCodeFieldKey = GlobalKey<FormFieldState>();

  FocusNode usernameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode trc20FocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  FocusNode inviteCodeFocusNode = FocusNode();

  RxBool isButtonEnable = false.obs;      //按钮初始状态  是否可点击
  RxInt count = 30.obs;                     //初始倒计时时间
  Timer? timer;
  RxString buttonText = '30'.obs;   //初始文本
  RxString captaText = CommonConstant.DEVICE_UUID.obs;

  RxBool isPasswordDisplay = true.obs;
  RxBool isPasswordConfirmDisplay = true.obs;
  RxBool isPaymentPasswordDisplay = true.obs;
  RxInt selectedRadio = 0.obs;
  OpeninstallFlutterPlugin _openinstallFlutterPlugin = OpeninstallFlutterPlugin();
  SignupController(
      AuthApiService authenticationService, CacheService cacheServices,GCPayApi gcpayapi)
      : super(authenticationService, cacheServices,gcpayapi);

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

  @override
  Future<void> onInit() async {
    super.onInit();
    _addListener();
    // textFieldFocusNode.hasFocus = false;
    initTimer();
    String? deviceId = await PlatformDeviceId.getDeviceId;
    log("signup controller" + deviceId!);
    captaText.value = deviceId;
    phoneVerifyCodeController.text='';
    phoneNumController.text='';
  }

  void _addListener() {
    usernameFocusNode.addListener(() {
      log('usernameFocusNode-----${usernameFocusNode.hasFocus}');
      if (!usernameFocusNode.hasFocus) {
        formUsernameFieldKey.currentState!.validate();
        // fieldLostFocus = usernameController.hashCode.toString();
      }
    });
    emailFocusNode.addListener(() {
      log('emailFocusNode-----${emailFocusNode.hasFocus}');
      if (!emailFocusNode.hasFocus) {
        formEmailFieldKey.currentState!.validate();
      }
    });
    passwordFocusNode.addListener(() {
      if (!passwordFocusNode.hasFocus) {
        formPasswordFieldKey.currentState!.validate();
      }
    });
    confirmPasswordFocusNode.addListener(() {
      if (!confirmPasswordFocusNode.hasFocus) {
        formConfirmPasswordFieldKey.currentState!.validate();
      }
    });

    inviteCodeFocusNode.addListener(() {
      if (!inviteCodeFocusNode.hasFocus) {
        formInviteCodeFieldKey.currentState!.validate();
      }
    });
  }

  @override
  void onClose() {
    phoneNumController.dispose();
    usernameFocusNode.dispose();
    emailController.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    confirmPasswordController.dispose();
    confirmPasswordFocusNode.dispose();
    payCodeController.dispose();
    inviteCodeFocusNode.dispose();
    timer?.cancel();
    timer=null;
    super.onClose();
  }

  String? usernameValidator(String? value) {
    // if(fieldLostFocus == usernameController.hashCode)
    log('usernameValidator-----');
    if (value == null || value.trim().isEmpty) {
      return 'Please this field must be filled'.tr;
    }
    if (value.trim().length < 4) {
      return 'Username must be at least 4 characters in length'.tr;
    }
    // Return null if the entered username is valid
    return null;
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

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please this field must be filled'.tr;
    }
    log('${value}--${passwordController.value.text}');
    if (value != passwordController.value.text) {
      return 'Confirmation password does not match the entered password'.tr;
    }

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
  // 验证是否为数字
  bool isNumber(String str) {
    final reg = RegExp(r'^-?[0-9]+');
    print('$str 是否数字:${reg.hasMatch(str)}');
    return reg.hasMatch(str);
  }

  String? paypasswordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please this field must be filled'.tr;
    }

    if(!isNumber(value))
    {
      return 'paypassword_6digital_hint'.tr;
    }

    if (value.trim().length != 6) {
      return 'paypassword_6digital_hint'.tr;
    }
    // Return null if the entered password is valid
    return null;
  }

  String? validator(String? value) {
    log('validatoooor');

    if (value != null && value.isEmpty) {
      return 'Please this field must be filled'.tr;
    }
    return null;
  }

//code	integer($int64)
// confirm	string
// password	string
// playerName	string
// trc20Address	string

  Future<bool> signup() async {
    bool blSignUpSuccess = false;
    log('${emailController.text}, ${passwordController.text}');
    if (signupFormKey.currentState!.validate()) {
      try {

        blSignUpSuccess = await signUp(<String, String>{
          'nickname': phoneNumController.text,
          'captcha': phoneVerifyCodeController.text,
          'loginPassword': passwordController.text,
          'payPassword': payCodeController.text,
          'deviceId': captaText.value,
        });
        _openinstallFlutterPlugin.reportRegister();
      } catch (err, _) {
        // message = 'There is an issue with the app during request the data, '
        //         'please contact admin for fixing the issues ' +

        //passwordController.clear();
        //confirmPasswordController.clear();
        rethrow;
      }
    } else {
      throw Exception('An error occurred, invalid inputs value'.tr);
    }
    return blSignUpSuccess;
  }

  Future<void> sendsmscode() async {
    log('${phoneNumController.text}, ${phoneNumController.text}');

      try {
        await senSmsCode(<String, String>{
          'phoneNumber': phoneNumController.text,
        });
      } catch (err, _) {
        // message = 'There is an issue with the app during request the data, '
        //         'please contact admin for fixing the issues ' +

        phoneVerifyCodeController.clear();
        rethrow;
      }
  }
}
