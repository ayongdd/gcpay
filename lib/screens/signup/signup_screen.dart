import 'dart:async';
import 'dart:developer';

import 'package:adobe_xd/pinned.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:GCPay/controllers/signup_controller.dart';
import 'package:GCPay/routes/app_routes.dart';
import 'package:GCPay/widget/loading_overlay.dart';

import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../constant/common_constant.dart';
import '../../constant/http_url.dart';
import '../../widget/flat_widget.dart';

class _BottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  final double bottomSheetOffset;

  const _BottomSheet({
    required this.scrollController,
    required this.bottomSheetOffset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: scrollController,
      children: [
        Text(
          'position $bottomSheetOffset',
          style: Theme.of(context).textTheme.headline6,
        ),
        Column(
          children: [Text('useragreementcontent'.tr)],
        ),
      ],
    );
  }
}

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LoadingOverlay overlay = LoadingOverlay.of(context);
    final ThemeData theme = Theme.of(Get.context!);
    final ColorScheme colorScheme = theme.colorScheme;
    log("getcapte captatext:" + controller.captaText.value);
    log("getcapte devicid:" + CommonConstant.DEVICE_UUID);
    return Scaffold(
      appBar: AppBar(
        title: Text('signup'.tr),
        leading: IconButton(
          color: colorScheme.onPrimary,
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
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.signupFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/gcpay.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'cp_gcpay'.tr,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    height: 14,
                  ),
                  //inputUserName
                  Container(
                    child: TextFormField(
                      key: controller.formUsernameFieldKey,
                      controller: controller.phoneNumController,
                      decoration: InputDecoration(
                        helperText: ' ',
                        icon: Icon(Icons.phone_android),
                        hintText: 'login_phonenum_hint'.tr,
                        hintStyle: TextStyle(fontSize: 14),
                      ),
                      focusNode: controller.usernameFocusNode,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: controller.usernameValidator,
                    ),
                  ),
                  Container(
                    height: 0,
                  ),
                  //verifycode
                  Container(
                    child: Stack(
                      children: <Widget>[
                        TextFormField(
                          key: controller.formTrc20FieldKey,
                          controller: controller.phoneVerifyCodeController,
                          focusNode: controller.trc20FocusNode,
                          decoration: InputDecoration(
                            helperText: ' ',
                            icon: Icon(Icons.sms),
                            hintText: 'login_verifycode_hint'.tr,
                            hintStyle: TextStyle(fontSize: 14),
                          ),
                          autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                          validator: controller.verifyCodeValidator,
                          // obscureText: true,
                        ),
                        Align(
                          alignment: Alignment(1.0, 0.0),
                          child: SizedBox(
                            width: 130.0,
                            height: 40.0,
                            child: Obx(() => FlatButtonX(
                                disabledColorx: Colors.grey
                                    .withOpacity(0.1), //按钮禁用时的颜色
                                disabledTextColorx:
                                Colors.white, //按钮禁用时的文本颜色
                                textColorx:
                                controller.isButtonEnable.value
                                    ? Colors.white
                                    : Colors.black
                                    .withOpacity(0.2), //文本颜色
                                colorx: Colors.grey
                                    .withOpacity(0.1), //按钮的颜色
                                shapex: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    side: BorderSide(
                                        color: Colors.grey,
                                        width: 0.5)),
                                onPressedx: () {
                                  if (controller.isButtonEnable.value) {
                                    controller.captaText.value =
                                        Uuid().v1();
                                    CommonConstant.DEVICE_UUID =
                                        controller.captaText.value;
                                    log(controller.captaText.value);
                                    controller.buttonClickListen();
                                  }
                                },
                                childx: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      height: 25.9,
                                      child: Image.network(
                                        HttpUrl.BASE_GCPAY_URL +
                                            "/api/user/captcha?deviceId=" +
                                            controller.captaText.value,
                                        fit: BoxFit.cover,
                                        key: UniqueKey(),
                                      ),
                                    ),
                                    Container(
                                      width: 5,
                                    ),
                                    controller.isButtonEnable.value
                                        ? const Icon(Icons.refresh,
                                        color: Colors.grey)
                                        : Text(
                                      controller.buttonText.value,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 0,
                  ),
                  //Password
                  Container(
                    child: Obx(() => TextFormField(
                          key: controller.formPasswordFieldKey,
                          controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          decoration: InputDecoration(
                            helperText: ' ',
                            icon: Icon(Icons.security),
                            hintText: 'login_password_hint'.tr,
                            hintStyle: TextStyle(fontSize: 14),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: controller.passwordValidator,
                          obscureText: controller.isPasswordDisplay.value,
                        )),
                  ),
                  Container(
                    height: 0,
                  ),
                  //passwordAgain
                  Container(
                    child: Obx(() => TextFormField(
                          key: controller.formConfirmPasswordFieldKey,
                          controller: controller.confirmPasswordController,
                          focusNode: controller.confirmPasswordFocusNode,
                          decoration: InputDecoration(
                            helperText: ' ',
                            icon: Icon(
                              Icons.security,
                            ),
                            hintText: 'login_passwordagain_hint'.tr,
                            hintStyle: TextStyle(fontSize: 14),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: GestureDetector(
                                onTap: () {
                                  controller.isPasswordConfirmDisplay.value =
                                      !controller
                                          .isPasswordConfirmDisplay.value;
                                },
                                child: Icon(
                                  controller.isPasswordConfirmDisplay.value
                                      ? Icons.visibility_rounded
                                      : Icons.visibility_off_rounded,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: controller.confirmPasswordValidator,
                          obscureText:
                              controller.isPasswordConfirmDisplay.value,
                        )),
                  ),
                  Container(
                    height: 0,
                  ),
                  //paypassPassword
                  Container(
                    child: Obx(() => TextFormField(
                          key: controller.formInviteCodeFieldKey,
                          controller: controller.payCodeController,
                          keyboardType: TextInputType.number,
                          focusNode: controller.inviteCodeFocusNode,
                          decoration: InputDecoration(
                            helperText: ' ',
                            icon: Image.asset(
                              "assets/images/Icon_invitecode.png",
                              height: 24,
                              fit: BoxFit.cover,
                            ),
                            hintText: 'pay_code_hint'.tr,
                            hintStyle: TextStyle(fontSize: 14),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: GestureDetector(
                                onTap: () {
                                  controller.isPaymentPasswordDisplay.value =
                                      !controller
                                          .isPaymentPasswordDisplay.value;
                                },
                                child: Icon(
                                  controller.isPaymentPasswordDisplay.value
                                      ? Icons.visibility_rounded
                                      : Icons.visibility_off_rounded,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator:
                          controller.paypasswordValidator,
                          obscureText:
                              controller.isPaymentPasswordDisplay.value,
                        )),
                  ),
                  Container(
                    child: Obx(() =>  RadioListTile(
                      value: 1,
                      onChanged: (val) {
                        print("Radio $val");
                        showSheetWithoutList();
                      },
                      toggleable: true,
                      groupValue: controller.selectedRadio.value,
                      activeColor: Colors.blueAccent,
                      title: RichText(
                        text: TextSpan(
                            text: 'agree'.tr,
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'useragreement'.tr,
                                style: TextStyle(color: colorScheme.primary),
                              )
                            ]),
                      ),
                    ),
                  )),
                  Container(
                    height: 10,
                  ),
                  //buttonSignUp
                  SizedBox(
                    width: 250, // <-- Your width
                    height: 50, // <-- Your height
                    child: ElevatedButton(
                        onPressed: () async {
                          if (controller.signupFormKey.currentState!
                              .validate()) {
                            if(controller.selectedRadio.value == 0)
                              {
                                Fluttertoast.showToast(msg: 'readandagreeuseragreement'.tr,gravity: ToastGravity.CENTER);
                                return;
                              }
                            LoadingOverlay.show(message: 'Loading...'.tr);
                            try {
                              var signupresult = await controller.signup();
                              if(signupresult == true)
                                {
                                  controller.signupFormKey.currentState!.save();
                                  log('response signup');
                                  Get.back(closeOverlays: true);
                                  Get.toNamed(AppRoutes.LoginPage);
                                }
                              else
                                {
                                  LoadingOverlay.hide();
                                }

                            } catch (err, _) {
                              printError(info: err.toString());
                              LoadingOverlay.hide();
                              // Get.snackbar(
                              //   "error".tr,
                              //   err.toString(),
                              //   snackPosition: SnackPosition.TOP,
                              //   backgroundColor: Colors.red.withOpacity(.75),
                              //   colorText: Colors.white,
                              //   icon: const Icon(Icons.error,
                              //       color: Colors.white),
                              //   shouldIconPulse: true,
                              //   barBlur: 20,
                              // );
                            } finally {}
                          }
                        },
                        child: Text(
                          'signup'.tr,
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  Container(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('haveaccount'.tr),
                        Text(
                          'loginnow'.tr,
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  void showSheetWithoutList() {
    showStickyFlexibleBottomSheet<void>(
      minHeight: 0,
      initHeight: 0.6,
      maxHeight: .601,
      headerHeight: 50,
      context: Get.context!,
      isSafeArea: false,
      bottomSheetColor: Color(0xffffffff),
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
      ),
      headerBuilder: (context, offset) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  TextButton(onPressed: () {
                    Get.back();
                    controller.selectedRadio.value = 0;
                  }, child: Text('disagree'.tr,style: TextStyle(fontSize: 16,color: Color(0xfff9f9f9)),)),
                  Text(
                    'useragreement'.tr,
                    style: TextStyle(fontSize: 18,color: Colors.white),
                  ),
                      TextButton(onPressed: () {
                        Get.back();
                        controller.selectedRadio.value = 1;
                      }, child: Text('agree'.tr,style: TextStyle(fontSize: 16,color: Color(0xfff9f9f9)),)),
                ]),
              ),
            ],
          ),
        );
      },
      bodyBuilder: (context, offset) {
        return SliverChildListDelegate(
          [
            Container(
              margin: EdgeInsets.all(20),
              child: Text('useragreementcontent'.tr),
            )
          ],
        );
      },
      anchors: [.2, 0.6, 0.601],
    );
  }
}
