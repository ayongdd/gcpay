import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get_storage/get_storage.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';
import 'package:images_picker/images_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../base/controller/base_controller.dart';
import '../../http/apiservice/gcpay_api.dart';
import '../../services/cache_service.dart';
import '../../services/lang/localization_service.dart';
import '../../utils/permission_handle.dart';
import '../Model/UploadPaymentPic_Data_entity.dart';
import '../home_page/Model/HomePage_Record_entity.dart';
import '../home_page/Model/UserBalance_Amount_entity.dart';
import 'Model/AddOrUpUmsPayment_Data.dart';

class AddPayment extends BaseStatefulWidget<AddPaymentController> {
  const AddPayment({Key? key}) : super(key: key);

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
                                    'addpayment'.tr,
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
                      Pin(size: 400.0, middle: 0.5),
                      Pin(start: 44.0, end: 10.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(Pin(start: 10.0, end: 10.0),
                              Pin(size: 600.0, start: 60),
                              child: DefaultTabController(
                                length: 5,
                                child: Column(
                                  children: <Widget>[
                                    ButtonsTabBar(
                                      backgroundColor: Color(0xff15056d),
                                      unselectedBackgroundColor:
                                          Colors.grey[300],
                                      unselectedLabelStyle:
                                          TextStyle(color: Colors.black),
                                      labelStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      tabs: [
                                        Tab(
                                          icon: Image.asset(
                                            'assets/images/alipay.png',
                                            height: 25,
                                            fit: BoxFit.cover,
                                          ),
                                          text: "Alipay".tr,
                                        ),
                                        Tab(
                                          icon: Image.asset(
                                            'assets/images/wechat.png',
                                            height: 25,
                                            fit: BoxFit.cover,
                                          ),
                                          text: "Wechat".tr,
                                        ),
                                        Tab(
                                          icon: Image.asset(
                                            'assets/images/union_pay.png',
                                            height: 25,
                                            fit: BoxFit.cover,
                                          ),
                                          text: "Bank".tr,
                                        ),
                                        Tab(
                                          icon: Image.asset(
                                            'assets/images/ECNY.png',
                                            height: 25,
                                            fit: BoxFit.cover,
                                          ),
                                          text: "ECNY".tr,
                                        ),
                                        Tab(
                                          icon: Image.asset(
                                            'assets/images/qqpay.png',
                                            height: 25,
                                            fit: BoxFit.cover,
                                          ),
                                          text: "qqpay".tr,
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        children: <Widget>[
                                          // Alipay
                                          SizedBox(
                                            height: 600,
                                            width: 100,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: Color(0x00000000),
                                              ),
                                              child: Stack(
                                                children: <Widget>[
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 65.0,
                                                        start: 10.0),
                                                    child: Container(
                                                      child: Align(
                                                        alignment:
                                                            FractionalOffset(
                                                                0.5, 0.5),
                                                        child: Text(
                                                          'Fill Info'.tr,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontSize: 19,
                                                            color: const Color(
                                                                0xff5d5d5d),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(start: 40.0, end: 40.0),
                                                    Pin(
                                                        size: 50.0,
                                                        start: 65.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffffffff),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                            width: 2.0,
                                                            color: const Color(
                                                                0xff1d4f8b)),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            FractionalOffset(
                                                                0.1, 0.5),
                                                        child: TextFormField(
                                                          readOnly: true,
                                                          controller: controller
                                                              .alipaynameController,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText: 'Name'
                                                                    .tr +
                                                                ":" +
                                                                controller
                                                                    .getUserName()!,
                                                            border: InputBorder
                                                                .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            hintStyle:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  'PingFang SC',
                                                              fontSize: 19,
                                                              color: Color(
                                                                  0xff707070),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .singleLineFormatter
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(start: 40.0, end: 40.0),
                                                    Pin(
                                                        size: 50.0,
                                                        start: 125.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffffffff),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                            width: 2.0,
                                                            color: const Color(
                                                                0xff1d4f8b)),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            FractionalOffset(
                                                                0.1, 0.5),
                                                        child: TextFormField(
                                                          controller: controller
                                                              .alipayaccountController,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Enter Alipay Account'
                                                                    .tr,
                                                            border: InputBorder
                                                                .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            hintStyle:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  'PingFang SC',
                                                              fontSize: 19,
                                                              color: Color(
                                                                  0xff707070),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .singleLineFormatter
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 125.0,
                                                        start: 181.0),
                                                    child: Image.asset(
                                                      'assets/images/paymentcode.png',
                                                      height: 400,
                                                      width: 400,
                                                    ), //
                                                  ),
                                                  Pinned.fromPins(
                                                      Pin(
                                                          size: 100.0,
                                                          middle: 0.5),
                                                      Pin(
                                                          size: 96.0,
                                                          start: 195.0),
                                                      child: Obx(
                                                        () => controller
                                                                    .alipayQrcode
                                                                    .value
                                                                    .length >
                                                                0
                                                            ? Container(
                                                                height: 40,
                                                                child: Image
                                                                    .network(
                                                                  controller
                                                                      .alipayQrcode
                                                                      .value,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  key:
                                                                      UniqueKey(),
                                                                ),
                                                              )
                                                            : Container(
                                                                height: 40),
                                                      )),
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 65.0,
                                                        start: 310.0),
                                                    child: InkWell(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffd4d4d4),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                FractionalOffset(
                                                                    0.5, 0.5),
                                                            child: Text(
                                                              'Upload my payment code'
                                                                  .tr,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Helvetica Neue',
                                                                fontSize: 19,
                                                                color: const Color(
                                                                    0xff5d5d5d),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () async {
                                                          {
                                                            controller
                                                                .getImage(1);
                                                          }
                                                        }),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 60.0,
                                                        start: 380.0),
                                                    child: InkWell(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: const Color(
                                                                  0xff15056d),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0)),
                                                          child: Align(
                                                            alignment:
                                                                FractionalOffset(
                                                                    0.5, 0.5),
                                                            child: Text(
                                                              'Add'.tr,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Helvetica Neue',
                                                                fontSize: 19,
                                                                color: const Color(
                                                                    0xffffffff),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () async {
                                                          {
                                                            controller
                                                                .AddPaymentInfo(
                                                                    1);
                                                          }
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // Wechat
                                          SizedBox(
                                            height: 600,
                                            width: 100,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: Color(0x00000000),
                                              ),
                                              child: Stack(
                                                children: <Widget>[
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 65.0,
                                                        start: 10.0),
                                                    child: Container(
                                                      child: Align(
                                                        alignment:
                                                            FractionalOffset(
                                                                0.5, 0.5),
                                                        child: Text(
                                                          'Fill Info'.tr,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontSize: 19,
                                                            color: const Color(
                                                                0xff5d5d5d),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(start: 40.0, end: 40.0),
                                                    Pin(
                                                        size: 50.0,
                                                        start: 80.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffffffff),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                            width: 2.0,
                                                            color: const Color(
                                                                0xff1d4f8b)),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            FractionalOffset(
                                                                0.1, 0.5),
                                                        child: TextFormField(
                                                          readOnly: true,
                                                          controller: controller
                                                              .wechatnameController,
                                                          decoration:
                                                            InputDecoration(
                                                            hintText: 'Name'
                                                                    .tr +
                                                                ":" +
                                                                controller
                                                                    .getUserName()!,
                                                            border: InputBorder
                                                                .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            hintStyle:
                                                                TextStyle(
                                                              fontFamily:
                                                                  'PingFang SC',
                                                              fontSize: 19,
                                                              color: const Color(
                                                                  0xff707070),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .singleLineFormatter
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 125.0,
                                                        start: 145.0),
                                                    child: Image.asset(
                                                      'assets/images/paymentcode.png',
                                                      height: 400,
                                                      width: 400,
                                                    ), //
                                                  ),
                                                  Pinned.fromPins(
                                                      Pin(
                                                          size: 100.0,
                                                          middle: 0.5),
                                                      Pin(
                                                          size: 100.0,
                                                          start: 158.0),
                                                      child: Obx(
                                                        () => controller
                                                                    .wechatQrcode
                                                                    .value
                                                                    .length >
                                                                0
                                                            ? Container(
                                                                height: 40,
                                                                child: Image
                                                                    .network(
                                                                  controller
                                                                      .wechatQrcode
                                                                      .value,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  key:
                                                                      UniqueKey(),
                                                                ),
                                                              )
                                                            : Container(
                                                                height: 40),
                                                      )),
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 65.0,
                                                        start: 280.0),
                                                    child: InkWell(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffd4d4d4),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                FractionalOffset(
                                                                    0.5, 0.5),
                                                            child: Text(
                                                              'Upload my payment code'
                                                                  .tr,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Helvetica Neue',
                                                                fontSize: 19,
                                                                color: const Color(
                                                                    0xff5d5d5d),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () async {
                                                          {
                                                            controller
                                                                .getImage(2);
                                                          }
                                                        }),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 60.0,
                                                        start: 350.0),
                                                    child: InkWell(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: const Color(
                                                                  0xff15056d),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0)),
                                                          child: Align(
                                                            alignment:
                                                                FractionalOffset(
                                                                    0.5, 0.5),
                                                            child: Text(
                                                              'Add'.tr,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Helvetica Neue',
                                                                fontSize: 19,
                                                                color: const Color(
                                                                    0xffffffff),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () async {
                                                          {
                                                            controller
                                                                .AddPaymentInfo(
                                                                    2);
                                                          }
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          //Bank
                                          SizedBox(
                                            height: 600,
                                            width: 100,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: Color(0x00000000),
                                              ),
                                              child: Stack(
                                                children: <Widget>[
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 65.0,
                                                        start: 10.0),
                                                    child: Container(
                                                      child: Align(
                                                        alignment:
                                                            FractionalOffset(
                                                                0.5, 0.5),
                                                        child: Text(
                                                          'Fill Info'.tr,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontSize: 19,
                                                            color: const Color(
                                                                0xff5d5d5d),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(start: 40.0, end: 40.0),
                                                    Pin(
                                                        size: 50.0,
                                                        start: 65.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffffffff),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                            width: 2.0,
                                                            color: const Color(
                                                                0xff1d4f8b)),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            FractionalOffset(
                                                                0.1, 0.5),
                                                        child: TextFormField(
                                                          readOnly: true,
                                                          controller: controller
                                                              .banknameController,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText: 'Name'
                                                                    .tr +
                                                                ":" +
                                                                controller
                                                                    .getUserName()!,
                                                            border: InputBorder
                                                                .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            hintStyle:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  'PingFang SC',
                                                              fontSize: 19,
                                                              color: Color(
                                                                  0xff707070),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .singleLineFormatter
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(start: 40.0, end: 40.0),
                                                    Pin(
                                                        size: 50.0,
                                                        start: 125.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffffffff),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                            width: 2.0,
                                                            color: const Color(
                                                                0xff1d4f8b)),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            FractionalOffset(
                                                                0.1, 0.5),
                                                        child: TextFormField(
                                                          controller: controller
                                                              .bankaccountController,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Enter Bank Account'
                                                                    .tr,
                                                            border: InputBorder
                                                                .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            hintStyle:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  'PingFang SC',
                                                              fontSize: 19,
                                                              color: Color(
                                                                  0xff707070),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .singleLineFormatter
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Obx(() => controller
                                                              .rxBankSelectName
                                                              .value
                                                              .length >
                                                          0
                                                      ? Pinned.fromPins(
                                                          Pin(
                                                              start: 40.0,
                                                              end: 40.0),
                                                          Pin(
                                                              size: 50.0,
                                                              start: 190.0),
                                                          child: InkWell(
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  border: Border.all(
                                                                      width:
                                                                          2.0,
                                                                      color: const Color(
                                                                          0xff1d4f8b)),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      FractionalOffset(
                                                                          0.5,
                                                                          0.5),
                                                                  child: Text(
                                                                    controller
                                                                        .rxBankSelectName
                                                                        .value,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Helvetica Neue',
                                                                      fontSize:
                                                                          19,
                                                                      color: const Color(
                                                                          0xff5d5d5d),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              onTap: () async {
                                                                {
                                                                  showSheetWithoutList();
                                                                }
                                                              }),
                                                        )
                                                      : Container(
                                                          height: 10,
                                                        )),
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 65.0,
                                                        start: 265.0),
                                                    child: InkWell(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffd4d4d4),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                FractionalOffset(
                                                                    0.5, 0.5),
                                                            child: Text(
                                                              'Choose Bank'.tr,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Helvetica Neue',
                                                                fontSize: 19,
                                                                color: const Color(
                                                                    0xff5d5d5d),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () async {
                                                          {
                                                            showSheetWithoutList();
                                                          }
                                                        }),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 60.0,
                                                        start: 350.0),
                                                    child: InkWell(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: const Color(
                                                                  0xff15056d),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0)),
                                                          child: Align(
                                                            alignment:
                                                                FractionalOffset(
                                                                    0.5, 0.5),
                                                            child: Text(
                                                              'Add'.tr,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Helvetica Neue',
                                                                fontSize: 19,
                                                                color: const Color(
                                                                    0xffffffff),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () async {
                                                          {
                                                            controller
                                                                .AddPaymentInfo(
                                                                    3);
                                                          }
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          //ECNY
                                          SizedBox(
                                            height: 600,
                                            width: 100,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: Color(0x00000000),
                                              ),
                                              child: Stack(
                                                children: <Widget>[
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 65.0,
                                                        start: 10.0),
                                                    child: Container(
                                                      child: Align(
                                                        alignment:
                                                            FractionalOffset(
                                                                0.5, 0.5),
                                                        child: Text(
                                                          'Fill Info'.tr,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontSize: 19,
                                                            color: const Color(
                                                                0xff5d5d5d),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(start: 40.0, end: 40.0),
                                                    Pin(
                                                        size: 50.0,
                                                        start: 65.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffffffff),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                            width: 2.0,
                                                            color: const Color(
                                                                0xff1d4f8b)),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            FractionalOffset(
                                                                0.1, 0.5),
                                                        child: TextFormField(
                                                          readOnly: true,
                                                          controller: controller
                                                              .ecnynameController,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText: 'Name'
                                                                    .tr +
                                                                ":" +
                                                                controller
                                                                    .getUserName()!,
                                                            border: InputBorder
                                                                .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            hintStyle:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  'PingFang SC',
                                                              fontSize: 19,
                                                              color: Color(
                                                                  0xff707070),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .singleLineFormatter
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(start: 40.0, end: 40.0),
                                                    Pin(
                                                        size: 50.0,
                                                        start: 125.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffffffff),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                            width: 2.0,
                                                            color: const Color(
                                                                0xff1d4f8b)),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const FractionalOffset(
                                                                0.1, 0.5),
                                                        child: TextFormField(
                                                          controller: controller
                                                              .ecnyaccountController,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'EnterECNYAccount'
                                                                    .tr,
                                                            border: InputBorder
                                                                .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            hintStyle:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  'PingFang SC',
                                                              fontSize: 19,
                                                              color: Color(
                                                                  0xff707070),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .singleLineFormatter
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 125.0,
                                                        start: 180.0),
                                                    child: Image.asset(
                                                      'assets/images/paymentcode.png',
                                                      height: 400,
                                                      width: 400,
                                                    ), //
                                                  ),
                                                  Pinned.fromPins(
                                                      Pin(
                                                          size: 100.0,
                                                          middle: 0.5),
                                                      Pin(
                                                          size: 100.0,
                                                          start: 192.0),
                                                      child: Obx(
                                                        () => controller
                                                                    .ecnyQrcode
                                                                    .value
                                                                    .length >
                                                                0
                                                            ? Container(
                                                                height: 40,
                                                                child: Image
                                                                    .network(
                                                                  controller
                                                                      .ecnyQrcode
                                                                      .value,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  key:
                                                                      UniqueKey(),
                                                                ),
                                                              )
                                                            : Container(
                                                                height: 40),
                                                      )),
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 60.0,
                                                        start: 310.0),
                                                    child: InkWell(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffd4d4d4),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                FractionalOffset(
                                                                    0.5, 0.5),
                                                            child: Text(
                                                              'Upload my payment code'
                                                                  .tr,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Helvetica Neue',
                                                                fontSize: 19,
                                                                color: const Color(
                                                                    0xff5d5d5d),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () async {
                                                          {
                                                            controller
                                                                .getImage(4);
                                                          }
                                                        }),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 60.0,
                                                        start: 375.0),
                                                    child: InkWell(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: const Color(
                                                                  0xff15056d),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0)),
                                                          child: Align(
                                                            alignment:
                                                                FractionalOffset(
                                                                    0.5, 0.5),
                                                            child: Text(
                                                              'Add'.tr,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Helvetica Neue',
                                                                fontSize: 19,
                                                                color: const Color(
                                                                    0xffffffff),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () async {
                                                          {
                                                            controller
                                                                .AddPaymentInfo(
                                                                    4);
                                                          }
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          //QQPay
                                          SizedBox(
                                            height: 600,
                                            width: 100,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: Color(0x00000000),
                                              ),
                                              child: Stack(
                                                children: <Widget>[
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 65.0,
                                                        start: 10.0),
                                                    child: Container(
                                                      child: Align(
                                                        alignment:
                                                        FractionalOffset(
                                                            0.5, 0.5),
                                                        child: Text(
                                                          'Fill Info'.tr,
                                                          style: TextStyle(
                                                            fontFamily:
                                                            'Helvetica Neue',
                                                            fontSize: 19,
                                                            color: const Color(
                                                                0xff5d5d5d),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(start: 40.0, end: 40.0),
                                                    Pin(
                                                        size: 50.0,
                                                        start: 65.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffffffff),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(10.0),
                                                        border: Border.all(
                                                            width: 2.0,
                                                            color: const Color(
                                                                0xff1d4f8b)),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                        FractionalOffset(
                                                            0.1, 0.5),
                                                        child: TextFormField(
                                                          readOnly: true,
                                                          controller: controller
                                                              .ecnynameController,
                                                          decoration:
                                                          InputDecoration(
                                                            hintText: 'Name'
                                                                .tr +
                                                                ":" +
                                                                controller
                                                                    .getUserName()!,
                                                            border: InputBorder
                                                                .none,
                                                            focusedBorder:
                                                            InputBorder
                                                                .none,
                                                            hintStyle:
                                                            const TextStyle(
                                                              fontFamily:
                                                              'PingFang SC',
                                                              fontSize: 19,
                                                              color: Color(
                                                                  0xff707070),
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                            ),
                                                          ),
                                                          textAlign:
                                                          TextAlign.center,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .singleLineFormatter
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(start: 40.0, end: 40.0),
                                                    Pin(
                                                        size: 50.0,
                                                        start: 125.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffffffff),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(10.0),
                                                        border: Border.all(
                                                            width: 2.0,
                                                            color: const Color(
                                                                0xff1d4f8b)),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                        const FractionalOffset(
                                                            0.1, 0.5),
                                                        child: TextFormField(
                                                          controller: controller
                                                              .qqpayaccountController,
                                                          decoration:
                                                          InputDecoration(
                                                            hintText:
                                                            'EnterQQPayAccount'
                                                                .tr,
                                                            border: InputBorder
                                                                .none,
                                                            focusedBorder:
                                                            InputBorder
                                                                .none,
                                                            hintStyle:
                                                            const TextStyle(
                                                              fontFamily:
                                                              'PingFang SC',
                                                              fontSize: 19,
                                                              color: Color(
                                                                  0xff707070),
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                            ),
                                                          ),
                                                          textAlign:
                                                          TextAlign.center,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .singleLineFormatter
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 125.0,
                                                        start: 180.0),
                                                    child: Image.asset(
                                                      'assets/images/paymentcode.png',
                                                      height: 400,
                                                      width: 400,
                                                    ), //
                                                  ),
                                                  Pinned.fromPins(
                                                      Pin(
                                                          size: 100.0,
                                                          middle: 0.5),
                                                      Pin(
                                                          size: 100.0,
                                                          start: 192.0),
                                                      child: Obx(
                                                            () => controller
                                                            .qqpayQrcode
                                                            .value
                                                            .length >
                                                            0
                                                            ? Container(
                                                          height: 40,
                                                          child: Image
                                                              .network(
                                                            controller
                                                                .qqpayQrcode
                                                                .value,
                                                            fit: BoxFit
                                                                .cover,
                                                            key:
                                                            UniqueKey(),
                                                          ),
                                                        )
                                                            : Container(
                                                            height: 40),
                                                      )),
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 60.0,
                                                        start: 310.0),
                                                    child: InkWell(
                                                        child: Container(
                                                          decoration:
                                                          BoxDecoration(
                                                            color: Color(
                                                                0xffd4d4d4),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                10.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                            FractionalOffset(
                                                                0.5, 0.5),
                                                            child: Text(
                                                              'Upload my payment code'
                                                                  .tr,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                'Helvetica Neue',
                                                                fontSize: 19,
                                                                color: const Color(
                                                                    0xff5d5d5d),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () async {
                                                          {
                                                            controller
                                                                .getImage(5);
                                                          }
                                                        }),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(size: 320.0, end: 30.0),
                                                    Pin(
                                                        size: 60.0,
                                                        start: 375.0),
                                                    child: InkWell(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: const Color(
                                                                  0xff15056d),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  8.0)),
                                                          child: Align(
                                                            alignment:
                                                            FractionalOffset(
                                                                0.5, 0.5),
                                                            child: Text(
                                                              'Add'.tr,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                'Helvetica Neue',
                                                                fontSize: 19,
                                                                color: const Color(
                                                                    0xffffffff),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () async {
                                                          {
                                                            controller
                                                                .AddPaymentInfo(
                                                                5);
                                                          }
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 24.0, middle: 0.02),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> bankListItem() {
    List<Widget> list = [];
    //i<5, pass your dynamic limit as per your requirment
    String strPayImage = '';
    String strBankList = controller.cacheservice.rxBankList.value;
    List bankList = strBankList.split(',');

    for (int i = 0; i < bankList.length; i++)
      list.add(Obx(
        () => controller.rxBankSelectIndex.value == i
            ? InkWell(
                onTap: () {
                  controller.rxBankName.value = bankList[i];
                  controller.rxBankSelectIndex.value = i;
                },
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: Text(bankList[i]),
                  alignment: Alignment.center,
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        blurRadius: 15.0,
                        offset: Offset(5.0, 10.0),
                      ),
                    ],
                  ),
                ))
            : InkWell(
                onTap: () {
                  controller.rxBankName.value = bankList[i];
                  controller.rxBankSelectIndex.value = i;
                },
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: Text(bankList[i]),
                  alignment: Alignment.center,
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        blurRadius: 15.0,
                        offset: Offset(5.0, 10.0),
                      ),
                    ],
                  ),
                )),
      )); //add any Widget in place of Text("Index $i")
    return list; // all widget added now retrun the list here
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
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            'cancel'.tr,
                            style: TextStyle(
                                fontSize: 16, color: Color(0xfff9f9f9)),
                          )),
                      Text(
                        'Choose Bank'.tr,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.back();
                            controller.rxBankSelectName.value =
                                controller.rxBankName.value;
                          },
                          child: Text(
                            'confirm'.tr,
                            style: TextStyle(
                                fontSize: 16, color: Color(0xfff9f9f9)),
                          )),
                    ]),
              ),
            ],
          ),
        );
      },
      bodyBuilder: (context, offset) {
        CacheService cacheService = Get.find<CacheService>();
        return SliverChildListDelegate(
          bankListItem(),
        );
      },
      anchors: [.2, 0.6, 0.601],
    );
  }

  @override
  bool showTitleBar() => false;

  @override
  bool useLoadSir() => false;
}

class AddPaymentController extends BaseController {
  final GCPayApi gcpayApi;
  final CacheService cacheservice;
  AddPaymentController(this.cacheservice, this.gcpayApi);

  final alipaynameController = TextEditingController();
  final alipayaccountController = TextEditingController();
  final wechatnameController = TextEditingController();
  final banknameController = TextEditingController();
  final bankaccountController = TextEditingController();
  final ecnynameController = TextEditingController();
  final ecnyaccountController = TextEditingController();
  final qqpaynameController = TextEditingController();
  final qqpayaccountController = TextEditingController();

  RxInt paymentType = 1.obs;
  RxString qrCode = ''.obs;
  RxString zfbAccount = ''.obs;
  RxString remark = ''.obs;
  RxString alipayQrcode = ''.obs;
  RxString wechatQrcode = ''.obs;
  RxString ecnyQrcode = ''.obs;
  RxString qqpayQrcode = ''.obs;
  RxString rxBankName = ''.obs;
  RxInt rxBankSelectIndex = 0.obs;
  RxString rxBankSelectName = ''.obs;
  @override
  void loadNet() {}

  @override
  Future<void> onReady() async {
    super.onReady();
    await getUserBalanceInfo();
  }

  @override
  void onClose() {
    alipaynameController.dispose();
    alipayaccountController.dispose();
    wechatnameController.dispose();
    banknameController.dispose();
    bankaccountController.dispose();
    ecnynameController.dispose();
    ecnyaccountController.dispose();
    qqpaynameController.dispose();
    qqpayaccountController.dispose();
    super.onClose();
  }

  Future<void> getUserBalanceInfo() async {
    try {
      String strAlias = '';
      strAlias = cacheservice.loadPushAlias()!;
      Map<String, dynamic> data = <String, dynamic>{'alias': strAlias};
      var response = await gcpayApi.umsUserBalance(data);
      if (response.code == 401) {}
      if (response.code == 200) {
        //return json.decode(response.body);
        UserBalanceAmountEntity balanceEntity = response.data!;
        if (balanceEntity.realName != null) {
          cacheservice.saveUserName(balanceEntity.realName!);
        }
        if (balanceEntity.nickname != null) {
          cacheservice.saveUserNickName(balanceEntity.nickname!);
        }
        cacheservice.saveServiceLink(balanceEntity.serviceLink!);
        cacheservice.saveAuthFlag(balanceEntity.authFlag.toString());
      } else {}
      // var message = response.toString();
      //
      // log('${json.decode(response.body)}');
      // log('All ovens loaded successfully');
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  Future getImage(int intIndex) async {
    if (Platform.isIOS) {
      bool result = await permissionCheckAndRequest(
        Get.context!,
        Permission.photos,
        "相册",
      );
      if (!result) {
        return;
      };
    } else if (Platform.isAndroid) {
      bool result = await permissionCheckAndRequest(
        Get.context!,
        Permission.storage,
        "相册",
      );
      if (!result) {
        return;
      };
    }
    try {
      final currentLocale = await LocalizationService().getCurrentLocale();
      Language currentLanguage = Language.System;
      if (cacheservice.rxLanguage.value == '1') {
        currentLanguage = Language.Chinese;
      } else {
        currentLanguage = Language.English;
      }
      List<Media>? res = await ImagesPicker.pick(
        count: 1,
        pickType: PickType.image,
        // when cropOpt isn't null, crop is enabled
        cropOpt: CropOption(
          aspectRatio: CropAspectRatio.custom,
          cropType: CropType.rect, // currently for android
        ),
        language: currentLanguage,
      );
      if (res != null && res.length > 0) {
        uploadCodeFromImage(res[0].path, intIndex);
      }
    } catch (e) {
      debugPrint(e.toString());
      showToast(e.toString());
    }
  }

  Future<void> uploadCodeFromImage(String imageFile, int intPaymentType) async {
    try {
      var response = await gcpayApi.uploadPaymentQrcode(imageFile);
      if (response.code == 200) {
        UploadPaymentPicDataEntity paymentQrcodePictureEntity = response.data!;
        if (intPaymentType == 1) {
          alipayQrcode.value = paymentQrcodePictureEntity.url!;
        } else if (intPaymentType == 2) {
          wechatQrcode.value = paymentQrcodePictureEntity.url!;
        } else if (intPaymentType == 4) {
          ecnyQrcode.value = paymentQrcodePictureEntity.url!;
        } else if (intPaymentType == 5) {
          qqpayQrcode.value = paymentQrcodePictureEntity.url!;
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

  int getPaymentId(int intPaymentType) {
    int intPaymentId = 0;
    List<UmsPaymentSell> paymentmethods = cacheservice.paymentmethods.value;
    for (int i = 0; i < paymentmethods.length; i++) {
      UmsPaymentSell paymentEntity = paymentmethods[i];
      if (paymentEntity.paymentType == intPaymentType) {
        intPaymentId = paymentEntity.id!;
        break;
      }
    }
    return intPaymentId;
  }

  Future<void> AddPaymentInfo(int intPaymentType) async {
    try {
      late Map<String, dynamic> data;
      int intPaymentId = getPaymentId(intPaymentType);
      if (intPaymentId != 0) {
        if (intPaymentType == 1) {
          data = <String, dynamic>{
            "paymentType": intPaymentType,
            "qrCode": alipayQrcode.value,
            "account": alipayaccountController.text,
            "remark": "",
            "realName": cacheservice.loadUserName(),
            "id": intPaymentId,
          };
        } else if (intPaymentType == 2) {
          data = <String, dynamic>{
            "paymentType": intPaymentType,
            "qrCode": wechatQrcode.value,
            "remark": "",
            "realName": cacheservice.loadUserName(),
            "id": intPaymentId,
          };
        } else if (intPaymentType == 3) {
          String strBankCard = bankaccountController.text;
          String strBankName = rxBankSelectName.value;
          data = <String, dynamic>{
            "paymentType": intPaymentType,
            "bankCard": strBankCard,
            "bankName": strBankName,
            "remark": "",
            "realName": cacheservice.loadUserName(),
            "id": intPaymentId,
          };
          if (rxBankSelectName.value.length <= 0) {
            showToast('Choose Bank'.tr);
            return;
          }
        } else if (intPaymentType == 4) {
          data = <String, dynamic>{
            "paymentType": intPaymentType,
            "qrCode": ecnyQrcode.value,
            "account": ecnyaccountController.text,
            "remark": "",
            "realName": cacheservice.loadUserName(),
            "id": intPaymentId,
          };
        } else if (intPaymentType == 5) {
          data = <String, dynamic>{
            "paymentType": intPaymentType,
            "qrCode": qqpayQrcode.value,
            "account": qqpayaccountController.text,
            "remark": "",
            "realName": cacheservice.loadUserName(),
            "id": intPaymentId,
          };
        }
      } else {
        if (intPaymentType == 1) {
          data = <String, dynamic>{
            "paymentType": intPaymentType,
            "qrCode": alipayQrcode.value,
            "account": alipayaccountController.text,
            "remark": "",
            "realName": cacheservice.loadUserName(),
          };
        } else if (intPaymentType == 2) {
          data = <String, dynamic>{
            "paymentType": intPaymentType,
            "qrCode": wechatQrcode.value,
            "remark": "",
            "realName": cacheservice.loadUserName(),
          };
        } else if (intPaymentType == 3) {
          String strBankCard = bankaccountController.text;
          String strBankName = rxBankSelectName.value;
          data = <String, dynamic>{
            "paymentType": intPaymentType,
            "bankCard": strBankCard,
            "bankName": strBankName,
            "remark": "",
            "realName": cacheservice.loadUserName(),
          };
          if (rxBankSelectName.value.length <= 0) {
            showToast('Choose Bank'.tr);
            return;
          }
        } else if (intPaymentType == 4) {
          data = <String, dynamic>{
            "paymentType": intPaymentType,
            "qrCode": ecnyQrcode.value,
            "account": ecnyaccountController.text,
            "remark": "",
            "realName": cacheservice.loadUserName(),
          };
        } else if (intPaymentType == 5) {
          data = <String, dynamic>{
            "paymentType": intPaymentType,
            "qrCode": qqpayQrcode.value,
            "account": qqpayaccountController.text,
            "remark": "",
            "realName": cacheservice.loadUserName(),
          };
        }
      }
      var response = await gcpayApi.addorUpUmsPayment(data);
      if (response.code == 200) {
        Future.delayed(Duration(seconds: 2), () {
          Get.back();
        });
        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
      showToast(response.msg);
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  String? getUserName() {
    String strUserName = cacheservice.loadUserName()!;
    if (strUserName == 'null' || strUserName == null) {
      strUserName = cacheservice.loadUserNickName()!;
    }
    return strUserName;
  }
}

class AddPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        AddPaymentController(Get.put(CacheService()), Get.put(GCPayApi())));
  }
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

const String _svg_ehpyic =
    '<svg viewBox="33.0 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_c5mbx =
    '<svg viewBox="0.0 0.0 26.0 26.0" ><path transform="matrix(0.0, -1.0, 1.0, 0.0, 0.0, 26.0)" d="M 26 0 L 26 26 L 0 26 L 0 0 L 26 0 Z" fill="none" fill-opacity="0.6" stroke="none" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_khxxur =
    '<svg viewBox="9.0 5.8 8.7 14.5" ><path transform="matrix(0.0, -1.0, 1.0, 0.0, 9.0, 20.25)" d="M 1.493763089179993 0 L 7.246881484985352 5.753118515014648 L 13 0 L 14.4937629699707 1.493763089179993 L 7.246881484985352 8.740644454956055 L 0 1.493763089179993 L 1.493763089179993 0 Z" fill="#000000" fill-opacity="0.6" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_cupiqg =
    '<svg viewBox="0.0 0.0 16.0 16.0" ><path  d="M 16 0 L 16 16 L 0 16 L 0 0 L 16 0 Z" fill="none" fill-opacity="0.6" stroke="none" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_e22dvw =
    '<svg viewBox="4.0 4.0 8.0 8.0" ><path transform="translate(4.0, 4.0)" d="M 0 0.919238805770874 L 0.919238805770874 0 L 3.995153427124023 3.075914859771729 L 7.071067810058594 0 L 7.990306854248047 0.919238805770874 L 4.914391994476318 3.995153427124023 L 7.990306854248047 7.071067810058594 L 7.071067810058594 7.990306854248047 L 3.995153427124023 4.914391994476318 L 0.919238805770874 7.990306854248047 L 0 7.071067810058594 L 3.075914859771729 3.995153427124023 L 0 0.919238805770874 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_oanivv =
    '<svg viewBox="2.0 3.7 11.6 8.1" ><path transform="translate(1.97, 3.7)" d="M 10.6820240020752 0 L 11.60126304626465 0.9192388653755188 L 4.459362506866455 8.061137199401855 L 0 3.601776361465454 L 0.9192386865615845 2.682537317276001 L 4.459362506866455 6.222660064697266 L 10.6820240020752 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
