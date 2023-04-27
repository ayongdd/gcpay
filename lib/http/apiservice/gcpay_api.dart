import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:GCPay/GCPay/home_page/Model/PendingOrderList_Data_entity.dart';
import 'package:GCPay/GCPay/siteinfo_page/Model/SiteInfo_Data_entity.dart';
import 'package:GCPay/business/exchange_page/Model/ExchangeRecord_Data_entity.dart';

import 'package:GCPay/constant/http_url.dart';
import 'package:retrofit/http.dart';

import '../../GCPay/Model/UploadPaymentPic_Data_entity.dart';
import '../../GCPay/buy_page/Model/buy_order_entity.dart';
import '../../GCPay/manage_page/Model/AddOrUpUmsPayment_Data.dart';
import '../../GCPay/buy_page/Model/BuyerOrder_Data_entity.dart';
import '../../GCPay/Model/PendingOrders_Data_entity.dart';
import '../../GCPay/home_page/Model/HomePage_Record_entity.dart';
import '../../GCPay/home_page/Model/UserBalance_Amount_entity.dart';
import '../../GCPay/orderpay_page/merchant_order_entity.dart';
import '../../GCPay/user_center_Page/models/UserChangingPass_Data_Entity.dart';
import '../../GCPay/user_center_Page/models/UserRegistration_RespData_entity.dart';
import '../../GCPay/user_center_Page/models/system_config_entity.dart';
import '../../GCPay/user_center_page/models/Google_Auth_entity.dart';
import '../../GCPay/wallet_history_page/Model/Wallet_History_entity.dart';
import '../../business/exchange_page/Model/ExchangeRate_Amount_entity.dart';
import '../../business/home_page/model/BetAddressData.dart';
import '../../business/home_page/model/Login_entity.dart';
import '../../business/home_page/model/Promotion_entity.dart';
import '../../business/record_page/model/BetRecord_AmountTotal.dart';
import '../../business/record_page/model/BetRecord_Bonus_entity.dart';
import '../../business/record_page/model/BetRecord_Data_entity.dart';
import '../../business/record_page/model/BetRecord_Detail_Data_entity.dart';
import '../../business/record_page/model/BetRecord_Total_entity.dart';
import '../../business/record_page/model/RebateRecord_Data_entity.dart';
import '../../services/cache_service.dart';
import '../../utils/create_image.dart';
import '../dio_client.dart';
import 'dart:typed_data';
import '../result/base_result.dart';
part 'gcpay_api.g.dart';

@RestApi(baseUrl: HttpUrl.BASE_GCPAY_URL)
abstract class GCPayApi {
  factory GCPayApi({Dio? dio, String? baseUrl}) {
    dio ??= DioClient().dio;
    return _GCPayApi(dio, baseUrl: baseUrl);
  }

  ///修改密码

  // 修改trc20地址
  @POST("/api/editTrc20")
  Future<BaseResult<String>> editTrc20(@Body() Map<String, dynamic> map);

  ///GCPAY ApiUserController

  @POST("/api/user/addOrUpUmsPayment")
  Future<BaseResult<AddOrUpUmsPaymentData>> addorUpUmsPayment(
      @Body() Map<String, dynamic> map);

  @GET("/api/user/captcha")
  Future<String> captcha(@Body() Map<String, dynamic> map);

  @GET("/api/user/delUmsPayment")
  Future<BaseResult<String>> delUmsPayment(@Body() Map<String, dynamic> map);

  @POST("/api/user/editLoginPwd")
  Future<BaseResult<String>> editLoginPwds(@Body() Map<String, dynamic> map);
  //
  @POST("/api/user/editPayPwd")
  Future<BaseResult<String>> editPayPwd(@Body() Map<String, dynamic> map);

  @GET("/api/user/getUmsPayment")
  Future<BaseResult<List<UmsPaymentSell>>> getUmsPayment();

  // 站内信息，Site information
  @GET("/api/user/getZmsSitMailInfo")
  Future<BaseResult<List<SiteInfoDataEntity>>> getZmsSitMailInfo(@Body() Map<String, dynamic> map);

  // 站内消息已读，Set Notice Message Read Status
  @GET("/api/user/upZmsSitMailInfoReadStatus")
  Future<BaseResult<String>> upZmsSitMailInfoReadStatus(@Body() Map<String, dynamic> map);

  // 玩家jwt登录
  @POST("/api/user/login")
  Future<BaseResult<LoginEntity>> login(@Body() Map<String, dynamic> map);

  @GET("/api/user/realInfoAuthentication")
  Future<BaseResult<String>> realInfoAuthentication(@Body() Map<String, dynamic> map);

  @GET("/api/user/realInfoPicture")
  Future<BaseResult<UploadPaymentPicDataEntity>> realInfoPicture(@Part(name: "Picture") String uploadMap);

  //  玩家注册
  @POST("/api/user/register")
  Future<BaseResult<UserRegistrationRespDataEntity>> register(
      @Body() Map<String, dynamic> map);

  @GET("/api/user/umsUserBalance")
  Future<BaseResult<UserBalanceAmountEntity>> umsUserBalance(
      @Body() Map<String, dynamic> map);

  @GET("/api/user/uploadPaymentPic")
  Future<BaseResult<UploadPaymentPicDataEntity>> uploadPaymentPic(@Part(name: "Picture") String uploadMap);

  @GET("/api/user/userPicture")
  Future<BaseResult<UploadPaymentPicDataEntity>> uploadUserPicture(@Part(name: "Picture") String uploadMap);

  @GET("/api/user/uploadQrCode ")
  Future<BaseResult<UploadPaymentPicDataEntity>> uploadPaymentQrcode(@Part(name: "Picture") String uploadMap);

  //  发送手机验证码
  @POST("/api/user/senSmsCode")
  Future<BaseResult<String>> senSmsCode(@Body() Map<String, dynamic> map);

  //  模拟派奖结果
  @GET("/api/simulationAward")
  Future<BaseResult<String>> simulationAward();

  ///GCPAY TmsSellOrderApiController

  @GET("/api/tmsSellOrder/cancel")
  Future<BaseResult<String>> cancel(@Body() Map<String, dynamic> map);

  @GET("/api/tmsSellOrder/confirm")
  Future<BaseResult<String>> sellorderConfirm(
      @Body() Map<String, dynamic> map);

  @GET("/api/tmsSellOrder/getTmsSellOrder")
  Future<BaseResult<List<TmsSellOrder>>> getTmsSellOrder(@Body() Map<String, dynamic> map);

  @GET("/api/tmsTradeOrder/getTmsTradeOrder")
  Future<BaseResult<List<TmsTradeOrder>>> getTmsTradeOrder(@Body() Map<String, dynamic> map);

  //挂单交易大厅，Pending Order Trading Floor
  @POST("/api/tmsSellOrder/list")
  Future<BaseResult<List<PendingOrderListDataEntity>>> orderLobbyList(
      @Body() Map<String, dynamic> map);


  ///GCPAY TmsTradeOrderApiController

  @GET("/api/tmsTradeOrder/buyersTransfer")
  Future<BaseResult<String>> buyersTransfer(@Body() Map<String, dynamic> map);

  //Buyer initiates an order
  @POST("/api/tmsTradeOrder/initiateOrder")
  Future<BaseResult<buy_order_entity>> initiateOrder(
      @Body() Map<String, dynamic> map);

  @GET("/api/tmsTradeOrder/queryOrder")
  Future<BaseResult<TmsTradeOrder>> queryOrder(@Body() Map<String, dynamic> map);

  @GET("/api/tmsTradeOrder/sellerConfirm")
  Future<BaseResult<String>> sellerConfirm(@Body() Map<String, dynamic> map);

  @GET("/api/tmsTradeOrder/sellersRelease")
  Future<BaseResult<String>> sellerRelease(@Body() Map<String, dynamic> map);

  @GET("/api/tmsSellOrder/getTmsSellAndTradeOrder")
  Future<BaseResult<HomePage_Record_entity>> homepageorderlist();

  @GET("/api/user/getSystemConfig")
  Future<BaseResult<system_config_entity>> systemConfig();

  @GET("/api/mmsMerchant/getTradeOrder")
  Future<BaseResult<merchant_order_entity>> getTradeOrder(@Body() Map<String, dynamic> map);

  @GET("/api/mmsMerchant/payConfirm")
  Future<BaseResult<String>> merchantOrderPayConfirm(@Body() Map<String, dynamic> map);

  @GET("/api/mmsMerchant/gcPayQr")
  Future<BaseResult<String>> merchantGetPayQr(@Body() Map<String, dynamic> map);

  @GET("/api/user/getUserDeviceLoginLog")
  Future<BaseResult<String>> getUserDeviceLogin(@Body() Map<String, dynamic> map);

  @GET("/api/user/delUserDeviceLoginLog")
  Future<BaseResult<String>> delUserDeviceLogin(@Body() Map<String, dynamic> map);

  @GET("/api/user/getUmsChange")
  Future<BaseResult<List<WalletHistoryDataEntity>>> getUmsChange(@Body() Map<String, dynamic> map);

  @GET("/api/user/getGoogleQrBarcodeUrl")
  Future<BaseResult<GoogleAuthDataEntity>> getGoogleQrCode();

  @POST("/api/user/bindVerificationCode")
  Future<BaseResult<String>> bindGoogleQrCode(@Body() Map<String, dynamic> map);

  @GET("/api/user/refreshToken")
  Future<BaseResult<String>> refreshImToken();

}
