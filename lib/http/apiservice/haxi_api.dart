import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:GCPay/business/exchange_page/Model/ExchangeRecord_Data_entity.dart';

import 'package:GCPay/constant/http_url.dart';
import 'package:retrofit/http.dart';

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
import '../dio_client.dart';
import '../interceptor/http_params_interceptor.dart';
import '../result/base_result.dart';
part 'haxi_api.g.dart';

@RestApi(baseUrl: HttpUrl.BASE_GCPAY_URL)
abstract class HaXiApi {
  factory HaXiApi({Dio? dio, String? baseUrl}) {
    dio ??= DioClient().dio;
    return _HaXiApi(dio, baseUrl: baseUrl);
  }

  ///修改密码
  @POST("/api/editPwd")
  Future<BaseResult<String>> editPwd(@Body() Map<String, dynamic> map);

  // 修改trc20地址
  @POST("/api/editTrc20")
  Future<BaseResult<String>> editTrc20(@Body() Map<String, dynamic> map);

  // 获取投注账户地址
  @GET("/api/getAccount")
  Future<BaseResult<List<BetAddressData>>> getAccount();

  // 活动图片
  @GET("/api/getBanner")
  Future<BaseResult<String>> getBanner();

  // 获取推广链接
  @GET("/api/getSubordinateAgentLink")
  Future<BaseResult<PromotionEntity>> getSubordinateAgentLink();

  // 查询投注记录
  @GET("/api/getTronInRecord")
  Future<BaseResult<List<BetRecordDataEntity>>> getTronInRecord(@Body() Map<String, dynamic> map);

  // 查询投注金额明细
  @GET("/api/getTronInRecordDetailed")
  Future<BaseResult<List<BetRecordTotalEntity>>> getTronInRecordBetAmount(@Body() Map<String, dynamic> map);

  // 查询投注中奖明细
  @GET("/api/getTronInRecordDetailed")
  Future<BaseResult<List<BetRecordBonusEntity>>> getTronInRecordBetBonus(@Body() Map<String, dynamic> map);

  // 查询下级投注历史明细
  @GET("/api/getTronInRecordDetailed")
  Future<BaseResult<List<BetRecordDetailDataEntity>>> getTronInRecordInferiorDetailed(@Body() Map<String, dynamic> map);

  // 查询投注金额统计
  @GET("/api/getTronInRecordAmountTotal")
  Future<BaseResult<BetRecordAmountTotal>> getTronInRecordAmountTotal(@Body() Map<String, dynamic> map);

  // 查询佣金提款记录
  @GET("/api/getTronOutRebateRecord")
  Future<BaseResult<List<RebateRecordDataEntity>>> getTronOutRebateRecord(@Body() Map<String, dynamic> map);

  //   查询提款记录
  @GET("/api/getBanner")
  Future<BaseResult<List<BetRecordDataEntity>>> getTronOutRecord(@Body() Map<String, dynamic> map);

  //   查询兑换记录
  @GET("/api/getTronOutExchangeRecord")
  Future<BaseResult<List<ExchangeRecordDataEntity>>> getTronOutExchangeRecord(@Body() Map<String, dynamic> map);

//    查询兑换记录
  @GET("/api/exchangeForecast")
  Future<BaseResult<List<ExchangeRateAmountEntity>>> exchangeForecast(@Body() Map<String, dynamic> map);

  // 玩家jwt登录
  @POST("/api/user/login")
  Future<BaseResult<LoginEntity>> login(@Body() Map<String, dynamic> map);

  //  玩家注册
  @POST("/api/user/register")
  Future<BaseResult<String>> register(@Body() Map<String, dynamic> map);

//   模拟派奖结果
  @GET("/api/simulationAward")
  Future<BaseResult<String>> simulationAward();
}
