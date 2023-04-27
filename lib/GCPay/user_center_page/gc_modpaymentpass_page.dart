import 'dart:developer';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:GCPay/controllers/editpassword_controller.dart';

import '../../base/pageWidget/base_stateful_widget.dart';
import '../../controllers/editpassword_controller.dart';
import '../../routes/app_routes.dart';
import '../../services/cache_service.dart';
import '../../services/lang/localization_service.dart';
import '../../widget/Loading_overlay.dart';
import '../../widget/webview_page.dart';

class ModPaymentPassPage extends BaseStatefulWidget<EditPwController> {
  const ModPaymentPassPage({Key? key}) : super(key: key);
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
                    //title
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
                                  width: 270.0,
                                  height: 28.0,
                                  child: Text(
                                    'paymentpass'.tr,
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
                                    keyboardType: TextInputType.number,
                                    controller:
                                        controller.oldpasswordController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffffffff),
                                      helperText: ' ',
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: 'modify_6digitaloldpassword_hint'.tr,
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
                                          height: 0.8),
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 0, 0, 0),
                                        child: GestureDetector(
                                          onTap: () {
                                            controller
                                                    .isOldPaymentPasswordDisplay
                                                    .value =
                                                !controller
                                                    .isOldPaymentPasswordDisplay
                                                    .value;
                                          },
                                          child: Icon(
                                            controller
                                                    .isOldPaymentPasswordDisplay
                                                    .value
                                                ? Icons.visibility_rounded
                                                : Icons.visibility_off_rounded,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                    focusNode: controller.oldpasswordFocusNode,
                                    validator: controller.paypasswordValidator,
                                    obscureText: controller
                                        .isOldPaymentPasswordDisplay.value,
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 15,
                                      color: const Color(0xff5d5d5d),
                                    ),
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
                                    keyboardType: TextInputType.number,
                                    focusNode: controller.passwordFocusNode,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffffffff),
                                      helperText: ' ',
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: 'modify_6digitalnewpassword_hint'.tr,
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
                                                    .isNewPaymentPasswordDisplay
                                                    .value =
                                                !controller
                                                    .isNewPaymentPasswordDisplay
                                                    .value;
                                          },
                                          child: Icon(
                                            controller
                                                    .isNewPaymentPasswordDisplay
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
                                    validator: controller.paypasswordValidator,
                                    obscureText: controller
                                        .isNewPaymentPasswordDisplay.value,
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
                              child: Obx(() => TextFormField(
                                    key: controller.formConfirmPasswordFieldKey,
                                    controller:
                                        controller.confirmPasswordController,
                                    keyboardType: TextInputType.number,
                                    focusNode:
                                        controller.confirmPasswordFocusNode,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffffffff),
                                      helperText: ' ',
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText:
                                          'modify_6digitalconfirmnewpassword_hint'.tr,
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
                                                    .isNewPaymentPasswordConfirmDisplay
                                                    .value =
                                                !controller
                                                    .isNewPaymentPasswordConfirmDisplay
                                                    .value;
                                          },
                                          child: Icon(
                                            controller
                                                    .isNewPaymentPasswordConfirmDisplay
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
                                        controller.confirmpayPasswordValidator,
                                    obscureText: controller
                                        .isNewPaymentPasswordConfirmDisplay
                                        .value,
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 15,
                                      color: const Color(0xff5d5d5d),
                                    ),
                                  )),
                            ),],),
                            //buttons
                            Pinned.fromPins(
                              Pin(size: 334.0, start: 23.0),
                              Pin(size: 43.0, start: 380.0),
                              child: InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff15056d),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                onTap: () async {
                                  {
                                    LoadingOverlay.show(
                                        message: 'Loading...'.tr);
                                    try {
                                      await controller.editPayPwd();
                                      //controller.signupFormKey.currentState!.save();
                                      log('response signup');
                                      LoadingOverlay.hide();
                                      //Get.offAllNamed(AppRoutes.ModPaymentPassPage);
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
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 200.0, start: 90.0),
                              Pin(size: 21.0, start: 390.0),
                              child: InkWell(
                                child: Text(
                                  'confirmed'.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                onTap: () async {
                                  {
                                    LoadingOverlay.show(
                                        message: 'Loading...'.tr);
                                    try {
                                      await controller.editPayPwd();
                                      //controller.signupFormKey.currentState!.save();
                                      log('response signup');
                                      LoadingOverlay.hide();
                                      //Get.offAllNamed(AppRoutes.ModPaymentPassPage);
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

  @override
  bool showTitleBar() => false;

  @override
  bool useLoadSir() => false;
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

const String _svg_xdf1v1 =
    '<svg viewBox="3.0 1.0 16.0 16.0" ><path transform="translate(3.0, 1.0)" d="M 16 15.99999904632568 L 15.99876880645752 15.99999904632568 L 7.999802112579346 15.99999904632568 L 7.999802112579346 14.76931571960449 L 16 14.76931571960449 L 16 15.9987678527832 L 16 15.99999904632568 Z M 0.3674905002117157 15.80252933502197 C 0.257478266954422 15.80254173278809 0.1538417637348175 15.75300216674805 0.0831424668431282 15.66662406921387 C 0.0130462720990181 15.5810079574585 -0.0145737174898386 15.4695463180542 0.007359803654253483 15.36084175109863 L 0.8968860507011414 10.91441535949707 L 9.87855339050293 1.931874871253967 L 13.87089729309082 5.924108505249023 L 4.888122081756592 14.90556621551514 L 0.4415992200374603 15.79507064819336 C 0.4171055257320404 15.80001735687256 0.3921810686588287 15.80252933502197 0.3674905002117157 15.80252933502197 Z M 9.87855339050293 3.673208713531494 L 9.878540992736816 3.673220872879028 L 2.030117988586426 11.52035427093506 L 1.467379093170166 14.33507537841797 L 4.282181262969971 13.77236175537109 L 12.12950897216797 5.924108505249023 L 9.87855339050293 3.673220872879028 L 9.87855339050293 3.673208713531494 Z M 16 13.5386323928833 L 15.99876880645752 13.5386323928833 L 11.07714176177979 13.5386323928833 L 11.07714176177979 12.30793476104736 L 16 12.30794715881348 L 16 13.53740119934082 L 16 13.5386323928833 Z M 14.93212413787842 4.861798763275146 L 14.93125152587891 4.860937118530273 L 10.93978118896484 0.8706730008125305 L 11.81047534942627 0 L 15.80281925201416 3.992245674133301 L 14.93299865722656 4.860937118530273 L 14.93212413787842 4.861798763275146 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-opacity="0.9" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ehpyic =
    '<svg viewBox="33.0 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
