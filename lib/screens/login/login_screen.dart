import 'dart:developer';

import 'package:GCPay/http/apiservice/gcpay_api.dart';
import 'package:adobe_xd/adobe_xd.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:GCPay/controllers/login_controller.dart';
import 'package:GCPay/routes/app_routes.dart';
import 'package:GCPay/widget/loading_overlay.dart';
import 'package:get/get.dart';
import 'package:GCPay/services/lang/localization_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:group_button/group_button.dart';
import 'package:uuid/uuid.dart';

import '../../GCPay/user_center_page/gc_startscreen_page.dart';
import '../../base/pageWidget/base_stateful_widget.dart';
import '../../constant/common_constant.dart';
import '../../constant/http_url.dart';
import '../../res/colors.dart';
import '../../services/cache_service.dart';
import '../../services/lang/storage_prefs.dart';
import '../../utils/create_image.dart';
import '../../utils/event_bus.dart';
import '../../utils/web_socket_utility.dart';
import '../../widget/flat_widget.dart';
import '../../widget/webview_page.dart';

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

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  void openLanguageDialog() {
    SmartDialog.show(
      backDismiss: false,
      clickMaskDismiss: false,
      builder: (_) {
        return Container(
          height: 200,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          alignment: Alignment.topCenter,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.close_rounded),
                    tooltip: '',
                    onPressed: () {
                      SmartDialog.dismiss();
                    },
                  ),
                ),
                InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/language_english.png'),
                        Text('English'.tr, textScaleFactor: 2),
                      ],
                    ),
                    onTap: () {
                      var locale = Locale('en', 'US');
                      Get.updateLocale(locale);
                      final prefs = StoragePrefs();
                      prefs.language = 'English';
                      CacheService cacheservice = Get.find<CacheService>();
                      cacheservice.saveLanguage('2');
                    }),
                Divider(
                  color: Colors.grey,
                ),
                InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/language_chinese.png'),
                        Text('Chinese'.tr, textScaleFactor: 2),
                      ],
                    ),
                    onTap: () {
                      var locale = Locale('zh', 'CH');
                      Get.updateLocale(locale);
                      final prefs = StoragePrefs();
                      prefs.language = 'Chinese';
                      CacheService cacheservice = Get.find<CacheService>();
                      cacheservice.saveLanguage('1');
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(Get.context!);
    final ColorScheme colorScheme = themeData.colorScheme;
    final backgroundColor = themeData.colorScheme.surfaceVariant;
    final foregroundColor = themeData.colorScheme.surface;
    final primaryTextTheme = themeData.textTheme;
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
      appBar: AppBar(
        title: Text('login'.tr),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            color: colorScheme.onPrimary,
            icon: const Icon(Icons.language),
            onPressed: () async {
              openLanguageDialog();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.loginFormKey,
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
                    height: 30,
                  ),
                  Container(
                    child: TextFormField(
                      // key: const Key('username'),
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        helperText: ' ',
                        icon: FaIcon(FontAwesomeIcons.user),
                        hintText: 'login_phonenum_hint'.tr,
                        hintStyle: TextStyle(fontSize: 14),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: controller.validator,
                    ),
                  ),
                  Container(
                    height: 0,
                  ),
                  Container(
                    child: Obx(() => TextFormField(
                          // key: const Key('password'),
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            helperText: ' ',
                            icon: FaIcon(FontAwesomeIcons.lock),
                            hintText: 'login_password_hint'.tr,
                            hintStyle: TextStyle(fontSize: 14),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: GestureDetector(
                                onTap: () {
                                  controller.isLoginPasswordDisplay.value =
                                      !controller.isLoginPasswordDisplay.value;
                                },
                                child: Icon(
                                  controller.isLoginPasswordDisplay.value
                                      ? Icons.visibility_rounded
                                      : Icons.visibility_off_rounded,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                          validator: controller.validator,
                          obscureText: controller.isLoginPasswordDisplay.value,
                        )),
                  ),
                  Container(
                    height: 0,
                  ),
                  Container(
                     child: Stack(
                        children: <Widget>[
                      TextFormField(
                                key: controller.formTrc20FieldKey,
                                controller: controller.verifycodeController,
                                focusNode: controller.trc20FocusNode,
                                decoration: InputDecoration(
                                  helperText: ' ',
                                  icon: FaIcon(FontAwesomeIcons.shieldHalved),
                                  hintText: 'login_verifycode_hint'.tr,
                                  hintStyle: TextStyle(fontSize: 14),
                                ),
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validator: controller.verifyCodeValidator,
                                // obscureText: true,
                              ),
                      Align(
                            alignment: Alignment(1.0, -2.2),
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
                                        if (controller.getButtonEnable()) {
                                          controller.strdeviceid.value =
                                              Uuid().v1();
                                          log(controller.strdeviceid.value);
                                          controller.buttonClickListen();
                                        }
                                      },
                                      childx: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                          Obx(() => controller.strdeviceid.value.length > 0
                                              ? Container(
                                            height: 28,
                                            child: Image.network(
                                              HttpUrl.BASE_GCPAY_URL +
                                                  "/api/user/captcha?deviceId=" + controller.strdeviceid.value,
                                              fit: BoxFit.cover,
                                              key: UniqueKey(),
                                            ),
                                          )
                                              : Container(
                                            height: 40,
                                          )),
                                          Container(
                                            width: 5,
                                          ),
                                          controller.isButtonEnable.value
                                              ? const Icon(
                                            Icons.refresh,
                                            color: Colors.grey,
                                          )
                                              : Text(
                                            controller.buttonText.value,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ))),
                              ),

                          ),
                        ],
                      ),
                   ),
                  Container(
                    height: 5,
                  ),
                  Container(
                    height: 35,
                  ),
                  SizedBox(
                    width: 250, // <-- Your width
                    height: 50, // <-- Your height
                    child: ElevatedButton(
                        onPressed: () async {
                          if (controller.loginFormKey.currentState!
                              .validate()) {
                            LoadingOverlay.show(message: 'loginmessage'.tr);
                            try {
                              var loginresult = await controller.login();
                              if(loginresult == true)
                                {
                                  Get.back(closeOverlays: true);
                                  Get.offNamed(AppRoutes.MainPage);
                                  eventBus.fire(EventFn({
                                    'eventbus':'login',
                                  }));
                                  WebSocketUtility().sentSubscription();
                                }
                              else
                                {
                                  LoadingOverlay.hide();
                                }

                              //Get.offNamed(AppRoutes.MainPage);
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

                            controller.loginFormKey.currentState!.save();
                          }
                        },
                        child: Text(
                          'login'.tr,
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  Container(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            // TODO: We need implement the forgetpassword page.
                            CacheService cacheservice =
                                Get.find<CacheService>();
                            String? getLocal = cacheservice.loadLanguage();
                            String strCSUrl = cacheservice.rxServiceLink.value;
                            Get.to(WebViewPage(
                              strUrl: strCSUrl,
                              strTitle: 'customerService'.tr,
                              blNavigation: false,
                            ));
                          },
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'forgetpassword'.tr,
                                  style: primaryTextTheme.labelLarge),
                              TextSpan(
                                  text: 'contactcustomer'.tr,
                                  style: TextStyle(color: colorScheme.primary)),
                            ]),
                          )),
                      Container(
                        height: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.SignupPage);
                          },
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'noaccount'.tr,
                                  style: primaryTextTheme.labelLarge),
                              TextSpan(
                                  text: 'createaccount'.tr,
                                  style: TextStyle(color: colorScheme.primary)),
                            ]),
                          )),
                      Container(
                        height: 5,
                      ),
                      Container(
                        height: 35,
                      ),
                      Container(
                        height: 10,
                        width: 10,
                      ),
                      Container(
                          child: InkWell(
                            child:  Obx(() =>  Text(
                              'version'.tr+controller.rxStrVersion.value,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 15,
                                color: const Color(0xff5d5d5d),
                              ),
                            )),
                            onTap: () {
                              controller.rxIntVersionClick.value++;
                              if(controller.rxIntVersionClick.value>9)
                                {
                                  showSheetWithoutList();
                                  controller.rxIntVersionClick.value = 0;
                                }
                            },
                          ),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
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
            color: Color(0xff15056d),
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
                      }, child: Text('cancel'.tr,style: TextStyle(fontSize: 16,color: Color(0xfff9f9f9)),)),
                      Text(
                        'version'.tr+controller.rxStrVersion.value,
                        style: TextStyle(fontSize: 18,color: Colors.white),
                      ),
                      TextButton(onPressed: () {
                            Get.back();
                      }, child: Text('confirm'.tr,style: TextStyle(fontSize: 16,color: Color(0xfff9f9f9)),)),
                    ]),
              ),
            ],
          ),
        );
      },
      bodyBuilder: (context, offset) {
        return SliverChildListDelegate(
          [ Column(
            children: [Container(
              decoration: BoxDecoration(
                // color: const Color(0xffb77373),
              ),
              child: SizedBox(
                height: 250.0,
                 width: 300.0,
                 child: GroupButton(
                    options: GroupButtonOptions(
                     direction: Axis.vertical,
                     spacing: 30,
                     buttonHeight: 50.0,
                     buttonWidth: 300.0,
                   ),
                   isRadio: true,
                   buttons:
                   ["Release Server",
                     "Test Server"],
                  )
                ),
            ),
            ],
          ),
          ]
        );
      },
      anchors: [.2, 0.6, 0.601],
    );
  }

}
