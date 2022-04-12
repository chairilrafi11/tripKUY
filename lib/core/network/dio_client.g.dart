// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _DioClient implements DioClient {
  _DioClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CoreModel> banner() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v1/advertises',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> area(query) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'query': query};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/areas',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> checkPhoneNumber(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/v6/registration/agent/phones',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> registerOtp(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/v6/registration/agent/otp',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> registerForm(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v6/registration/agents',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> registerVerif(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v6/registration/activations',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> loginSessions(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v6/session/agents',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> pulsaProduct(phoneNumber, authToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'phone_number': phoneNumber,
      r'auth_token': authToken
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/products',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> pulsaProvider(phoneNumber, authToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'phone_number': phoneNumber,
      r'auth_token': authToken
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/products/provider_icon',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> pulsaPayment(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/transactions',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> transactionList(authToken, page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'auth_token': authToken,
      r'page' : page
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v1/transactions',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> profile(authToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v1/users/${authToken}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> empneyProvider() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/emoney/provider_emoney',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> empneyProviderDetail(providerId, authToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'provider_id': providerId,
      r'auth_token': authToken
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/emoney/products',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> emoneyPayment(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/emoney/transactions',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> bpjsInquiry(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/inquiry/bpjs',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> bpjsPayment(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/payment/bpjs',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> telephoneInquiry(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/inquiry/telkoms',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> telephonePayment(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/payment/telkoms',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> electricToken(authToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'auth_token': authToken};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/product_token',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> pdamProduct(authToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'auth_token': authToken};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v1/pdam_products',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> pdamInquiry(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/inquiry/pdams',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> pdamPayment(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/payment/pdams',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> pasbayarProduct(authToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'auth_token': authToken};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/ppob/cellulars/pasca_products',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> pasbayarInquiry(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/inquiry/cellulars',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> pascabayarPayment(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/payment/cellulars',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> banks() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/bank_accounts/get_bank',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> topupRequest(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v6/topup/transactions',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> topupConfirm(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v6/topup/confirms',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> electricPostpaidInquiry(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/inquiry/plns',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> electricPostpaidPayment(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/payment/plns',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> electricPrepaidInquiry(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/inquiry/pln_prepaids',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> electricPrepaidPayment(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/payment/pln_prepaids',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> phonePostpaidProvider(authToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'auth_token': authToken};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/ppob/cellulars/pasca_products',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> phonePostpaidInquiry(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/inquiry/cellulars',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> phonePostpaidPayment(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/payment/cellulars',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> pgnInquiry(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v6/ppob/inquiry/pgns',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> pgnPayment(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v6/ppob/payment/pgns',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> menus(authToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'auth_token': authToken};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v3/android_menus',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> gameProvider() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/game/provider_games',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> updatePIN(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v6/account/pin',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> checkPIN(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v1/users/{user_id}/get_pin',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> logout() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/sessions/{auth_token}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> changePassword(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v6/account/credential',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> gameProviderDetail(providerId, authToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'provider_id': providerId,
      r'auth_token': authToken
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/game/get_list_games',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> gamePayment(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/transactions',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> recommended() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/get_data_recomended_product',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> requestOTPForgotPassword(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v6/reset/passwords',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> requestForgotPassword(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v6/reset/passwords',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> helpDesk() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v1/helpdesk',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> recentNumber(authToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'auth_token': authToken};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/pulsa/recent_numbers',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> recentNumberPPOB(authToken, type) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'auth_token': authToken,
      r'type': type
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/recent_numbers',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> tvProducts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v2/ppob/tv/tv_products',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> tvInquiry(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/inquiry/tvs',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> tvPayment(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'v7/ppob/payment/tvs',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
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
