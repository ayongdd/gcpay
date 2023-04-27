import 'package:GCPay/business/home_page/home_page.dart';
import 'package:GCPay/business/main_page.dart';
import 'package:GCPay/controllers/editpassword_controller.dart';
import 'package:GCPay/controllers/editpassword_controller.dart';
import 'package:GCPay/http/apiservice/haxi_api.dart';
import 'package:GCPay/services/auth_api_service.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:get/get.dart';

import '../GCPay/manage_page/gc_management_page.dart';
import '../http/apiservice/gcpay_api.dart';



class ManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
            () => ManageController(Get.put(CacheService()), Get.put(GCPayApi())));
  }
}