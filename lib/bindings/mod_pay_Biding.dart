import 'package:GCPay/business/home_page/home_page.dart';
import 'package:GCPay/business/main_page.dart';
import 'package:GCPay/controllers/editpassword_controller.dart';
import 'package:GCPay/controllers/editpassword_controller.dart';
import 'package:GCPay/http/apiservice/haxi_api.dart';
import 'package:GCPay/services/auth_api_service.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:get/get.dart';

import '../http/apiservice/gcpay_api.dart';



class ModpayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GCPayApi(), fenix: true);
    Get.lazyPut<EditPwController>(() =>
        EditPwController(Get.find<AuthApiService>(), Get.find<CacheService>(),Get.find<GCPayApi>()));
  }
}
