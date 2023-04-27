import 'package:event_bus/event_bus.dart';
import 'package:get/get.dart';
import 'package:GCPay/http/apiservice/api_service.dart';
import 'package:GCPay/http/apiservice/common_api.dart';
import 'package:GCPay/http/apiservice/gateway_api.dart';
import 'package:GCPay/http/apiservice/haxi_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

///初始化注入对象
class Injection extends GetxService {
  Future<void> init() async {
    await Get.putAsync(() => SharedPreferences.getInstance());
    Get.lazyPut(() => HaXiApi(), fenix: true);
    Get.lazyPut(() => ApiService(), fenix: true);
    Get.lazyPut(() => GatewayApi(), fenix: true);
    Get.lazyPut(() => CommonApi(), fenix: true);
    Get.lazyPut(() => EventBus(), fenix: true);
  }
}
