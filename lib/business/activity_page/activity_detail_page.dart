import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:GCPay/base/controller/base_controller.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';
import 'package:GCPay/res/colors.dart';
import 'package:GCPay/routes/router_utils.dart';
import 'package:GCPay/utils/log_utils.dart';

import '../../services/cache_service.dart';

class ActivityDetailPage extends BaseStatefulWidget<ActivityDetailController> {
  const ActivityDetailPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    String strImage;
    if(controller.cacheservice.rxLanguage.value == '1')
      {
        strImage = "assets/images/hashbet/CH/activity"+controller.strType+"_detail.jpg";
      }
    else
      {
        strImage = "assets/images/hashbet/EN/activity"+controller.strType+"_detail.jpg";
      }

    return SingleChildScrollView(
      child: Column(children: [
        GestureDetector(
          onTap: (){},
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
            height: ScreenUtil().screenHeight,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.all(16),
            child: Image.asset(strImage,fit: BoxFit.fitWidth,),
            ),
        ),
      ]),
    );
  }

  @override
  String titleString() {
    return "activitydetail".tr;
  }

  @override
  bool showBackButton() => true;
}

class ActivityDetailController extends BaseController {
  late String strType;
  late CacheService cacheservice;
  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    LogD("ActivityDetialPage初始化onResume");
    LogD(Get.arguments);
    strType = Get.arguments;
    cacheservice = Get.find<CacheService>();
    showSuccess();
  }
}

class ActivityDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityDetailController());
    // Get.lazyPut(() => FocusController());
    // Get.lazyPut(() => CategoryController());
    // Get.lazyPut(() => TopicController());
  }
}
