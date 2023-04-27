import 'dart:convert';

import 'package:GCPay/utils/lib_navigator.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

import '../../routes/app_routes.dart';
import '../../services/cache_service.dart';
import '../../utils/encryptutils.dart';
import '../result/base_result.dart';

///请求参数拦截器
class HttpParamsInterceptor extends Interceptor {
  static const VERSION = "version";
  static const TOKEN = "token";
  static const DEVICE_NO = "deviceNo";
  static const APP_TYPE_KEY = "appType";
  static const APP_TYPE_VALUE = "Android";
  static const APP_ID_KEY = "appId";
  static const JSON_BODY = "jsonBody";
  static const SIGN = "sign";
  static const TIMESTAMP = "timestamp";
  static const UTF_8 = "UTF-8";
  static const APP_ID = "test_android";

  HttpParamsInterceptor() {
    var res = EncryptUtils.initAes();
  }

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    var headers = options.headers;
    //headers["Authorization"] = 'Bearer $loadToken';
    handler.next(options);
  }


  String? loadToken() {
    final box = GetStorage();
    var jsonToken = box.read(CacheManagerKey.TOKEN.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    return jsonToken;
  }

  @override
  Future onResponse(dio.Response response, ResponseInterceptorHandler handler) async{

    if(response.data["code"] == 201)
    {
    return super.onResponse(response, handler);
    }

    if (response.data != null) {
      final encyyptvalue = BaseResult<String>.fromJson(
        response.data!,
            (json) => json as String,
      );
      if(response.data["code"] == 302 ||response.data["code"] == 303)
      {
        Fluttertoast.showToast(
            msg: response.data["msg"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);

        CacheService cachservice =
        Get.find<CacheService>();
        cachservice.logOut();
        JPush jpush = JPush();
        jpush.deleteAlias();
        Get.back();
        Get.offNamed(AppRoutes.LoginPage);
        return;
      }
      else if(response.data["code"] == 201)
        {
          return super.onResponse(response, handler);
        }

      if(encyyptvalue.data != null&&encyyptvalue.data!.isNotEmpty)
      {
        String? dataString = encyyptvalue.data;

        String decryptStr = EncryptUtils.decryptAes(dataString!);
        response.data["data"] = jsonDecode(decryptStr);

      }

    }
    return super.onResponse(response, handler);
  }
}
