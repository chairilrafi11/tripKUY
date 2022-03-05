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
  Future<CoreModel> sample() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoreModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

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
                .compose(_dio.options, ' v6/transactions',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoreModel> transactionList(authToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'auth_token': authToken};
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

  @override
  Future<List<DistrictPDAM>> getProductPDAM() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseInquiryPDAM>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'v1/pdam_products',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));

    List<DistrictPDAM> value = <DistrictPDAM>[];
    for (var element in _result.data!['products']) {
      value.add(DistrictPDAM.fromJson(element as Map<String, dynamic>));
    }
    return value;
  }

  @override
  Future<ResponseInquiryPDAM> inquiryPDAM(Map<String, dynamic> body) {
    // TODO: implement inquiryPDAM
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> transactionPDAM(TransactionPDAM body) {
    // TODO: implement transactionPDAM
    throw UnimplementedError();
  }

  @override
  Future<List<PhonePostpaidModel>> getProductCellularsPasca() {
    // TODO: implement getProductCellularsPasca
    throw UnimplementedError();
  }

  @override
  Future<ResponseInquiryPhonePaid> inquiryCellularsPasca(Map<String, dynamic> body) {
    // TODO: implement inquiryCellularsPasca
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> transactionCellularsPasca(Map<String, dynamic> body) {
    // TODO: implement transactionCellularsPasca
    throw UnimplementedError();
  }
}
