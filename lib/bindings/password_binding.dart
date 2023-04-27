import 'package:GCPay/controllers/signup_controller.dart';
import 'package:GCPay/http/apiservice/haxi_api.dart';
import 'package:GCPay/services/auth_api_service.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:get/get.dart';

import '../controllers/password_controller.dart';
import '../http/apiservice/gcpay_api.dart';

class PasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordController>(() =>
        PasswordController(Get.find<AuthApiService>(), Get.find<CacheService>(), Get.find<GCPayApi>()));
  }
}
