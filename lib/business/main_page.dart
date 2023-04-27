import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:GCPay/GCPay/manage_page/gc_management_page.dart';
import 'package:GCPay/GCPay/manage_page/gc_paymentinfo_page.dart';
import 'package:GCPay/base/controller/base_controller.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';

import 'package:GCPay/business/activity_page/activity_page.dart';
import 'package:GCPay/business/exchange_page/exchange_page.dart';
import 'package:GCPay/business/home_page/home_page.dart';

import 'package:GCPay/business/mine_page/mine_page.dart';
import 'package:GCPay/business/record_page/record_page.dart';
import 'package:GCPay/res/colors.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:GCPay/utils/log_utils.dart';
import 'package:GCPay/widget/keep_alive_wrapper.dart';
import 'package:retrofit/http.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:web_socket_channel_connect/web_socket_channel_connect.dart';
import '../GCPay/home_page/gc_home_page.dart';
import '../GCPay/order_page/gc_order_page.dart';
import '../GCPay/preorder_page/gc_preorder_page.dart';
import '../http/apiservice/gcpay_api.dart';
import '../http/apiservice/haxi_api.dart';
import '../models/socket_entity_data.dart';
import '../routes/app_routes.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/event_bus.dart';
import '../utils/permission_handle.dart';
import 'dart:async';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel_connect/web_socket_channel_connect.dart';

import '../utils/web_socket_utility.dart';
import '../widget/popup/Notification.dart';
import '../widget/popup/popup.dart';

final GlobalKey<State<BottomNavigationBar>> bottomNavKey =
    GlobalKey<State<BottomNavigationBar>>();

class MainPage extends BaseStatefulWidget<MainController> {
  MainPage({Key? key}) : super(key: key);
  final CacheService _cacheService = Get.find();

  @override
  Widget buildContent(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          extendBody: true, //to make floating action button notch transparent

          //to avoid the floating action button overlapping behavior,
          // when a soft keyboard is displayed
          // resizeToAvoidBottomInset: false,
          bottomNavigationBar: Obx(() =>StylishBottomBar(
            padding: EdgeInsets.only(top: 6,bottom: 6),
            backgroundColor: Color(0xff4486d5),
            items: [
              AnimatedBarItems(
                  icon: Image.asset("assets/images/tabbar/home.png",height: 40,),
                  selectedIcon: Image.asset("assets/images/tabbar/home_select.png",height: 40),
                  selectedColor: Color(0xffffffff),
                  unSelectedColor: Colors.black54,
                  backgroundColor: Color(0xff1d4f8b),
                  title: Text('home'.tr,style: TextStyle(fontSize: 13),textAlign: TextAlign.center,)),
              AnimatedBarItems(
                  icon: Image.asset("assets/images/tabbar/pendingorder.png",height: 40,),
                  selectedIcon: Image.asset("assets/images/tabbar/pendingorder_select.png",height: 40,),
                  selectedColor: Color(0xffffffff),
                  unSelectedColor: Colors.black54,
                  backgroundColor: Color(0xff1d4f8b),
                  title: Text('preorder'.tr,style: TextStyle(fontSize: 13),textAlign: TextAlign.center)),
              AnimatedBarItems(
                  icon: Image.asset("assets/images/tabbar/tabbar_transparent.png",height: 40,),
                  selectedIcon: Image.asset("assets/images/tabbar/tabbar_transparent.png",height: 40,),
                  selectedColor: Color(0xffffffff),
                  unSelectedColor: Colors.black54,
                  backgroundColor: Color(0xff1d4f8b),
                  title: const Text('')),
              AnimatedBarItems(
                  icon: Image.asset("assets/images/tabbar/order.png",height: 40,),
                  selectedIcon: Image.asset("assets/images/tabbar/order_select.png",height: 40,),
                  backgroundColor: Color(0xff1d4f8b),
                  unSelectedColor: Colors.black54,
                  selectedColor: Color(0xffffffff),
                  title: Text('order'.tr,style: TextStyle(fontSize: 13),textAlign: TextAlign.center)),
              AnimatedBarItems(
                  icon: Image.asset("assets/images/tabbar/manage.png",height: 40,),
                  selectedIcon: Image.asset("assets/images/tabbar/manage_select.png",height: 40,),
                  backgroundColor: Color(0xff1d4f8b),
                  unSelectedColor: Colors.black54,
                  selectedColor: Color(0xffffffff),
                  title: Text('manage'.tr,style: TextStyle(fontSize: 13),textAlign: TextAlign.center)),
            ],
            iconSize: 32,
            //barAnimation: BarAnimation.drop,
            //iconStyle: IconStyle.animated,
            hasNotch: true,
            fabLocation: StylishBarFabLocation.center,
            opacity: 0.3,
            currentIndex: controller.selected.value,
            onTap: (index) {

              if(index != 2)
              {
                if(index == 0)
                  {
                    eventBus.fire(EventFn({
                      'eventbus':'homepage',
                    }));
                  }
                else if(index == 4)
                  {
                    eventBus.fire(EventFn({
                      'eventbus':'payment',
                    }));
                  }
                controller.pageController.jumpToPage(index!);
                controller.selected.value = index;
              }
            },
          )),
          floatingActionButton: FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: () async {
              // 调用封装好的权限检查和请求方法
              bool result = await permissionCheckAndRequest(
                  context,
                  Permission.camera,
                  "相机",
              );
              if (result)
                {
                  Get.toNamed(AppRoutes.ScanPage);
                };


            },
            backgroundColor: Color(0xff1d4f8b),
            child: Icon(
              Icons.qr_code_rounded,
              size: 35,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: KeepAliveWrapper(
            child: PageView(
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: controller.naviItems,
            ),
          ),

        ),
        onWillPop: () async {
          if (controller.lastPopTime == null ||
              DateTime.now().difference(controller.lastPopTime!) >
                  const Duration(seconds: 2)) {
            // 存储当前按下back键的时间
            controller.lastPopTime = DateTime.now();
            // toast
            showToast("再按一次退出app");
            return false;
          } else {
            controller.lastPopTime = DateTime.now();
            // 退出app
            await SystemNavigator.pop();
            return true;
          }
        });
  }

  @override
  bool showTitleBar() => false;
}

class MainController extends BaseController {
  DateTime? lastPopTime;
  final RxInt _curPage = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  RxInt selected = 0.obs;
  var eventBusFn;

  final List<Widget> naviItems = [
    GCHomePage(),
    PreOrderPage(),
    PaymentInfoPage(),
    OrderPage(),
    ManagementPage()
  ];

  @override
  void onClose() {
    //取消订阅
    eventBusFn.cancel();
    WebSocketUtility().closeSocket();
  }

  //一些状态改变监听方法

  //监听程序进入前后台的状态改变的方法
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    switch (state) {
    //进入应用时候不会触发该状态 应用程序处于可见状态，并且可以响应用户的输入事件。它相当于 Android 中Activity的onResume
      case AppLifecycleState.resumed:
        print("应用进入前台======");
        WebSocketUtility().openSocket();
        WebSocketUtility().sentSubscription();
        break;
    //应用状态处于闲置状态，并且没有用户的输入事件，
    // 注意：这个状态切换到 前后台 会触发，所以流程应该是先冻结窗口，然后停止UI
      case AppLifecycleState.inactive:
        print("应用处于闲置状态，这种状态的应用应该假设他们可能在任何时候暂停 切换到后台会触发======");
        break;
    //当前页面即将退出
      case AppLifecycleState.detached:
        print("当前页面即将退出======");
        break;
    // 应用程序处于不可见状态
      case AppLifecycleState.paused:
        print("应用处于不可见状态 后台======");
        break;
    }
  }

  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    showSuccess();
    initWS();
    initEventBus();
  }

  Future<void> openOrderNotice(
      String strNoticeTitle, String strNoticeContent, String strTradeOrderNo) async {
    CacheService cacheService = Get.find<CacheService>();

    if (cacheService.intPopup == 1) {
      return;
    }
    cacheService.intPopup = 1;
    final popup = BeautifulPopup(
      context: Get.context!,
      template: TemplateNotification,
    );
    var shouldUpdate = await popup.show(
      title: strNoticeTitle,
      content: strNoticeContent,
      actions: [
        popup.button(
          label: 'confirm'.tr,
          onPressed: () async {
            Get.back();
            cacheService.intPopup = 0;
            var ret = await Get.toNamed(
                AppRoutes.MyBuyOrderPage,parameters: {'tradeOrderNo': strTradeOrderNo});
          },
        ),
      ],
    );
    cacheService.intPopup = 0;

  }

  void initEventBus()
  {
    // 注册监听器，订阅 eventbus
    eventBusFn = eventBus.on<EventFn>().listen((event) {
      //  event为 event.obj 即为 eventBus.dart 文件中定义的 EventFn 类中监听的数据
      print(event.obj);

      var eventObj = event.obj;
      if(eventObj['eventbus'] == 'login')
      {

      }
      else if(eventObj['eventbus'] == 'homepage')
      {

      }
      else if(eventObj['eventbus'] == 'websocketcall')
      {

        String strTradeOrderNo = eventObj['tradOrderNo'];
        String strTradeMessage = eventObj['msg'];
        openOrderNotice('订单提醒',strTradeMessage,strTradeOrderNo);
      }

    });
  }
  void initWS()
  {
    WebSocketUtility().initWebSocket(onOpen: () {
      WebSocketUtility().initHeartBeat();
      WebSocketUtility().sentSubscription();
    }, onMessage: (data) {
      String strData = data;
      if(strData.contains('command'))
        {
          var jsonData = json.decode(data);
          SocketEntityData socketdata = SocketEntityData.fromJson(
              jsonData
          );
          if(socketdata.command == 1001)
            {
              if(socketdata.tradeOrderNo != null && socketdata.tradeOrderNo != 'null')
              {
                eventBus.fire(EventFn({
                  'eventbus':'websocket',
                  'tradOrderNo':socketdata.tradeOrderNo
                }));
              }
            }
          else if(socketdata.command == 1002)
            {
              eventBus.fire(EventFn({
                'eventbus':'websocketcall',
                'tradOrderNo':socketdata.tradeOrderNo,
                'msg':socketdata.msg
              }));
            }
        }

      print(data);
    }, onError: (e) {
      print(e);
    });
  }

}

class MainBinding extends Bindings {
  @override
  void dependencies() {
    LogD(">>>>>>>>>>>>开始注入代码");
    Get.lazyPut(
        () => GCHomeController(Get.find<CacheService>(), Get.put(GCPayApi())));
    Get.lazyPut(() => PreOrderController(Get.find<CacheService>(), Get.put(GCPayApi())));
    Get.lazyPut(() => ActivityController());
    Get.lazyPut(() => OrderController(Get.put(CacheService()), Get.put(GCPayApi())));
    Get.lazyPut(() => ManageController(Get.put(CacheService()), Get.put(GCPayApi())));
    Get.lazyPut(() => MainController());
  }
}
