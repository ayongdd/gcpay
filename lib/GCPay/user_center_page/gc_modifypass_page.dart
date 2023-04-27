import 'dart:developer';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';
import 'package:GCPay/base/pageWidget/base_stateless_widget.dart';
import 'package:GCPay/controllers/auth_controller.dart';
import 'package:GCPay/controllers/editpassword_controller.dart';
import 'package:GCPay/controllers/password_controller.dart';
import 'package:GCPay/http/apiservice/gcpay_api.dart';
import 'package:GCPay/routes/app_routes.dart';
import 'package:GCPay/widget/Loading_overlay.dart';
import '../../services/auth_api_service.dart';
import '../../services/cache_service.dart';
import '../buy_page/gc_buy_page.dart';

class ModifyPassPage extends BaseStatefulWidget<EditPwController> {
  const ModifyPassPage({Key? key}) : super(key: key);
  @override
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
            ),
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(
                width: 284.0,
                height: 800.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 200.0, start: 0.0),
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
                                    'changeloginpassword'.tr,
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
                              //Bubble
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 380.0, middle: 0.5),
                      Pin(start: 44.0, end: 10.0),
                      child: SizedBox(
                        width: 380.0,
                        height: 700.0,
                        child: Stack(
                          children: <Widget>[
                            //box1
                            Stack(children: <Widget>[
                            Pinned.fromPins(
                              Pin(size: 346.0, start: 17.0),
                              Pin(size: 50.0, start: 54.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(8.0),
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
                              Pin(size: 330.0, start: 25.0),
                              Pin(size: 70.0, start: 56.0),
                              child: Obx(() => TextFormField(
                                    key: controller.formoldpasswordFieldKey,
                                    controller:
                                        controller.oldpasswordController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffffffff),
                                      helperText: ' ',
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: 'modify_oldpassword_hint'.tr,
                                      contentPadding: EdgeInsets.only(
                                          left: 6,
                                          right: 0,
                                          top: 16,
                                          bottom: 0),
                                      hintStyle: TextStyle(
                                          fontFamily: 'PingFang SC',
                                          fontSize: 14,
                                          color: const Color(0xff707070),
                                          fontWeight: FontWeight.w500,
                                          height: 0.7),
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 0, 0, 0),
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.isOldPasswordDisplay
                                                    .value =
                                                !controller
                                                    .isOldPasswordDisplay.value;
                                          },
                                          child: Icon(
                                            controller
                                                    .isOldPasswordDisplay.value
                                                ? Icons.visibility_rounded
                                                : Icons.visibility_off_rounded,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                    focusNode: controller.oldpasswordFocusNode,
                                    validator: controller.passwordValidator,
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 15,
                                      color: const Color(0xff5d5d5d),
                                    ),
                                    obscureText:
                                        controller.isOldPasswordDisplay.value,
                                  )),
                            ),],),

                            //box2
                            Stack(children: <Widget>[
                            Pinned.fromPins(
                              Pin(size: 346.0, start: 17.0),
                              Pin(size: 50.0, start: 150.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(8.0),
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
                              Pin(size: 330.0, start: 25.0),
                              Pin(size: 70.0, start: 152.0),
                              child: Obx(() => TextFormField(
                                    key: controller.formPasswordFieldKey,
                                    controller: controller.passwordController,
                                    focusNode: controller.passwordFocusNode,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffffffff),
                                      helperText: ' ',
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: 'modify_newpassword_hint'.tr,
                                      contentPadding: EdgeInsets.only(
                                          left: 6,
                                          right: 0,
                                          top: 16,
                                          bottom: 0),
                                      hintStyle: TextStyle(
                                          fontFamily: 'PingFang SC',
                                          fontSize: 14,
                                          color: const Color(0xff707070),
                                          fontWeight: FontWeight.w500,
                                          height: 0.7),
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 0, 0, 0),
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.isNewPasswordDisplay
                                                    .value =
                                                !controller
                                                    .isNewPasswordDisplay.value;
                                          },
                                          child: Icon(
                                            controller
                                                    .isNewPasswordDisplay.value
                                                ? Icons.visibility_rounded
                                                : Icons.visibility_off_rounded,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: controller.passwordValidator,
                                    obscureText:
                                        controller.isNewPasswordDisplay.value,
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 15,
                                      color: const Color(0xff5d5d5d),
                                    ),
                                  )),
                            ),],),

                            //box3
                            Stack(children: <Widget>[
                            Pinned.fromPins(
                              Pin(size: 346.0, start: 17.0),
                              Pin(size: 50.0, start: 245.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(8.0),
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
                                Pin(size: 330.0, start: 25.0),
                                Pin(size: 70.0, start: 247.0),
                                child: Obx(
                                  () => TextFormField(
                                    key: controller.formConfirmPasswordFieldKey,
                                    controller:
                                        controller.confirmPasswordController,
                                    focusNode:
                                        controller.confirmPasswordFocusNode,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffffffff),
                                      helperText: ' ',
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText:
                                          'modify_confirmnewpassword_hint'.tr,
                                      contentPadding: EdgeInsets.only(
                                          left: 6,
                                          right: 0,
                                          top: 16,
                                          bottom: 0),
                                      hintStyle: TextStyle(
                                          fontFamily: 'PingFang SC',
                                          fontSize: 14,
                                          color: const Color(0xff707070),
                                          fontWeight: FontWeight.w500,
                                          height: 0.7),
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 0, 0, 0),
                                        child: GestureDetector(
                                          onTap: () {
                                            controller
                                                    .isNewPasswordConfirmDisplay
                                                    .value =
                                                !controller
                                                    .isNewPasswordConfirmDisplay
                                                    .value;
                                          },
                                          child: Icon(
                                            controller
                                                    .isNewPasswordConfirmDisplay
                                                    .value
                                                ? Icons.visibility_rounded
                                                : Icons.visibility_off_rounded,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator:
                                        controller.confirmPasswordValidator,
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 15,
                                      color: const Color(0xff5d5d5d),
                                    ),
                                    obscureText: controller
                                        .isNewPasswordConfirmDisplay.value,
                                  ),
                                )),],),

                            //button
                            Pinned.fromPins(
                              Pin(size: 334.0, start: 23.0),
                              Pin(size: 43.0, start: 380.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff15056d),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 200.0, start: 90.0),
                              Pin(size: 21.0, start: 390.0),
                              child: InkWell(
                                onTap: () async {
                                  {
                                    LoadingOverlay.show(
                                        message: 'Loading...'.tr);
                                    try {
                                      await controller.editLoginPwd();
                                      //controller.signupFormKey.currentState!.save();
                                      log('response signup');
                                      LoadingOverlay.hide();
                                      //Get.offAllNamed(AppRoutes.EditPassword);
                                    } catch (err, _) {
                                      printError(info: err.toString());
                                      LoadingOverlay.hide();
                                      // Get.snackbar(
                                      //   "error".tr,
                                      //   err.toString(),
                                      //   snackPosition: SnackPosition.TOP,
                                      //   backgroundColor:
                                      //       Colors.transparent.withOpacity(.75),
                                      //   colorText: Colors.white,
                                      //   shouldIconPulse: true,
                                      //   barBlur: 20,
                                      // );
                                    } finally {}
                                  }
                                },
                                child: Text(
                                  'confirmed'.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
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

  @override
  bool showTitleBar() => false;

  @override
  bool useLoadSir() => false;
}

const String _svg_ehpyic =
    '<svg viewBox="33.0 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
