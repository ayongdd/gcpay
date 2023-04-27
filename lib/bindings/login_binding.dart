import 'package:GCPay/controllers/login_controller.dart';
import 'package:GCPay/services/auth_api_service.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:get/get.dart';

import '../http/apiservice/gcpay_api.dart';
import '../http/apiservice/haxi_api.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GCPayApi(), fenix: true);
    Get.lazyPut<LoginController>(() =>
        LoginController(Get.find<AuthApiService>(), Get.find<CacheService>(),Get.find<GCPayApi>()));
  }
}
