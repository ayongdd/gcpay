import 'dart:developer';

import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';

import '../../base/controller/base_controller.dart';
import '../../http/apiservice/gcpay_api.dart';
import '../../res/colors.dart';
import '../../routes/app_routes.dart';
import '../../services/cache_service.dart';
import '../../utils/event_bus.dart';
import '../manage_page/gc_add_payment.dart';
import '../home_page/Model/HomePage_Record_entity.dart';

class OrderPage extends BaseStatefulWidget<OrderController> {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    CacheService cacheService = Get.find<CacheService>();
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          /*Bubbles*/
          Pinned.fromPins(
            Pin(start: -120.0, end: 16.0),
            Pin(size: 506.0, end: -188.0),
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
          /*header*/
          Pinned.fromPins(
            Pin(size: 435.0, middle: 0.5),
            Pin(start: 0.0, end: 0.0),
            child: SizedBox(
              width: 355.0,
              height: 1090.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                      Pin(size: 435.0, start: 0.0),
                      Pin(size: 787.0, start: -345.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage('assets/images/topBG.png'),
                          ),
                        ),
                      ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 150.2, middle: 0.4987),
                    Pin(size: 150.0, start: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 151.2, middle: 0.4987),
                          Pin(size: 160.0, start: 50.0),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment(0 ,0.9),
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
                      ],
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 435.0, start: 0.0),
                    Pin(size: 43.0, start: 180.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff15056d),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 280.0, middle: 0.5),
                    Pin(size: 28.0, start: 190.0),
                    child: Text(
                      'mybuyorder'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 18,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 10.0, end: 10.0),
                  Pin(size: 72.0, start: 230.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AnimatedButtonBar(
                        innerVerticalPadding: 15,
                        radius: 8.0,
                        padding: const EdgeInsets.all(0.0),
                        backgroundColor: Color(0xffffffff),
                        borderColor: Color(0xff1d4f8b),
                        foregroundColor: Color(0xffd3e0f0),
                        borderWidth: 2.0,
                        invertedSelection: false,
                        children: [
                          ButtonBarEntry(
                            onTap: () {
                              controller.getOrderList(1);
                            },
                            child: Text('processing'.tr,
                              style: TextStyle(fontFamily: 'Helvetica Neue',
                                fontSize: 13,
                                color: const Color(0xff1d4f8b),
                              ),),
                          ),
                          ButtonBarEntry(
                              onTap: () {
                                controller.getOrderList(2);
                              },
                              child: Text('cancelled'.tr,
                                style: TextStyle(fontFamily: 'Helvetica Neue',
                                  fontSize: 13,
                                  color: const Color(0xff1d4f8b),
                                ),)
                          ),
                          ButtonBarEntry(
                              onTap: () {
                                controller.getOrderList(3);
                              },
                              child: Text('paused'.tr,
                                style: TextStyle(fontFamily: 'Helvetica Neue',
                                  fontSize: 13,
                                  color: const Color(0xff1d4f8b),
                                ),)
                          ),
                          ButtonBarEntry(
                              onTap: () {
                                controller.getOrderList(4);
                              },
                              child: Text('completed'.tr,
                                style: TextStyle(fontFamily: 'Helvetica Neue',
                                  fontSize: 13,
                                  color: const Color(0xff1d4f8b),
                                ),)
                          ),
                          ButtonBarEntry(
                              onTap: () {
                                controller.getOrderList(0);
                              },
                              child: Text('all'.tr,
                                style: TextStyle(fontFamily: 'Helvetica Neue',
                                  fontSize: 13,
                                  color: const Color(0xff1d4f8b),
                                ),)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //scrollview
                Obx(() => controller.rxTradeOrderList.length > 0
                 ? Pinned.fromPins(
                  Pin(start: 05.0, end: 05.0),
                  Pin(start: 289.7, end: 0.0),
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                        left: 0, top: 10, right: 0, bottom: 125),
                    itemCount: controller.rxTradeOrderList.value.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 8, right: 8, top: 4, bottom: 4),
                            child: Card(
                                child: ListTile(
                                    leading: CircleAvatar(
                                      child: Text("$index"),
                                    ),
                                    title: Text(controller.rxTradeOrderList.value[index].gcAmount.toString() + ' GC'),
                                    //subtitle: Text(getSplit(index)),
                                    trailing: Container(
                                        width: 100,
                                        child: getListTileWidget(index)
                                    )))
                        ),
                        onTap: () {
                          TmsTradeOrder tmsTradeOrder = controller.rxTradeOrderList.value[index];
                          controller.cacheservice.myTradeOrderEntity = tmsTradeOrder;
                          Get.toNamed(AppRoutes.MyBuyOrderPage);
                        },
                      );
                    },
                  ),
                )
                 : Pinned.fromPins(
                  Pin(start: 10.0, end: 10.0),
                  Pin(start: 280.0, end: 0.0),
                  child: Pinned.fromPins(
                    Pin(start: 05.0, end: 05),
                    Pin(size: 200.0, start: 20.0),
                    child: Card(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.all(10),
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                            AssetImage("assets/images/widget_nodata.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Text(
                          'NoData'.tr,
                          textAlign: TextAlign.center,
                        ), /* add child content here */
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 10,
            child: IconButton(
              icon: Icon(
                Icons.account_balance_wallet,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                Get.toNamed(AppRoutes.WalletHistoryPage,parameters: {'historytype': '1'});
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool useLoadSir() => false;

  @override
  bool showTitleBar() => false;

  Widget getListTileWidget(int intIndex) {
    if (controller.intFilterType.value == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: getAllListTile(intIndex),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: paymentIcon(intIndex),
      );
    }
  }

  List<Widget> paymentIcon(int intIndex) {
    List<Widget> list = [];
    //i<5, pass your dynamic limit as per your requirment
    String strPayImage = '';
    int paymentmethods = controller
        .rxTradeOrderList.value[intIndex].umsPaymentBuyer!.paymentType!;

    if (paymentmethods == 1) {
      strPayImage = 'assets/images/alipay.png';
    } else if (paymentmethods == 2) {
      strPayImage = 'assets/images/wechat.png';
    } else if (paymentmethods == 3) {
      strPayImage = 'assets/images/union_pay.png';
    } else if (paymentmethods == 4) {
      strPayImage = 'assets/images/ECNY.png';
    } else if (paymentmethods == 5) {
      strPayImage = 'assets/images/qqpay.png';
    }
    list.add(Image.asset(
      strPayImage,
      height: 32,
    )); //add any Widget in place of Text("Index $i")

    return list; // all widget added now retrun the list here
  }

  List<Widget> getAllListTile(int intIndex) {
    List<Widget> column = [];
    if (controller.intFilterType.value == 0) {
      List<Widget> list = [];
      //i<5, pass your dynamic limit as per your requirment
      String strPayImage = '';
      int paymentmethods = controller
          .rxTradeOrderList.value[intIndex].umsPaymentBuyer!.paymentType!;

      if (paymentmethods == 1) {
        strPayImage = 'assets/images/alipay.png';
      } else if (paymentmethods == 2) {
        strPayImage = 'assets/images/wechat.png';
      } else if (paymentmethods == 3) {
        strPayImage = 'assets/images/union_pay.png';
      } else if (paymentmethods == 4) {
        strPayImage = 'assets/images/ECNY.png';
      } else if (paymentmethods == 5) {
        strPayImage = 'assets/images/qqpay.png';
      }
      list.add(Image.asset(
        strPayImage,
        height: 32,
      )); //add any Widget in place of Text("Index $i")

      Row row = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      );
      column.add(row);

      int intOrderStatus =
          controller.rxTradeOrderList.value[intIndex].orderStatus!;
      String strOrderStatus = '';
      if (intOrderStatus == 1) {
        strOrderStatus = 'processing'.tr;
      } else if (intOrderStatus == 2) {
        strOrderStatus = 'cancelled'.tr;
      } else if (intOrderStatus == 3) {
        strOrderStatus = 'paused'.tr;
      } else if (intOrderStatus == 4) {
        strOrderStatus = 'completed'.tr;
      }
      column.add(Text(strOrderStatus));
    } else {
      List<Widget> list = [];
      //i<5, pass your dynamic limit as per your requirment
      String strPayImage = '';
      int paymentmethods = controller
          .rxTradeOrderList.value[intIndex].umsPaymentBuyer!.paymentType!;

      if (paymentmethods == 1) {
        strPayImage = 'assets/images/alipay.png';
      } else if (paymentmethods == 2) {
        strPayImage = 'assets/images/wechat.png';
      } else if (paymentmethods == 3) {
        strPayImage = 'assets/images/union_pay.png';
      } else if (paymentmethods == 4) {
        strPayImage = 'assets/images/ECNY.png';
      } else if (paymentmethods == 5) {
        strPayImage = 'assets/images/qqpay.png';
      }
      list.add(Image.asset(
        strPayImage,
        height: 32,
      )); //add any Widget in place of Text("Index $i")

      Row row = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      );
      column.add(row);
    }
    return column;
  }
}

class OrderController extends BaseController {
  final GCPayApi gcpayApi;
  final CacheService cacheservice;
  OrderController(this.cacheservice, this.gcpayApi);
  RxList<TmsTradeOrder> rxTradeOrderList = <TmsTradeOrder>[].obs;
  RxInt intFilterType = 1.obs;
  var eventBusFn;
  @override
  void loadNet() {}

  @override
  void onClose() {
    eventBusFn.cancel();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    getOrderList(1);
    // 注册监听器，订阅 eventbus
    eventBusFn = eventBus.on<EventFn>().listen((event) {
      //  event为 event.obj 即为 eventBus.dart 文件中定义的 EventFn 类中监听的数据
      print(event.obj);
      getOrderList(1);
    });
  }

  Future<void> getOrderList(int intStatus) async {
    try {
      intFilterType.value = intStatus;
      Map<String, dynamic> data = <String, dynamic>{'status': intStatus};
      var response = await gcpayApi.getTmsTradeOrder(data);
      if (response.code == 401) {
        // Get.toNamed(Routes.LOGIN);
      }
      if (response.code == 200) {
        //return json.decode(response.body);
        rxTradeOrderList.value = response.data!;
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

class OrderBinding extends Bindings {
  @override
  void dependencies() {}
}

const String _svg_wua465 =
    '<svg viewBox="74.5 412.5 1.0 25.0" ><path transform="translate(74.5, 412.5)" d="M 0 0 L 0 25" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jpp6k =
    '<svg viewBox="-3.0 0.0 451.0 260.0" ><path transform="translate(-3.0, 0.0)" d="M 451 0 L 451 260 L 0 260 L 451 0 Z" fill="#2072d3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
