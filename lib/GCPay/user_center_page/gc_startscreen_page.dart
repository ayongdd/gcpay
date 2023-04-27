import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';

import '../../base/controller/base_controller.dart';
import '../../http/apiservice/gcpay_api.dart';
import '../../routes/app_routes.dart';
import '../../services/cache_service.dart';
import '../user_center_Page/models/system_config_entity.dart';


class StartScreenPage extends BaseStatefulWidget<StartScreenController> {
  const StartScreenPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2072d3),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/gcpay_startlogo.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool showTitleBar() {
    return false;
  }

  @override
  bool useLoadSir() => false;
}

class StartScreenController extends BaseController {
  final CacheService cacheService;
  final GCPayApi gcpayApi;
  StartScreenController(this.cacheService, this.gcpayApi);
  Timer? timer;
  RxInt count = 3.obs;
  @override
  void onClose() {
    timer?.cancel();
    timer=null;
    super.onClose();
  }

  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    initTimer();
    getSystemConfig();
  }

  void initTimer() {
    timer =
        Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
          count--;

          if (count == 0) {
            timer.cancel(); //倒计时结束取消定时器//按钮可点击
            count.value = 3;

            if(cacheService.token == null)
              {
                Get.offAndToNamed(AppRoutes.MainPage);
              }
            else
              {
                if(cacheService.token!.length > 0 && cacheService.strOrderPayId!.length > 0)
                {
                  Get.offAndToNamed(AppRoutes.MainPage);
                  Get.back();
                  var ret = await Get.toNamed(AppRoutes.OrderPayPage,parameters: {'id':cacheService.strOrderPayId!});
                  cacheService.removeOrderPayId();
                  cacheService.strOrderPayId = '';
                }
                else if(cacheService.token!.length > 0 && cacheService.strCoolDownOrderPayId!.length > 0)
                {
                  int retMain = await Get.offAndToNamed(AppRoutes.MainPage);
                }
                else
                {
                  Get.offAndToNamed(AppRoutes.MainPage);
                }
              }

            //Get.toNamed(AppRoutes.MainPage);//重置时间
//重置按钮文本
          } else {//更新文本内容
          }
        });
  }

  Future<void> getSystemConfig() async {
    try {
      Map<String, dynamic> data = <String, dynamic>{};
      var response = await gcpayApi.systemConfig();
      if (response.code == 401) {
        // Get.toNamed(Routes.LOGIN);
      }
      if (response.code == 200) {
        //return json.decode(response.body);
        system_config_entity? systemconfig = response.data;
        cacheService.saveNotice(systemconfig!.app.headline!,systemconfig.app.content!,systemconfig.app.updateDate.toString());
        if(systemconfig.serviceLink != null)
          {
            cacheService.saveServiceLink(systemconfig.serviceLink!);
          }

        if(systemconfig.helpLink != null)
        {
          cacheService.saveHelpLink(systemconfig.helpLink!);
        }

        if(systemconfig.bankList != null)
        {
          cacheService.saveBankList(systemconfig.bankList!);
        }

        if(systemconfig.domain != null)
        {
          cacheService.saveDomain(systemconfig.domain!);
        }

        if(systemconfig.downloadLink != null)
        {
          cacheService.saveDownLoadLink(systemconfig.downloadLink!);
        }

        if (Platform.isIOS) {
          if(systemconfig.iosVersion!=null)
            {
              String strVersionNum = systemconfig.iosVersion!;
              cacheService.saveVersionName(strVersionNum);
            }
        }else if(Platform.isAndroid)
          {
            if(systemconfig.androidVersion!=null)
            {
              String strVersionNum = systemconfig.androidVersion!;
              cacheService.saveVersionName(strVersionNum);
            }
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
}

class StartScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        StartScreenController(Get.find<CacheService>(), Get.find<GCPayApi>()));
  }
}

const String _svg_ehpyic =
    '<svg viewBox="33.0 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
