import 'dart:developer';

import 'package:GCPay/3rdparty/button_multiselect.dart';
import 'package:GCPay/3rdparty/utils/button_multiselect_item.dart';
import 'package:GCPay/GCPay/Buyernotice.dart';
import 'package:GCPay/GCPay/sellcoin_page/gc_sellcoin_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:GCPay/GCPay/siteinfo_page/Model/SiteInfo_Data_entity.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';
import 'package:GCPay/res/style.dart';
import 'package:GCPay/routes/app_routes.dart';
import 'package:group_button/group_button.dart';

import '../../base/controller/base_controller.dart';
import '../../constant/http_url.dart';
import '../../http/apiservice/gcpay_api.dart';
import '../../res/colors.dart';
import '../../services/cache_service.dart';
import '../home_page/Model/HomePage_Record_entity.dart';
import '../home_page/Model/PendingOrderList_Data_entity.dart';

class OrderLobbyPage extends BaseStatefulWidget<OrderLobbyController> {
  const OrderLobbyPage({Key? key}) : super(key: key);

  void PayMethodFilterDialog() {
    SmartDialog.show(
      backDismiss: false,
      clickMaskDismiss: false,
      builder: (_) {
        return Container(
          width: 380,
          height: 300,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment(0.0, -0.95),
                child: Text('filter'.tr,textAlign: TextAlign.center,style: TextStyle(
                  fontFamily: 'PingFang SC',
                  fontSize: 17,
                  color: const Color(0xff707070),
                  fontWeight: FontWeight.w500,
                ),),
              ),
              Align(
                alignment: Alignment(1.05, -1.09),
                child: IconButton(
                  icon: const Icon(Icons.close_rounded),
                  tooltip: '',
                  onPressed: () {
                    SmartDialog.dismiss();
                  },
                ),
              ),
              Pinned.fromPins(
                Pin(start: 70.0, end: 70.0),
                Pin(size: 45.0, start: 40.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(8.0),
                    border:
                        Border.all(width: 2.0, color: const Color(0xFF000000)),
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
                      controller: controller.buyAmountController,
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
                Pin(size: 90.0, start: 350.0),
                Pin(size: 40.0, start: 44.1),
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
                  Pin(size: 350.0, middle: 0.5), Pin(size: 100.0, start: 110.0),
                  child: ButtonMultiSelect(
                      items: [
                        ButtonMultiSelectItem(
                          label: 'all'.tr,
                          value: 0,
                          icon: Image(
                            image: AssetImage("assets/images/icon_wallet.png"),
                          ),
                        ),
                        ButtonMultiSelectItem(
                          label: 'alipay'.tr,
                          value: 1,
                          icon: Image(
                            image: AssetImage("assets/images/alipay.png"),
                          ),
                        ),
                        ButtonMultiSelectItem(
                          label: 'wechat'.tr,
                          value: 2,
                          icon: Image(
                            image: AssetImage("assets/images/wechat.png"),
                          ),
                        ),
                        ButtonMultiSelectItem(
                          label: 'bank'.tr,
                          value: 3,
                          icon: Image(
                            image: AssetImage("assets/images/union_pay.png"),
                          ),
                        ),
                        ButtonMultiSelectItem(
                          label: 'ECNY'.tr,
                          value: 4,
                          icon: Image(
                            image: AssetImage("assets/images/ECNY.png"),
                          ),
                        ),
                      ],
                      onSelectedChanged: (value) {
                        controller.rxFilterPayment.value = value;
                        print(value);
                      },
                      primaryColor: const Color(0xff155db2),
                      textColor: Colors.grey.shade900)),
              Pinned.fromPins(
                Pin(size: 300.0, start: 11.0),
                Pin(size: 20.0, start: 250.0),
                child: Text(
                  'selectpaymentmethod'.tr,
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 12,
                    color: const Color(0xff5d5d5d),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(110, 40), //////// HERE
                  ),
                  onPressed: () {
                    controller.pendOrderList();
                    SmartDialog.dismiss();
                  },
                  child: Text("confirmed".tr),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: SizedBox(
              width: 440,
              height: 240,
              child: Pinned.fromPins(
                Pin(size: 430.0, middle: 0.5), //435
                Pin(start: 0.0, end: 0.0),
                child: SizedBox(
                  width: 355,
                  height: 240,
                  child: Stack(
                    children: <Widget>[
                      //Header
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 240.0, start: 0),
                        child: Container(
                          color: const Color(0xff155db2),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 60.0, middle: 0.5),
                        Pin(size: 60.0, start: 40),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage(
                                  'assets/images/gcpay_logo.png'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 36, start: 26),
                        Pin(size: 36, start: 40),
                        child: SizedBox(
                          child: IconButton(
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
                      ),
                      Pinned.fromPins(
                        Pin(size: 210.0, middle: 0.20),
                        Pin(size: 20.0, start: 83.0),
                        child: Text(
                          'gcpaynote'.tr,
                          style: TextStyle(
                            fontFamily: 'inpin nanzhengbeizhanNZBZti',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xffffffff),
                          ),
                          softWrap: false,
                        ),
                      ),
                      Pinned.fromPins(Pin(size: 370.0, middle: 0.55),
                          Pin(size: 140.0, end: -10.0),
                          child: Obx(() =>
                              controller.rxNoticeContent.value.length > 0
                                  ? HtmlWidget(controller.rxNoticeContent.value)
                                  : HtmlWidget(controller
                                      .cacheservice.rxNoticeContent.value))),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: SizedBox(
            width: 440.0,
            height: 500.0,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 45,
                  width: 460,
                  decoration: BoxDecoration(
                    color: Color(0xff15056d),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 220.0, middle: 0.5),
                  Pin(size: 30.0, start: 10.0),
                  child: Text(
                    'tradeinfo'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 18,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 80.0, middle: 0.1),
                  Pin(size: 25.0, start: 60.0),
                  child: InkWell(
                    child: Text(
                      'quantity'.tr,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 16,
                        color: const Color(0xff1d4f8b),
                      ),
                    ),
                    onTap: () {
                      controller.isDescending.value =
                          !controller.isDescending.value;
                      if (controller.isDescending.value) {
                        controller.rxgcAmountUsableSort = 'desc'.obs;
                      } else {
                        controller.rxgcAmountUsableSort = 'asc'.obs;
                      }
                      controller.pendOrderList();
                    },
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 70.0, middle: 0.21),
                  Pin(size: 20.0, start: 53.0),
                  child: Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.isDescending.value =
                            !controller.isDescending.value;
                        if (controller.isDescending.value) {
                          controller.rxgcAmountUsableSort = 'desc'.obs;
                        } else {
                          controller.rxgcAmountUsableSort = 'asc'.obs;
                        }
                        controller.pendOrderList();
                      },
                      child: Icon(
                        controller.isDescending.value
                            ? Icons.arrow_drop_up_outlined
                            : Icons.arrow_drop_down_outlined,
                        size: 35,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 150.0, middle: 0.45),
                  Pin(size: 20.0, start: 60.0),
                  child: InkWell(
                    child: Text(
                      'paymethod'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 15,
                        color: const Color(0xff1d4f8b),
                      ),
                    ),
                    onTap: () => PayMethodFilterDialog(),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 70.0, middle: 0.68),
                  Pin(size: 20.0, start: 44.0),
                  child: SizedBox(
                    child: IconButton(
                      onPressed: () => PayMethodFilterDialog(),
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      iconSize: 35,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 100.0, middle: 0.956),
                  Pin(size: 25.0, start: 60.0),
                  child: PopupMenuButton(
                    child: Text(
                      'wayofsell'.tr,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 15,
                        color: const Color(0xff1d4f8b),
                      ),
                    ),
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(child: Text('all'.tr), value: 0),
                      PopupMenuItem(child: Text('notsplit'.tr), value: 1),
                      PopupMenuItem(child: Text('split'.tr), value: 2),
                    ],
                    onSelected: (int value) {
                      if (value == 0) {
                        controller.rxsellType = 0.obs;
                      } else if (value == 1) {
                        controller.rxsellType = 1.obs;
                      } else if (value == 2) {
                        controller.rxsellType = 2.obs;
                      }
                      controller.pendOrderList();
                    },
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 70.0, middle: 1.02),
                  Pin(size: 20.0, start: 44.0),
                  child: PopupMenuButton(
                    iconSize: 35,
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(child: Text('All'), value: 0),
                      PopupMenuItem(child: Text('Not Split'), value: 1),
                      PopupMenuItem(child: Text('Split'), value: 2),
                    ],
                    onSelected: (int value) {
                      if (value == 0) {
                        controller.rxsellType = 0.obs;
                      } else if (value == 1) {
                        controller.rxsellType = 1.obs;
                      } else if (value == 2) {
                        controller.rxsellType = 2.obs;
                      }
                      controller.pendOrderList();
                    },
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 380.0, middle: 0.5),
                  Pin(start: 100.0, end: 0.0),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 50),
                            children: controller.tradFloorList.asMap().entries.map((entry) {
                                    var idx = entry.key; //index
                                    var itemData = entry.value;
                                    return SizedBox(
                                        width: 355.0,
                                        height: 63.0,
                                        child: Stack(
                                          children: <Widget>[
                                            Pinned.fromPins(
                                              Pin(size: 340.0, middle: 0.51),
                                              Pin(size: 50.0, end: 500.0),
                                              child: InkWell(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffffffff),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                        width: 1.0,
                                                        color: const Color(
                                                            0xffd4d4d4)),
                                                  ),
                                                ),
                                                onTap: () {
                                                  controller.cacheservice
                                                          .orderEntity =
                                                      controller.tradFloorList
                                                          .value[idx];
                                                  Get.toNamed(AppRoutes.BuyPage);
                                                },
                                              ),
                                            ),
                                            Pinned.fromPins(
                                              Pin(size: 120.0, middle: 0.076),
                                              Pin(size: 50.0, end: 13.0),
                                              child: InkWell(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffd3e0f0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                onTap: () {
                                                  controller.cacheservice
                                                          .orderEntity =
                                                      controller.tradFloorList
                                                          .value[idx];
                                                  Get.toNamed(AppRoutes.BuyPage);
                                                },
                                              ),
                                            ),
                                            Pinned.fromPins(
                                              Pin(size: 28.0, middle: 0.072),
                                              Pin(size: 28.0, end: 24.0),
                                              child: InkWell(
                                                child: itemData.headPic == null
                                                    ? Container(
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: const AssetImage(
                                                                'assets/images/home_profile.png'),
                                                            fit: BoxFit.fill,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50.0),
                                                        ),
                                                      )
                                                    : CachedNetworkImage(
                                                        height: 100,
                                                        width: 100,
                                                        imageUrl: HttpUrl
                                                                .BASE_GCPAY_URL +
                                                            itemData.headPic!,
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Container(
                                                          height: 100,
                                                          width: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius
                                                                        .circular(
                                                                            50)),
                                                            image:
                                                                DecorationImage(
                                                              image:
                                                                  imageProvider,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        placeholder: (context,
                                                                url) =>
                                                            CircularProgressIndicator(),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                onTap: () {
                                                  controller.cacheservice
                                                          .orderEntity =
                                                      controller.tradFloorList
                                                          .value[idx];
                                                  Get.toNamed(AppRoutes.BuyPage);
                                                },
                                              ),
                                            ),
                                            Pinned.fromPins(
                                              Pin(size: 1.0, middle: 0.155),
                                              Pin(size: 25.0, end: 24.6),
                                              child: SvgPicture.string(
                                                _svg_wua465,
                                                allowDrawingOutsideViewBox: true,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Pinned.fromPins(
                                              Pin(size: 300.0, middle: 0.79),
                                              Pin(size: 30.0, end: 15.2),
                                              child: InkWell(
                                                child: Text(
                                                  itemData.gcAmountUsable
                                                          .toString() +
                                                      ' GC',
                                                  style: TextStyle(
                                                    fontFamily: 'Helvetica Neue',
                                                    fontSize: 12,
                                                    color:
                                                        const Color(0xff5d5d5d),
                                                  ),
                                                  softWrap: false,
                                                ),
                                                onTap: () {
                                                  controller.cacheservice
                                                          .orderEntity =
                                                      controller.tradFloorList
                                                          .value[idx];
                                                  Get.toNamed(AppRoutes.BuyPage);
                                                },
                                              ),
                                            ),
                                            Pinned.fromPins(
                                              Pin(size: 74.0, middle: 0.937),
                                              Pin(size: 50.0, end: 13.0),
                                              child: InkWell(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffd4d4d4),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                        width: 1.0,
                                                        color: const Color(
                                                            0xff1d4f8b)),
                                                  ),
                                                ),
                                                onTap: () {
                                                  controller.cacheservice
                                                          .orderEntity =
                                                      controller.tradFloorList
                                                          .value[idx];
                                                  Get.toNamed(AppRoutes.BuyPage);
                                                },
                                              ),
                                            ),
                                            Pinned.fromPins(
                                              Pin(size: 30.0, middle: 0.895),
                                              Pin(size: 16.0, end: 30.0),
                                              child: InkWell(
                                                child: Text(
                                                  'Buy'.tr,
                                                  style: TextStyle(
                                                    fontFamily: 'Helvetica Neue',
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xff1d4f8b),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                onTap: () {
                                                  controller.cacheservice
                                                          .orderEntity =
                                                      controller.tradFloorList
                                                          .value[idx];
                                                  Get.toNamed(AppRoutes.BuyPage);
                                                },
                                              ),
                                            ),
                                            Pinned.fromPins(
                                              Pin(size: 80, middle: 0.646),
                                              Pin(size: 16.0, end: 13.5),
                                              child: SizedBox(
                                                width: 80.0,
                                                height: 12.0,
                                                child: InkWell(
                                                  child: Text(
                                                    getSplit(itemData.sellType),
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontSize: 11,
                                                      color:
                                                          itemData.sellType == 1
                                                              ? Color(0xff5d5d5d)
                                                              : Colors.red,
                                                      letterSpacing: -0.187,
                                                      height: 1.0909090909090908,
                                                    ),
                                                    textHeightBehavior:
                                                        TextHeightBehavior(
                                                            applyHeightToFirstAscent:
                                                                false),
                                                  ),
                                                  onTap: () {
                                                    controller.cacheservice
                                                            .orderEntity =
                                                        controller.tradFloorList
                                                            .value[idx];
                                                    Get.toNamed(
                                                        AppRoutes.BuyPage);
                                                  },
                                                ),
                                              ),
                                            ),
                                            Pinned.fromPins(
                                              Pin(size: 120.0, middle: 0.595),
                                              Pin(size: 30.0, end: 29.0),
                                              child: InkWell(
                                                child: Center(
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: paymentIcon(
                                                          itemData.payment)),
                                                ),
                                                onTap: () {
                                                  controller.cacheservice
                                                          .orderEntity =
                                                      controller.tradFloorList
                                                          .value[idx];
                                                  Get.toNamed(AppRoutes.BuyPage);
                                                },
                                              ),
                                            ),
                                          ],
                                        )
                                    );
                                  }).toList(),
                        ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  @override
  bool useLoadSir() => false;

  @override
  bool showTitleBar() => false;

  List<Widget> paymentIcon(List<PendingOrderListPaymentEntity> paymentmethods) {
    List<Widget> list = [];
    //i<5, pass your dynamic limit as per your requirment
    String strPayImage = '';
    for (int i = 0; i < paymentmethods.length; i++) {
      if (paymentmethods[i].paymentType == 1) {
        strPayImage = 'assets/images/alipay.png';
      } else if (paymentmethods[i].paymentType == 2) {
        strPayImage = 'assets/images/wechat.png';
      } else if (paymentmethods[i].paymentType == 3) {
        strPayImage = 'assets/images/union_pay.png';
      } else if (paymentmethods[i].paymentType == 4) {
        strPayImage = 'assets/images/ECNY.png';
      } else if (paymentmethods[i].paymentType == 5) {
        strPayImage = 'assets/images/qqpay.png';
      }
      if(i<=3)
        {
          list.add(Image.asset(
            strPayImage,
            height: 32,
          ));
        }
//add any Widget in place of Text("Index $i")
    }
    return list; // all widget added now retrun the list here
  }

  String getSplit(int intSellType) {
    String strsplite = "sellnotsplit".tr;
    if (intSellType == 2) {
      strsplite = "sellsplit".tr;
    }
    return strsplite;
  }
}

void BuyerNotice() {
  SmartDialog.show(
    backDismiss: false,
    clickMaskDismiss: false,
    builder: (_) {
      return Container(
        width: 380,
        height: 470,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0.0, -0.9),
              child: SizedBox(
                width: 218.0,
                height: 42.0,
                child: Text(
                  'Buyer Notice',
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 35,
                    color: const Color(0xff1d4f8b),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 280.0, middle: 0.48),
              Pin(size: 1.0, end: 370.0),
              child: SvgPicture.string(
                _svg_fp15lo,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromPins(
              Pin(size: 320.0, middle: 0.4),
              Pin(size: 65.0, end: 290.0),
              child: Text(
                'In order to ensure the safety of your Transaction and funds, do not trust privately to add friends to conduct transactions, and any losses will be borne bt the individual.',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 13,
                  color: const Color(0xff1d4f8b),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 320.0, middle: 0.4),
              Pin(size: 65.0, end: 210.0),
              child: Text(
                '1. You need to use the payment information you bind to pay the seller. If the payment information does not match, the seller has the right not to give you money.',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 13,
                  color: const Color(0xff1d4f8b),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 320.0, middle: 0.4),
              Pin(size: 65.0, end: 150.0),
              child: Text(
                '2. If there is a dispute between the two parties during the transaction, please click on the upper right corner Apply for Customer Service to intervene in transaction disputes.',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 13,
                  color: const Color(0xff1d4f8b),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 320.0, middle: 0.4),
              Pin(size: 65.0, end: 75.0),
              child: Text(
                '3. Do not place frequent orders without purchasing, or maliciously cancel the order, If the verification is true, the account will be suspended.\n',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 13,
                  color: const Color(0xff1d4f8b),
                ),
              ),
            ),
            Align(
              alignment: Alignment(1.1, -1.08),
              child: IconButton(
                icon: const Icon(Icons.close_rounded),
                tooltip: '',
                onPressed: () {
                  SmartDialog.dismiss();
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //change width and height on your need width = 200 and height = 50
                  minimumSize: Size(250, 50),
                ),
                onPressed: () => Get.toNamed(AppRoutes.BuyPage),
                child: Text('Proceed'),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class OrderLobbyController extends BaseController {
  RxBool isDescending = false.obs;
  RxList<PendingOrderListDataEntity> tradFloorList =
      <PendingOrderListDataEntity>[].obs;
  int intSelectIndex = 0;
  final GCPayApi gcpayApi;
  final CacheService cacheservice;
  final buyAmountController = TextEditingController();
  OrderLobbyController(this.cacheservice, this.gcpayApi);
  RxList<SiteInfoDataEntity> siteInfoList = <SiteInfoDataEntity>[].obs;
  RxString rxNoticeContent = ''.obs;

  RxString rxgcAmountUsableSort = 'asc'.obs;
  RxString rxpaymentType = '0'.obs;
  RxInt rxsellType = 0.obs;
  RxList rxFilterPayment = [].obs;

  RxList<ButtonMultiSelectItem> paymentMethodList =
      <ButtonMultiSelectItem>[].obs;

  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    pendOrderList();
    getSiteInfo();
  }

  PendingOrderListDataEntity getSelectListEntity() {
    return tradFloorList.value[intSelectIndex];
  }

  Future<void> getSiteInfo() async {
    try {
      Map<String, dynamic> data = <String, dynamic>{'type': 2};
      var response = await gcpayApi.getZmsSitMailInfo(data);
      if (response.code == 400) {}
      if (response.code == 200) {
        siteInfoList.value = response.data!;
        if (siteInfoList.length > 0) {
          SiteInfoDataEntity sitemessage = siteInfoList.value[0];
          rxNoticeContent.value = sitemessage.content!;
        }

        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future<void> pendOrderList() async {
    try {
      if(rxFilterPayment.value.length>0)
        {
          var stringList = rxFilterPayment.value.join(",");
          rxpaymentType.value = stringList;
          print(stringList); //Prints "onetwothree"
        }
      Map<String, dynamic> data = <String, dynamic>{};
      if(buyAmountController.text.length > 0)
        {
          data = <String, dynamic>{
            'gcAmountUsable': buyAmountController.text,
            'gcAmountUsableSort': rxgcAmountUsableSort.value,
            'paymentType': rxpaymentType.value,
            'sellType': rxsellType.value,
          };
        }
      else
        {
          data = <String, dynamic>{
            'gcAmountUsableSort': rxgcAmountUsableSort.value,
            'paymentType': rxpaymentType.value,
            'sellType': rxsellType.value,
          };
        }

      var response = await gcpayApi.orderLobbyList(data);
      if (response.code == 400) {}
      if (response.code == 200) {
        tradFloorList.value = response.data!;
        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }
}

class OrderLobbyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        OrderLobbyController(Get.put(CacheService()), Get.put(GCPayApi())));
  }
}

const String _svg_wua465 =
    '<svg viewBox="74.5 412.5 1.0 25.0" ><path transform="translate(74.5, 412.5)" d="M 0 0 L 0 25" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jpp6k =
    '<svg viewBox="-3.0 0.0 451.0 260.0" ><path transform="translate(-3.0, 0.0)" d="M 451 0 L 451 260 L 0 260 L 451 0 Z" fill="#2072d3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fp15lo =
    '<svg viewBox="86.5 278.0 275.9 1.0" ><path transform="translate(86.5, 278.0)" d="M 0 0 L 275.9072265625 0" fill="none" stroke="#5e5e5e" stroke-width="2" stroke-dasharray="4 4" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
