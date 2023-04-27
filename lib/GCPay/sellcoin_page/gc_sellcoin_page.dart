import 'dart:developer';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';

import '../../3rdparty/button_multiselect.dart';
import '../../3rdparty/utils/button_multiselect_item.dart';
import '../../3rdparty/utils/button_selected_style.dart';
import '../../3rdparty/utils/button_size.dart';
import '../../base/controller/base_controller.dart';
import '../../http/apiservice/gcpay_api.dart';
import '../../services/cache_service.dart';
import '../../widget/paypass/flutter_verification_code.dart';
import '../../widget/paypass/onscreen_num_keyboard.dart';
import '../../widget/paypass/pin_input_controller.dart';
import '../../widget/paypass/pin_plus_keyboard_package.dart';
import '../Model/PendingOrders_Data_entity.dart';
import '../home_page/Model/HomePage_Record_entity.dart';
import '../home_page/Model/UserBalance_Amount_entity.dart';

class PaymentData {
  int paymentType;
  int paymentid;
  String? icon;
  String? name;
  String? qrCode;
  String? bankName;
  String? bankCard;
  PaymentData(this.paymentType,this.paymentid, this.icon,this.name,this.qrCode,this.bankName,this.bankCard);
}

enum SplitMode {
  notsplit,
  split,
}


final List<bool> isSelected = <bool>[
  splitMode == SplitMode.notsplit,
  splitMode == SplitMode.split,
];

SplitMode splitMode = SplitMode.notsplit;

class SellCoinPage extends BaseStatefulWidget<SellCoinController> {
  SellCoinPage({Key? key}) : super(key: key);

  void openPayVerifyDialog() async {
    PinInputController pinInputController = PinInputController(length: 6);
    Size size = MediaQuery.of(Get.context!).size;
    locationDialog({
      required AlignmentGeometry alignment,
      double width = double.infinity,
      double height = double.infinity,
    }) async {
      await SmartDialog.show(
        alignment: alignment,
        builder: (_) {
          return Container(
            height: 600,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            alignment: Alignment.topCenter,
            child: Center(
                child: Container(
                    width: size.width,
                    height: size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PinPlusKeyBoardPackage(
                          spacing: 80,
                          keyboardFontSize:28,
                          btnHasBorder:false,
                          extraInput: '',
                          pinInputController: pinInputController,
                          onSubmit: () {
                            /// ignore: avoid_print
                            print("Pay Code Password is : " + pinInputController.text);
                            controller.sellOrderConfirm(pinInputController.text);
                          }, keyboardFontFamily: 'Helvetica Neue',
                        ),
                      ],
                    ))),
          );
        },
      );
      await Future.delayed(Duration(milliseconds: 100));
    }

    //bottom
    var resDialog = await locationDialog(height: 70, alignment: Alignment.bottomCenter);
    pinInputController.dispose();
  }


  @override
  Widget buildContent(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final themeData = Theme.of(context);
    final backgroundColor = themeData.colorScheme.surfaceVariant;
    final foregroundColor = themeData.colorScheme.surface;
    final primaryTextTheme = themeData.textTheme;
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    //statusBar height
    statusBarHeight +
        //pinned SliverAppBar height in header
        kToolbarHeight;
    return Scaffold(
      resizeToAvoidBottomInset : false,
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
                    children: <Widget> [
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
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                    const AssetImage('assets/images/gcpay.png'),
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
                                    'sellcoins'.tr,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 380.0, middle: 0.5),
                      Pin(start: 44.0, end: 10.0),
                      child: SizedBox(
                        width: 425.0,
                        height: 700.0,
                        child: Stack(
                          children: <Widget>[
                            /*Bubbles*/
                            Pinned.fromPins(
                              Pin(start: -120.0, end: 16.0),
                              Pin(size: 506.0, end: -100.0),
                              child: Stack(
                                children: <Widget>[
                                  Pinned.fromPins(
                                    Pin(size: 435.0, start: 0.0),
                                    Pin(start: 71.0, end: 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0x0c4486d5),
                                        borderRadius:
                                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 279.0,
                                      height: 279.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0x0c4486d5),
                                        borderRadius:
                                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //box1
                            Pinned.fromPins(
                              Pin(start: 150.0, end: 90.0),
                              Pin(size: 40.0, start: 20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      width: 2.0, color: const Color(0xff1d4f8b)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x29000000),
                                      offset: Offset(0, 2),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: TextFormField(
                                    controller: controller.sellAmountController,
                                    decoration: InputDecoration(
                                      hintText: 'enteramount'.tr,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontFamily: 'PingFang SC',
                                        fontSize: 17,
                                        color: const Color(0xff707070),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      labelStyle: TextStyle(
                                        fontFamily: 'PingFang SC',
                                        fontSize: 29,
                                        color: const Color(0xff707070),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      contentPadding:
                                      EdgeInsets.fromLTRB(10.0, 9.0, 10.0, 9.0),
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.singleLineFormatter
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 141.0, start: 240.0),
                              Pin(size: 40.0, start: 20.0),
                              child: Container(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'GC',
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 19,
                                      color: const Color(0xff707070),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 120.0, middle: 0.1),
                              Pin(size: 67.0, start: 0.0),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    controller.gcBalance.value,
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 24,
                                      color: const Color(0xe05d5d5d),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 120.0, middle: 0.1),
                              Pin(size: 20.0, start: 50.0),
                              child: Text(
                                'availablequantity'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 10,
                                  color: const Color(0xff6e6e6e),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 221.0, middle: 0.5),
                              Pin(size: 21.0, start: 100.0),
                              child: Stack(
                                children: <Widget>[
                                  Pinned.fromPins(
                                    Pin(start: 0.0, end: 0.0),
                                    Pin(size: 24.0, middle: 0.5),
                                    child: Text(
                                      'choosepay'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 18,
                                        color: const Color(0xff1d4f8b),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 390.0, middle: 0.5),
                              Pin(size: 120.0, start: 160.0),
                              child: Obx(() => controller.paymentmethods.value.length > 0? Container(
                                  height: 100,
                                  margin: EdgeInsets.only(left: 10,right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Color(0xffd5e0ee),
                                  ),
                                  child:ButtonMultiSelect<PaymentData>(
                                buttonSize: controller.selectedSize,
                                items: controller.paymentList,
                                twoLines: false,
                                onSelectedChanged: (data) {
                                  //your code here
                                  if(data.length >0)
                                  {
                                    for(int i=0;i<data.length;i++)
                                    {
                                      PaymentData paydata = data[i];
                                      if(paydata.paymentType==1)
                                      {
                                        controller.alipayPaymentId = paydata.paymentid;
                                      }
                                      else if(paydata.paymentType==2)
                                      {
                                        controller.weChatPaymentId = paydata.paymentid;
                                      }
                                      else if(paydata.paymentType==3)
                                      {
                                        controller.bankPaymentId = paydata.paymentid;
                                      }
                                      else if(paydata.paymentType==4)
                                      {
                                        controller.eCnyPaymentId = paydata.paymentid;
                                      }
                                      else if(paydata.paymentType==5)
                                      {
                                        controller.qqpayPaymentId = paydata.paymentid;
                                      }
                                    }
                                  }
                                },
                                selectedStyle: controller.selectedStyle,
                                primaryColor: Theme.of(context).primaryColor,
                                textColor: Colors.grey.shade900,
                              )):Container(
                                height: 100,
                                margin: EdgeInsets.only(left: 10,right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Color(0xffd5e0ee),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/payment_wallet.png',
                                      height: 50,
                                    ),
                                    Container(
                                      height: 10,
                                    ),
                                    Text(
                                      'nopaymentaddpayment'.tr,
                                      style: TextStyle(
                                        fontFamily:
                                        'Helvetica Neue',
                                        fontSize: 14,
                                        color: const Color(
                                            0xff999999),
                                        fontWeight:
                                        FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),),
                            ),
                            Pinned.fromPins(
                              Pin(size: 115.0, start: 31.0),
                              Pin(size: 20.0, start: 350.0),
                              child: Text(
                                'whethertosplit'.tr,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 14,
                                  color: const Color(0xff5d5d5d),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.7, -0.05),
                                child: Obx(() => FlutterToggleTab(
                                  // width in percent
                                  width: 48,
                                  borderRadius: 20,
                                  height: 47,
                                  selectedIndex:
                                  controller._tabTextIndexSelected.value,
                                  selectedBackgroundColors: [const Color(0xff1d4f8b)],
                                  selectedTextStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                  unSelectedTextStyle: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  labels: controller._listTextTabToggle,
                                  selectedLabelIndex: (index) {
                                    controller._tabTextIndexSelected.value = index;
                                    controller.intSplitType = index;
                                    // controller.getExchangeInfo(index);
                                  },
                                  isScroll: true,
                                ))),
                            Pinned.fromPins(
                              Pin(start: 30.0, end: 30.0),
                              Pin(size: 43.0, start: 430),
                              child:InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff15056d),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'sell'.tr,
                                      style: TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 18,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  //controller.sellOrderConfirm();
                                  openPayVerifyDialog();
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
  bool useLoadSir() => false;

  @override
  bool showTitleBar() => false;
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

class SellCoinController extends BaseController {
  final GCPayApi gcpayApi;
  final CacheService cacheservice;
  SellCoinController(this.cacheservice, this.gcpayApi);
  RxList<PendingOrdersDataEntity> rxSellOrderList = <PendingOrdersDataEntity>[].obs;

  ButtonSize selectedSize = ButtonSize.medium;
  ButtonSelectedStyle selectedStyle = ButtonSelectedStyle.both;

  RxString gcBalance = ''.obs;

  bool isSwitched = true;
  var _listTextTabToggle = ["notsplit".tr,"split".tr];
  RxInt _tabTextIndexSelected = 0.obs;
  int intSplitType = 0;

  final sellAmountController = TextEditingController();
  RxList<UmsPaymentSell> paymentmethods = <UmsPaymentSell>[].obs;
  List<ButtonMultiSelectItem<PaymentData>> paymentList = <ButtonMultiSelectItem<PaymentData>>[].obs;
  int alipayPaymentId = 0;
  int bankPaymentId = 0;
  int weChatPaymentId = 0;
  int eCnyPaymentId = 0;
  int qqpayPaymentId = 0;
  RxBool isPasswordDisplay = false.obs;

  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    getPaymentManageInfo();
    getGCBalanceInfo();
  }

  @override
  void onClose() {
    sellAmountController.dispose();
    super.onClose();
  }

  Future<void> getPaymentManageInfo() async {
    try {
      var response = await gcpayApi.getUmsPayment();
      if (response.code == 400) {}
      if (response.code == 200) {

        paymentmethods.value = response.data!;
        setPaymentMultiSelectItem();

      } else {
      }
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  void setPaymentMultiSelectItem()
  {
    for(int i = 0;i<paymentmethods.value.length;i++)
    {
      UmsPaymentSell paymentEntity = paymentmethods.value[i];
      if(paymentEntity.paymentType == 1)
      {
        ButtonMultiSelectItem<PaymentData> _itemTest1 =
        ButtonMultiSelectItem<PaymentData>(
          label: 'alipay'.tr,
          value: PaymentData(paymentEntity.paymentType!,paymentEntity.id!,"assets/images/alipay.png",'alipay',paymentEntity.qrCode!=null?paymentEntity.qrCode:'','',''),
          icon: Image(
            image: AssetImage("assets/images/alipay.png"),
          ),
        );
        paymentList.add(_itemTest1);
      }
      else if(paymentEntity.paymentType == 2)
      {
        ButtonMultiSelectItem<PaymentData> _itemTest2 =
        ButtonMultiSelectItem<PaymentData>(
          label: 'wechat'.tr,
          value: PaymentData(paymentEntity.paymentType!,paymentEntity.id!,"assets/images/wechat.png",'wechat',paymentEntity.qrCode!=null?paymentEntity.qrCode:'','',''),
          icon: Image(
            image: AssetImage("assets/images/wechat.png"),
          ),
        );
        paymentList.add(_itemTest2);
      }
      else if(paymentEntity.paymentType == 3)
      {
        ButtonMultiSelectItem<PaymentData> _itemTest3 =
        ButtonMultiSelectItem<PaymentData>(
          label: 'bank'.tr,
          value: PaymentData(paymentEntity.paymentType!,paymentEntity.id!,"assets/images/union_pay.png",'bank',paymentEntity.qrCode!=null?paymentEntity.qrCode:'',paymentEntity.bankCard,paymentEntity.bankCard),
          icon: Image(
            image: AssetImage("assets/images/union_pay.png"),
          ),
        );
        paymentList.add(_itemTest3);
      }
      else if(paymentEntity.paymentType == 4)
      {
        ButtonMultiSelectItem<PaymentData> _itemTest4 =
        ButtonMultiSelectItem<PaymentData>(
          label: 'ECNY'.tr,
          value: PaymentData(paymentEntity.paymentType!,paymentEntity.id!,"assets/images/ECNY.png",'ecny',paymentEntity.qrCode!=null?paymentEntity.qrCode:'','',''),
          icon: Image(
            image: AssetImage("assets/images/ECNY.png"),
          ),
        );
        paymentList.add(_itemTest4);
      }
      else if(paymentEntity.paymentType == 5)
      {
        ButtonMultiSelectItem<PaymentData> _itemTest5 =
        ButtonMultiSelectItem<PaymentData>(
          label: 'qqpay'.tr,
          value: PaymentData(paymentEntity.paymentType!,paymentEntity.id!,"assets/images/qqpay.png",'ecny',paymentEntity.qrCode!=null?paymentEntity.qrCode:'','',''),
          icon: Image(
            image: AssetImage("assets/images/qqpay.png"),
          ),
        );
        paymentList.add(_itemTest5);
      }
    }
  }

  Future<void> sellOrderConfirm(String strPayPassword) async {
    try {
      if(cacheservice.rxAuthFlag.value ==0)
      {
        showToast('notverifyfirstly'.tr);
        return;
      }
      else if(cacheservice.rxAuthFlag.value ==1)
      {
        showToast('verifyisreview'.tr);
        return;
      }

      if(paymentmethods.length<=0)
      {
        showToast('pleaseaddpaymentmethods'.tr);
        return;
      }

      // if(paymentPasswordController.text.length <=0)
      //   {
      //     showToast('pay_code_hint'.tr);
      //     return;
      //   }

      Map<String, dynamic> data = <String, dynamic>{
        'gcAmounTotal': sellAmountController.text,
        'sellType': intSplitType+1,
        'payPassword':strPayPassword,
      };
      if(alipayPaymentId!=0)
        {
          data['alipayPaymentId'] = alipayPaymentId;
        }
      if(bankPaymentId!=0)
      {
        data['bankPaymentId'] = bankPaymentId;
      }
      if(weChatPaymentId!=0)
      {
        data['weChatPaymentId'] = weChatPaymentId;
      }
      if(eCnyPaymentId!=0)
      {
        data['ecnyPaymentId'] = eCnyPaymentId;
      }
      if(qqpayPaymentId!=0)
      {
        data['qqPaymentId'] = qqpayPaymentId;
      }
      if(alipayPaymentId ==0&&bankPaymentId ==0&&weChatPaymentId ==0&&eCnyPaymentId ==0&&qqpayPaymentId ==0)
        {
          showToast('selectpaymentmethod'.tr);
          return;
        }
      if(sellAmountController.text.length<=0)
        {
          showToast('enteramount'.tr);
          return;
        }
      var response = await gcpayApi.sellorderConfirm(data);
      showToast(response.msg);
      if (response.code == 401) {
        // Get.toNamed(Routes.LOGIN);
      }
      if (response.code == 200) {
        //return json.decode(response.body);
        Future.delayed(Duration(seconds: 1), () {
          SmartDialog.dismiss();
        });
        Future.delayed(Duration(seconds: 2), () {
          Get.back();
        });


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
  }

  Future<void> getGCBalanceInfo() async {
    try {
      String strAlias = '';
      strAlias = cacheservice.loadPushAlias()!;
      Map<String, dynamic> data = <String, dynamic>{'alias': strAlias};
      var response = await gcpayApi.umsUserBalance(data);
      if (response.code == 401) {}
      if (response.code == 200) {
        //return json.decode(response.body);
        UserBalanceAmountEntity balanceEntity = response.data!;
        gcBalance.value = balanceEntity.gcBalance!.toStringAsFixed(0);
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
  }
}

class SellCoinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => SellCoinController(Get.put(CacheService()), Get.put(GCPayApi())));
  }
}

const String _svg_ehpyic =
    '<svg viewBox="33.0 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
