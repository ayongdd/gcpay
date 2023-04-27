import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:GCPay/controllers/auth_controller.dart';
import 'package:GCPay/mixin/toast/toast_mixin.dart';
import 'package:GCPay/services/cache_service.dart';

import '../http/apiservice/gcpay_api.dart';
import '../http/apiservice/haxi_api.dart';
import '../services/auth_api_service.dart';

class EditPwController extends AuthController with ToastMixin{
  final GlobalKey<FormState> signupFormKey =
  GlobalKey<FormState>(debugLabel: '__passwordFormKey__');
  final oldpasswordController = TextEditingController();
  final formoldpasswordFieldKey = GlobalKey<FormFieldState>();
  final passwordController = TextEditingController();
  final formPasswordFieldKey = GlobalKey<FormFieldState>();
  final confirmPasswordController = TextEditingController();
  final formConfirmPasswordFieldKey = GlobalKey<FormFieldState>();

  FocusNode oldpasswordFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  RxBool isOldPasswordDisplay = true.obs;
  RxBool isNewPasswordDisplay = true.obs;
  RxBool isNewPasswordConfirmDisplay = true.obs;

  RxBool isOldPaymentPasswordDisplay = true.obs;
  RxBool isNewPaymentPasswordDisplay = true.obs;
  RxBool isNewPaymentPasswordConfirmDisplay = true.obs;

  EditPwController(
      AuthApiService authenticationService, CacheService cacheServices,GCPayApi gcpayapi)
      : super(authenticationService, cacheServices,gcpayapi);

  void onInit() {
    _addListener();

    // textFieldFocusNode.hasFocus = false;
    super.onInit();
  }

  void _addListener() {
    oldpasswordFocusNode.addListener(() {
      log('oldpasswordFocusNode-----${oldpasswordFocusNode.hasFocus}');
      if (!oldpasswordFocusNode.hasFocus) {
        formoldpasswordFieldKey.currentState!.validate();
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
  }

  @override
  void onClose() {

    oldpasswordController.dispose();
    oldpasswordFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    confirmPasswordController.dispose();
    confirmPasswordFocusNode.dispose();

    super.onClose();
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

  String? confirmpayPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please this field must be filled'.tr;
    }

    if(!isNumber(value))
    {
      return 'paypassword_6digital_hint'.tr;
    }

    if (value.trim().length != 6) {
      return 'paypassword_6digital_hint'.tr;
    }
    log('${value}--${passwordController.value.text}');
    if (value != passwordController.value.text) {
      return 'Confirmation password does not match the entered password'.tr;
    }

    return null;
  }

  String? validator(String? value) {
    log('validatoooor');

    if (value != null && value.isEmpty) {
      return 'Please this field must be filled'.tr;
    }
    return null;
  }

  Future<void> editLoginPwd() async {
    {
      try {
        await editloginPwds(<String, String>{
          "original": oldpasswordController.text,
          "password": passwordController.text,
          "confirm": confirmPasswordController.text,
        });
      } catch (err, _) {
        // message = 'There is an issue with the app during request the data, '
        //         'please contact admin for fixing the issues ' +
        oldpasswordController.clear();
        passwordController.clear();
        confirmPasswordController.clear();

        rethrow;
      }
    }
  }
  Future<void> editPayPwd() async {
    {
      try {
        await editPayPwds(<String, String>{
          "original": oldpasswordController.text,
          "password": passwordController.text,
          "confirm": confirmPasswordController.text,
        });
      } catch (err, _) {
        // message = 'There is an issue with the app during request the data, '
        //         'please contact admin for fixing the issues ' +
        oldpasswordController.clear();
        passwordController.clear();
        confirmPasswordController.clear();

        rethrow;
      }
    }
  }
}
