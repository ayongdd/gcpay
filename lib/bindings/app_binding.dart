import 'package:GCPay/services/connectivity_service.dart';
import 'package:get/get.dart';

import '../utils/theme_page.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    injectService();
    Get.put(ThemeController(), permanent: true);
  }

  void injectService() {
    Get.put(ConnectivityService());
  }
}
