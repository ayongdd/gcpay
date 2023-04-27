// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gcpay_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _GCPayApi implements GCPayApi {
  _GCPayApi(this._dio, {this.baseUrl}) {
    baseUrl ??= HttpUrl.BASE_GCPAY_URL;
  }

  final Dio _dio;

  String? baseUrl;


  String? loadToken() {
    final box = GetStorage();
    var jsonToken = box.read(CacheManagerKey.TOKEN.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonToken==null)
      {
        jsonToken = '';
      }
    return jsonToken;
  }

  String? loadVersion() {
    final box = GetStorage();
    var jsonToken = box.read(CacheManagerKey.VERSIONAME.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonToken==null)
    {
      jsonToken = '';
    }
    return jsonToken;
  }


  @override
  Future<BaseResult<String>> editTrc20(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
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
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
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
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
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
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
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
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
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
  Future<BaseResult<List<RebateRecordDataEntity>>> getTronOutRebateRecord(
      map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
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
  Future<BaseResult<List<BetRecordTotalEntity>>> getTronInRecordBetAmount(
      map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
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
  Future<BaseResult<List<BetRecordBonusEntity>>> getTronInRecordBetBonus(
      map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
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
  Future<BaseResult<List<BetRecordDetailDataEntity>>>
      getTronInRecordInferiorDetailed(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<BetRecordDetailDataEntity>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/getTronInRecordDetailed',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<BetRecordDetailDataEntity>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<BetRecordDetailDataEntity>((i) =>
              BetRecordDetailDataEntity.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResult<BetRecordAmountTotal>> getTronInRecordAmountTotal(
      map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<BetRecordAmountTotal>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
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
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
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
  Future<BaseResult<List<ExchangeRecordDataEntity>>> getTronOutExchangeRecord(
      map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<ExchangeRecordDataEntity>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/getTronOutExchangeRecord',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<ExchangeRecordDataEntity>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<ExchangeRecordDataEntity>((i) =>
              ExchangeRecordDataEntity.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  // @override
  Future<BaseResult<List<ExchangeRateAmountEntity>>> exchangeForecast(
      map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<ExchangeRateAmountEntity>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/exchangeForecast',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<ExchangeRateAmountEntity>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<ExchangeRateAmountEntity>((i) =>
              ExchangeRateAmountEntity.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  ///GCPAY ApiUserController

  @override
  Future<BaseResult<AddOrUpUmsPaymentData>> addorUpUmsPayment(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<AddOrUpUmsPaymentData>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/addOrUpUmsPayment',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<AddOrUpUmsPaymentData>.fromJson(
      _result.data!,
          (json) => AddOrUpUmsPaymentData.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<String> captcha(map) async {
    const _extra = <String, dynamic>{};
    var queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    queryParameters = map;
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/api/user/captcha',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<BaseResult<String>> delUmsPayment(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/delUmsPayment',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  Future<BaseResult<String>> editLoginPwds(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<UserChangingPassDataEntity>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/editLoginPwd',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
          (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResult<String>> editPayPwd(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/editPayPwd',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    if(_result.data!['data'] == null || _result.data!['data'] == 'null')
    {
      _result.data!['data'] = '';
    }
    final value = BaseResult<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResult<List<UmsPaymentSell>>> getUmsPayment() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<UmsPaymentSell>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/getUmsPayment',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<UmsPaymentSell>>.fromJson(
      _result.data!,
          (json) => (json as List<dynamic>)
          .map<UmsPaymentSell>(
              (i) => UmsPaymentSell.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResult<List<SiteInfoDataEntity>>> getZmsSitMailInfo(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<SiteInfoDataEntity>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/getZmsSitMailInfo',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<SiteInfoDataEntity>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<SiteInfoDataEntity>(
              (i) => SiteInfoDataEntity.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResult<String>> upZmsSitMailInfoReadStatus(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/upZmsSitMailInfoReadStatus',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
          (json) => json as String,
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
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<LoginEntity>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<LoginEntity>.fromJson(
      _result.data!,
      (json) => LoginEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<String>> realInfoAuthentication(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/realInfoAuthentication',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResult<UserRegistrationRespDataEntity>> register(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<UserRegistrationRespDataEntity>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/register',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<UserRegistrationRespDataEntity>.fromJson(
      _result.data!,
      (json) =>
          UserRegistrationRespDataEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<UserBalanceAmountEntity>> umsUserBalance(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<UserBalanceAmountEntity>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/umsUserBalance',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<UserBalanceAmountEntity>.fromJson(
      _result.data!,
      (json) => UserBalanceAmountEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<UploadPaymentPicDataEntity>> uploadPaymentPic(uploadMap) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _headers["version"] = loadVersion()!;
    _data.files.add(MapEntry(
        'picture',
        MultipartFile.fromFileSync(uploadMap,
            filename: uploadMap.split(Platform.pathSeparator).last)));

    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<UploadPaymentPicDataEntity>>(
            Options(method: 'POST', headers: _headers, extra: _extra,contentType: 'multipart/form-data')
                .compose(_dio.options, '/api/user/uploadPaymentPic',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<UploadPaymentPicDataEntity>.fromJson(
      _result.data!,
          (json) => UploadPaymentPicDataEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<UploadPaymentPicDataEntity>> uploadUserPicture(uploadMap) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _headers["version"] = loadVersion()!;
    _data.files.add(MapEntry(
        'picture',
        MultipartFile.fromFileSync(uploadMap,
            filename: uploadMap.split(Platform.pathSeparator).last)));

    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<UploadPaymentPicDataEntity>>(
            Options(method: 'POST', headers: _headers, extra: _extra,contentType: 'multipart/form-data')
                .compose(_dio.options, '/api/user/userPicture',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<UploadPaymentPicDataEntity>.fromJson(
      _result.data!,
          (json) => UploadPaymentPicDataEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<UploadPaymentPicDataEntity>> uploadPaymentQrcode(uploadMap) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _headers["version"] = loadVersion()!;
    _data.files.add(MapEntry(
        'picture',
        MultipartFile.fromFileSync(uploadMap,
            filename: uploadMap.split(Platform.pathSeparator).last)));

    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<UploadPaymentPicDataEntity>>(
            Options(method: 'POST', headers: _headers, extra: _extra,contentType: 'multipart/form-data')
                .compose(_dio.options, '/api/user/uploadQrCode',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<UploadPaymentPicDataEntity>.fromJson(
      _result.data!,
          (json) => UploadPaymentPicDataEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<UploadPaymentPicDataEntity>> realInfoPicture(uploadMap) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _headers["version"] = loadVersion()!;
    _data.files.add(MapEntry(
        'picture',
        MultipartFile.fromFileSync(uploadMap,
            filename: uploadMap.split(Platform.pathSeparator).last)));

    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<UploadPaymentPicDataEntity>>(
            Options(method: 'POST', headers: _headers, extra: _extra,contentType: 'multipart/form-data')
                .compose(_dio.options, '/api/user/realInfoPicture',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<UploadPaymentPicDataEntity>.fromJson(
      _result.data!,
          (json) => UploadPaymentPicDataEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<String>> senSmsCode(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _headers["version"] = loadVersion()!;
    queryParameters.addAll(map);
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<LoginEntity>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/senSmsCode',
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
    _headers["version"] = loadVersion()!;
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

  ///GCPAY TmsSellOrderApiController
  @override
  Future<BaseResult<String>> cancel(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/tmsSellOrder/cancel',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResult<String>> sellorderConfirm(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/tmsSellOrder/confirm',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
          (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResult<List<TmsSellOrder>>> getTmsSellOrder(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<TmsSellOrder>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/tmsSellOrder/getTmsSellOrder',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<TmsSellOrder>>.fromJson(
      _result.data!,
          (json) => (json as List<dynamic>)
          .map<TmsSellOrder>((i) =>
              TmsSellOrder.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResult<List<TmsTradeOrder>>> getTmsTradeOrder(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<TmsTradeOrder>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/tmsTradeOrder/getTmsTradeOrder',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<TmsTradeOrder>>.fromJson(
      _result.data!,
          (json) => (json as List<dynamic>)
          .map<TmsTradeOrder>((i) =>
              TmsTradeOrder.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  //挂单交易大厅，Pending Order Trading Floor
  @override
  Future<BaseResult<List<PendingOrderListDataEntity>>> orderLobbyList(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<PendingOrderListDataEntity>>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/tmsSellOrder/list',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<PendingOrderListDataEntity>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<PendingOrderListDataEntity>((i) =>
              PendingOrderListDataEntity.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  ///GCPAY TmsTradeOrderApiController

  @override
  Future<BaseResult<String>> buyersTransfer(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/tmsTradeOrder/buyersTransfer',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  //Buyer initiates an order
  @override
  Future<BaseResult<buy_order_entity>> initiateOrder(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<buy_order_entity>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/tmsTradeOrder/initiateOrder',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<buy_order_entity>.fromJson(
      _result.data!,
          (json) => buy_order_entity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<TmsTradeOrder>> queryOrder(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<TmsTradeOrder>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/tmsTradeOrder/queryOrder',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<TmsTradeOrder>.fromJson(
      _result.data!,
          (json) => TmsTradeOrder.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<String>> sellerConfirm(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/tmsTradeOrder/sellerConfirm',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResult<String>> sellerRelease(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/tmsTradeOrder/sellersRelease',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResult<HomePage_Record_entity>> homepageorderlist() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<HomePage_Record_entity>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/tmsSellOrder/getTmsSellAndTradeOrder',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<HomePage_Record_entity>.fromJson(
      _result.data!,
          (json) => HomePage_Record_entity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<system_config_entity>> systemConfig() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<system_config_entity>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/getSystemConfig',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<system_config_entity>.fromJson(
      _result.data!,
          (json) => system_config_entity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<merchant_order_entity>> getTradeOrder(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _headers.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<merchant_order_entity>>(
            Options(method: 'GET', headers: _headers, extra: _extra,)
                .compose(_dio.options, '/api/mmsMerchant/getTradeOrder?tradeNo='+_headers['tradeNo'],
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<merchant_order_entity>.fromJson(
      _result.data!,
          (json) => merchant_order_entity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<String>> merchantOrderPayConfirm(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/mmsMerchant/payConfirm',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
          (json) => json as String,
    );
    return value;
  }


  @GET("/api/mmsMerchant/gcPayQr")
  Future<BaseResult<String>> merchantGetPayQr(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/mmsMerchant/gcPayQr',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
          (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResult<String>> getUserDeviceLogin(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/getUserDeviceLoginLog',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
          (json) => json as String,
    );
    return value;
  }


  @override
  Future<BaseResult<String>> delUserDeviceLogin(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/delUserDeviceLoginLog',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
          (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResult<List<WalletHistoryDataEntity>>> getUmsChange(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<WalletHistoryDataEntity>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/getUmsChange?changeType='+map['changeType'].toString(),
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<WalletHistoryDataEntity>>.fromJson(
      _result.data!,
          (json) => (json as List<dynamic>)
          .map<WalletHistoryDataEntity>((i) =>
              WalletHistoryDataEntity.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }


  @override
  Future<BaseResult<String>> refreshImToken() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/refreshToken',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<String>.fromJson(
      _result.data!,
          (json) => json as String,
    );
    return value;
  }

  @override
  Future<BaseResult<GoogleAuthDataEntity>> getGoogleQrCode()
  async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<GoogleAuthDataEntity>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/getGoogleQrBarcodeUrl',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<GoogleAuthDataEntity>.fromJson(
      _result.data!,
          (json) => GoogleAuthDataEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<String>> bindGoogleQrCode(@Body() Map<String, dynamic> map)
  async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    _headers["Authorization"] = 'Bearer ' + loadToken()!;
    _headers["content-type"] = 'application/x-www-form-urlencoded';
    _headers["version"] = loadVersion()!;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/user/bindVerificationCode',
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
