import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:GCPay/controllers/auth_controller.dart';
import 'package:GCPay/services/cache_service.dart';

import '../http/apiservice/gcpay_api.dart';
import '../http/apiservice/haxi_api.dart';
import '../services/auth_api_service.dart';

class PasswordController extends AuthController {
  final GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(debugLabel: '__passwordFormKey__');
  final usernameController = TextEditingController();
  final formUsernameFieldKey = GlobalKey<FormFieldState>();
  final emailController = TextEditingController();
  final formEmailFieldKey = GlobalKey<FormFieldState>();
  final passwordController = TextEditingController();
  final formPasswordFieldKey = GlobalKey<FormFieldState>();
  final confirmPasswordController = TextEditingController();
  final formConfirmPasswordFieldKey = GlobalKey<FormFieldState>();

  FocusNode usernameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  PasswordController(
      AuthApiService authenticationService, CacheService cacheServices,GCPayApi gcpayapi)
      : super(authenticationService, cacheServices,gcpayapi);
  void onInit() {
    _addListener();
    // textFieldFocusNode.hasFocus = false;
    super.onInit();
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
  }

  @override
  void onClose() {
    usernameController.dispose();
    usernameFocusNode.dispose();
    emailController.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    confirmPasswordController.dispose();
    confirmPasswordFocusNode.dispose();

    super.onClose();
  }

  String? usernameValidator(String? value) {
    // if(fieldLostFocus == usernameController.hashCode)
    log('usernameValidator-----');
    if (value == null || value.trim().isEmpty) {
      return 'Please this field must be filled'.tr;
    }
    if (value.trim().length < 4) {
      return 'Username must be at least 4 characters in length';
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

  String? validator(String? value) {
    log('validatoooor');

    if (value != null && value.isEmpty) {
      return 'Please this field must be filled'.tr;
    }
    return null;
  }

  Future<void> signup() async {
    log('${emailController.text}, ${passwordController.text}');
    if (signupFormKey.currentState!.validate()) {
      try {
        await signUp(<String, String>{
          'username': usernameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'confirmPassword': confirmPasswordController.text,
        });
      } catch (err, _) {
        // message = 'There is an issue with the app during request the data, '
        //         'please contact admin for fixing the issues ' +

        passwordController.clear();
        confirmPasswordController.clear();
        rethrow;
      }
    } else {
      throw Exception('An error occurred, invalid inputs value'.tr);
    }
  }
}
