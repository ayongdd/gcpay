import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:GCPay/routes/app_routes.dart';
import 'package:GCPay/widget/loading_overlay.dart';

import 'package:get/get.dart';

import '../../controllers/password_controller.dart';
import '../../services/cache_service.dart';
import '../../services/lang/localization_service.dart';
import '../../widget/webview_page.dart';

class PasswordScreen extends GetView<PasswordController> {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LoadingOverlay overlay = LoadingOverlay.of(context);
    final ThemeData theme = Theme.of(Get.context!);
    final ColorScheme colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: Text(
          'modify_password'.tr,
          style: TextStyle(color: Colors.white),
        ),
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
      ),
      body: Container(
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
                      image: AssetImage("assets/images/icon_logo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'cp_gcpay'.tr,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  // <-- Your width
                  height: 50, // <-- Your height
                  child: TextFormField(
                    key: controller.formUsernameFieldKey,
                    controller: controller.usernameController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'modify_password'.tr,
                      hintStyle: TextStyle(fontSize: 14),
                    ),
                    focusNode: controller.usernameFocusNode,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: controller.usernameValidator,
                  ),
                ),
                Container(
                  height: 10,
                ),
                SizedBox(
                  // <-- Your width
                  height: 50, // <-- Your height
                  child: TextFormField(
                    key: controller.formPasswordFieldKey,
                    controller: controller.passwordController,
                    focusNode: controller.passwordFocusNode,
                    decoration: InputDecoration(
                      icon: Icon(Icons.security),
                      hintText: 'login_password_hint'.tr,
                      hintStyle: TextStyle(fontSize: 14),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: controller.passwordValidator,
                    obscureText: true,
                  ),
                ),
                Container(
                  height: 10,
                ),
                SizedBox(
                  // <-- Your width
                  height: 50, // <-- Your height
                  child: TextFormField(
                    key: controller.formConfirmPasswordFieldKey,
                    controller: controller.confirmPasswordController,
                    focusNode: controller.confirmPasswordFocusNode,
                    decoration: InputDecoration(
                      icon: Icon(Icons.security),
                      hintText: 'login_passwordagain_hint'.tr,
                      hintStyle: TextStyle(fontSize: 14),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: controller.confirmPasswordValidator,
                    obscureText: true,
                  ),
                ),
                Container(
                  height: 20,
                ),
                SizedBox(
                  width: 250, // <-- Your width
                  height: 50, // <-- Your height
                  child: ElevatedButton(
                      onPressed: () async {
                        if (controller.signupFormKey.currentState!.validate()) {
                          LoadingOverlay.show(message: 'Loading...');
                          try {
                            await controller.signup();
                            controller.signupFormKey.currentState!.save();
                            log('response signup');

                            Get.offAllNamed(AppRoutes.MainPage);
                          } catch (err, _) {
                            printError(info: err.toString());
                            LoadingOverlay.hide();
                            Get.snackbar(
                              "error".tr,
                              err.toString(),
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.red.withOpacity(.75),
                              colorText: Colors.white,
                              icon:
                                  const Icon(Icons.error, color: Colors.white),
                              shouldIconPulse: true,
                              barBlur: 20,
                            );
                          } finally {}
                        }
                      },
                      child: Text(
                        'confirm'.tr,
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
                      Text('forgetpassword'.tr),
                      InkWell(
                        child: Text(
                          'contactcustomer'.tr,
                          style: TextStyle(color: colorScheme.primary),
                        ),
                        onTap: () {
                          CacheService cacheservice = Get.find<CacheService>();
                          String? getLocal = cacheservice.loadLanguage();
                          String strCSUrl = '';
                          if(getLocal == '1')
                          {
                            strCSUrl = "https://chatlink.mstatik.com/widget/standalone.html?eid=b6de0b8c409c539be3cfa3a9908f1d6c";
                          }
                          else
                          {
                            strCSUrl = "https://chatlink.mstatik.com/widget/standalone.html?eid=0d2b2137e3c92d6d9205c2e0a2feb9ff&language=en";
                          }
                          Get.to(WebViewPage(
                              strUrl: strCSUrl,
                              strTitle: 'contactcustomer'.tr,
                              blNavigation: true));
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
