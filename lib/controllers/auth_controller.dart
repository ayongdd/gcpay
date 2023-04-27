import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:GCPay/base/controller/base_controller.dart';
import 'package:GCPay/http/apiservice/haxi_api.dart';
import 'package:GCPay/http/result/base_result.dart';
import 'package:GCPay/models/token_model.dart';
import 'package:GCPay/routes/app_routes.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:get/get.dart';
import '../business/home_page/model/Login_entity.dart';
import '../http/apiservice/gcpay_api.dart';
import '../services/auth_api_service.dart';

//This controller doesn't have view page but used
// for some widget button like signout and other
class AuthController extends BaseController {
  final AuthApiService _authenticationService;
  final CacheService cacheServices;
  final GCPayApi api;
  AuthController(this._authenticationService, this.cacheServices, this.api);
  Rx<LoginEntity> loginEntity = Rx<LoginEntity>(LoginEntity(gcBalance: 0, nickname: ""));
  RxString rxUserName = RxString('');

  Future<bool> signIn(Map<String, dynamic> data) async {
    bool boolLoginSuccess = false;
    try {
      log('signIn');
      var response = await api.login(data);
      //var response = await _authenticationService.signIn(email,trc20, password);
      log('is logged in : ${response.code}：${response.toString()}');

      if (response.code == 200) {
        log('${response.data}');
        // final decoded = jsonDecode(responsense.data.toString()) as List<dynamic>;
        // Map<String, dynamic> tokenJson = decoded[0];
        // if (tokenJson['type'] == 1) {
        // tokenData = TokenModel(
        //   accessToken: response.data.toString(),
        // );
        boolLoginSuccess = true;
        LoginEntity? loginentity = response.data;
        loginEntity = Rx<LoginEntity>(loginentity!);
        rxUserName.value = loginentity.nickname!;
        cacheServices.login(loginentity.token.toString());
        cacheServices.saveUserInfo(loginentity);
        cacheServices.saveUserName(loginentity.realName.toString());
        cacheServices.saveUserNickName(loginentity.nickname.toString());
        cacheServices.saveUserId(loginentity.userId.toString());
        cacheServices.saveUsdtBonus(loginentity.gcBalance!);
        cacheServices.saveUserTrc20Address(loginentity.walletAddress!);
        cacheServices.saveAuthFlag(loginentity.authFlag.toString());
        if(loginentity.headPic !=null&&loginentity.headPic!.length>0)
          {
            cacheServices.saveProfilePath(loginentity.headPic!);
          }
        else
          {
            cacheServices.saveProfilePath('');
          }

        if(loginentity.imToken == null)
          {
            var response = await api.refreshImToken();
            if(response.data != null)
              {
                String strImToken = response.data!;
                if(strImToken.length >0)
                  {
                    cacheServices.saveUserIMToken(strImToken);
                  }
              }
            log('${response.data}');
          }
        else
          {
            if(loginentity.imToken!.length >0)
              {
                cacheServices.saveUserIMToken(loginentity.imToken!);
              }
          }

      } else {
        var message = response.msg;
        log('message---{message}');
        showToast(response.msg,gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      // printLog(e);
      printError(info: e.toString());
      rethrow;
    }
    return boolLoginSuccess;
  }

  Future<bool> signUp(Map<String, dynamic> data) async {
    bool boolSignUpSuccess = false;
    String errorM =
        'An error occurred while registering, please contact the administrator.';
    try {
      var response = await api.register(data);
      errorM = response.msg!;

      log('is signup : ${response.toString()}');
      if (response.code == 200) {
        log('enter signup');
        boolSignUpSuccess = true;
        Get.back();
      } else {
        // var message = response.body['error_description'];

        showToast(response.msg,gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      // printLog(e);
      printError(info: e.toString());
      throw Exception(errorM);
    }
    return boolSignUpSuccess;
  }


  Future<TokenModel?> editloginPwds(Map<String, dynamic> data) async {
    TokenModel? tokenData;
    String errorM =
        'An error occurred while editingPass, please contact the administrator.';
    try {
      var response = await api.editLoginPwds(data);
      errorM = response.msg!;

      log('is changing : ${response.toString()}');
      if (response.code == 200) {
        log('modify password success');
        showToast("modify_password_success".tr,
            gravity: ToastGravity.CENTER);
        Future.delayed(const Duration(milliseconds: 1000), () {
          //延时执行的代码
          Get.back();
        });
      } else {
        // var message = response.body['error_description'];

        showToast(errorM,
            gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      // printLog(e);
      printError(info: e.toString());
      throw Exception(errorM);
    }
    return tokenData;
  }

  Future<TokenModel?> editPayPwds(Map<String, dynamic> data) async {
    TokenModel? tokenData;
    String errorM =
        'An error occurred while editingPass, please contact the administrator.';
    try {
      var response = await api.editPayPwd(data);
      errorM = response.msg!;

      log('is changing : ${response.toString()}');
      if (response.code == 200) {
        log('modify password success');
        showToast("modify_password_success".tr,
            gravity: ToastGravity.CENTER);
        Future.delayed(const Duration(milliseconds: 1000), () {
          //延时执行的代码
          Get.back();
        });
      } else {
        // var message = response.body['error_description'];
        showToast(errorM,
            gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      // printLog(e);
      printError(info: e.toString());
      throw Exception(errorM);
    }
    return tokenData;
  }


  Future<TokenModel?> senSmsCode(Map<String, dynamic> data) async {
    TokenModel? tokenData;
    String errorM =
        'An error occurred while senSmsCode, please contact the administrator.';
    try {
      var response = await api.senSmsCode(data);
      errorM = response.msg!;

      log('is senSmsCode : ${response.toString()}');
      if (response.code == 200) {
        log('senSmsCodesuccess');
        showToast("send_sms_success".tr,
            gravity: ToastGravity.CENTER);
        // tokenData = await editPass(<String, String>{
        //   'confirm': data['confirm'],
        //   'original': data['original'],
        //   'password': data['password'],
        //   'playerName' : data['playerName'],
        //}
        //);
      } else {
        // var message = response.body['error_description'];

        throw Exception(errorM);
      }
    } catch (e) {
      // printLog(e);
      printError(info: e.toString());
      throw Exception(errorM);
    }
    return tokenData;
  }

  // Future<TokenModel?> refreshToken() async {
  //   if (_cacheServices.token == null) return null;
  //   TokenModel? tokenData;
  //   try {
  //     var response = await _authenticationService
  //         .refreshToken(_cacheServices.token!.refreshToken);
  //     if (response.statusCode == 200) {
  //       log('refreshToken():  ${response.body}');
  //       tokenData = TokenModel.fromJson(response.body);
  //       _cacheServices.login(tokenData);
  //     } else {
  //       var message = response.body['error_description'];
  //       throw Exception(message ?? 'An error occurred, please try again.');
  //     }
  //   } catch (e) {
  //     printError(info: 'exception refreshToken 1:  ${e.toString()}');
  //     rethrow;
  //   }
  //   return tokenData;
  // }

  String? token() => cacheServices.token;

  void signOut() async {
    cacheServices.logOut();
  }

  bool isAuthenticated() {
    return !cacheServices.sessionIsExpired();
  }

  @override
  void loadNet() {}

  @override
  void onInit() {
    if(cacheServices.loadUserName() != null)
      {
        rxUserName.value = cacheServices.loadUserName()!;
      }

  }
}
