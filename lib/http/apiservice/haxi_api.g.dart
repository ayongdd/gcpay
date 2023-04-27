// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'haxi_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _HaXiApi implements HaXiApi {
  _HaXiApi(this._dio, {this.baseUrl}) {
    baseUrl ??= HttpUrl.BASE_GCPAY_URL;
  }

  final Dio _dio;

  String? baseUrl;

  String? loadToken() {
    final box = GetStorage();
    var jsonToken = box.read(CacheManagerKey.TOKEN.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    return jsonToken;
  }

  @override
  Future<BaseResult<String>> editPwd(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer '+loadToken()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/editPwd',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResult<String>> editTrc20(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer '+loadToken()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/editTrc20',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResult<List<BetAddressData>>> getAccount() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<BetAddressData>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/getAccount',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<BetAddressData>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<BetAddressData>(
              (i) => BetAddressData.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResult<String>> getBanner() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/getBanner',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResult<PromotionEntity>> getSubordinateAgentLink() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _headers["Authorization"] = 'Bearer '+loadToken()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<PromotionEntity>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/getSubordinateAgentLink',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<PromotionEntity>.fromJson(
      _result.data!,
          (json) => PromotionEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<List<BetRecordDataEntity>>> getTronInRecord(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};

    _data.addAll(map);
    _headers["Authorization"] = 'Bearer '+loadToken()!;
    final _result = await _dio.fetch<Map<String, dynamic>> (
        _setStreamType<BaseResult<List<BetRecordDataEntity>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/getTronInRecord',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<BetRecordDataEntity>>.fromJson(
      _result.data!,
          (json) => (json as List<dynamic>)
          .map<BetRecordDataEntity>(
              (i) => BetRecordDataEntity.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResult<List<RebateRecordDataEntity>>> getTronOutRebateRecord(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer '+loadToken()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<RebateRecordDataEntity>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/getTronOutRebateRecord',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<RebateRecordDataEntity>>.fromJson(
      _result.data!,
          (json) => (json as List<dynamic>)
          .map<RebateRecordDataEntity>(
              (i) => RebateRecordDataEntity.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResult<List<BetRecordTotalEntity>>> getTronInRecordBetAmount(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer '+loadToken()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<BetRecordTotalEntity>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/getTronInRecordDetailed',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<BetRecordTotalEntity>>.fromJson(
      _result.data!,
          (json) => (json as List<dynamic>)
          .map<BetRecordTotalEntity>(
              (i) => BetRecordTotalEntity.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResult<List<BetRecordBonusEntity>>> getTronInRecordBetBonus(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer '+loadToken()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<BetRecordBonusEntity>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/getTronInRecordDetailed',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<BetRecordBonusEntity>>.fromJson(
      _result.data!,
          (json) => (json as List<dynamic>)
          .map<BetRecordBonusEntity>(
              (i) => BetRecordBonusEntity.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResult<List<BetRecordDetailDataEntity>>> getTronInRecordInferiorDetailed(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer '+loadToken()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<BetRecordDetailDataEntity>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/getTronInRecordDetailed',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<BetRecordDetailDataEntity>>.fromJson(
      _result.data!,
          (json) => (json as List<dynamic>)
          .map<BetRecordDetailDataEntity>(
              (i) => BetRecordDetailDataEntity.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResult<BetRecordAmountTotal>> getTronInRecordAmountTotal(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer '+loadToken()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<BetRecordAmountTotal>>(
            Options(method: 'POST', headers: _headers, extra: _extra,)
                .compose(_dio.options, '/api/getTronInRecordAmountTotal',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<BetRecordAmountTotal>.fromJson(
      _result.data!,
          (json) => BetRecordAmountTotal.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<List<BetRecordDataEntity>>> getTronOutRecord(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer '+loadToken()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<BetRecordDataEntity>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/getTronOutRecord',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<BetRecordDataEntity>>.fromJson(
      _result.data!,
          (json) => (json as List<dynamic>)
          .map<BetRecordDataEntity>(
              (i) => BetRecordDataEntity.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResult<List<ExchangeRecordDataEntity>>> getTronOutExchangeRecord(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer '+loadToken()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<ExchangeRecordDataEntity>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/getTronOutExchangeRecord',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<ExchangeRecordDataEntity>>.fromJson(
      _result.data!,
    (json) => (json as List<dynamic>)
        .map<ExchangeRecordDataEntity>(
    (i) => ExchangeRecordDataEntity.fromJson(i as Map<String, dynamic>))
        .toList(),
    );
    return value;
  }

  // @override
  Future<BaseResult<List<ExchangeRateAmountEntity>>> exchangeForecast(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer '+loadToken()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<ExchangeRateAmountEntity>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/exchangeForecast',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<ExchangeRateAmountEntity>>.fromJson(
      _result.data!,
          (json) => (json as List<dynamic>)
          .map<ExchangeRateAmountEntity>(
              (i) => ExchangeRateAmountEntity.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResult<LoginEntity>> login(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<LoginEntity>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<LoginEntity>.fromJson(
      _result.data!,
      (json) => LoginEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<String>> register(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/register',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResult<String>> simulationAward() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/simulationAward',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
