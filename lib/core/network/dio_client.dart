import 'package:pintupay/core/pintupay/pintupay_endpoint.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'model/core_model.dart';

part 'dio_client.g.dart';

@RestApi(baseUrl: '')
abstract class DioClient {
  factory DioClient(Dio dio, {String baseUrl}) = _DioClient;

  @GET(PintuPayEndpoint.sample)
  Future<CoreModel> sample();

  @GET(PintuPayEndpoint.banner)
  Future<CoreModel> banner();

  @GET(PintuPayEndpoint.area)
  Future<CoreModel> area(@Query('query') String query);

  @POST(PintuPayEndpoint.checkPhoneRegist)
  Future<CoreModel> checkPhoneNumber(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.otpPhoneRegist)
  Future<CoreModel> registerOtp(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.formRegis)
  Future<CoreModel> registerForm(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.verifPhone)
  Future<CoreModel> registerVerif(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.sessions)
  Future<CoreModel> loginSessions(@Body() Map<String, dynamic> body);

  @GET(PintuPayEndpoint.pulsaProduct)
  Future<CoreModel> pulsaProduct(@Query('phone_number') String phoneNumber,
      @Query('auth_token') String authToken);

  @GET(PintuPayEndpoint.pulsaProvider)
  Future<CoreModel> pulsaProvider(@Query('phone_number') String phoneNumber,
      @Query('auth_token') String authToken);

  @POST(PintuPayEndpoint.pulsaPayment)
  Future<CoreModel> pulsaPayment(@Body() Map<String, dynamic> body);

  @GET(PintuPayEndpoint.transactionList)
  Future<CoreModel> transactionList(@Query('auth_token') String authToken);

  @GET(PintuPayEndpoint.profile)
  Future<CoreModel> profile(@Path('auth_token') String authToken);

  @GET(PintuPayEndpoint.emoneyProvider)
  Future<CoreModel> empneyProvider();

  @GET(PintuPayEndpoint.emoneyProvider)
  Future<CoreModel> empneyProviderDetail(
    @Query('provider_id') String providerId,
    @Query('auth_token') String authToken
  );

  @POST(PintuPayEndpoint.emoneyPayment)
  Future<CoreModel> emoneyPayment(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.bpjsInuiqry)
  Future<CoreModel> bpjsInquiry(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.bpjsPayment)
  Future<CoreModel> bpjsPayment(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.telephoneInquiry)
  Future<CoreModel> telephoneInquiry(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.telephoneInquiry)
  Future<CoreModel> telephonePayment(@Body() Map<String, dynamic> body);

  @GET(PintuPayEndpoint.listrikToken)
  Future<CoreModel> electricToken(@Query('auth_token') String authToken);

  @GET(PintuPayEndpoint.pdamProduct)
  Future<CoreModel> pdamProduct(@Query('auth_token') String authToken);

  @POST(PintuPayEndpoint.pdamInquiry)
  Future<CoreModel> pdamInquiry(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.pdamPayment)
  Future<CoreModel> pdamPayment(@Body() Map<String, dynamic> body);

  @GET(PintuPayEndpoint.pascabayarProduct)
  Future<CoreModel> pasbayarProduct(@Query('auth_token') String authToken);

  @POST(PintuPayEndpoint.phonePostpaidInquiry)
  Future<CoreModel> pasbayarInquiry(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.phonePostpaidPayment)
  Future<CoreModel> pascabayarPayment(@Body() Map<String, dynamic> body);

  @GET(PintuPayEndpoint.bank)
  Future<CoreModel> banks();

  @POST(PintuPayEndpoint.topupRequest)
  Future<CoreModel> topupRequest(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.topupConfirm)
  Future<CoreModel> topupConfirm(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.listrikPostpaidInquiry)
  Future<CoreModel> electricPostpaidInquiry(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.listrikPostpaidPayment)
  Future<CoreModel> electricPostpaidPayment(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.listrikPrepaidInquiry)
  Future<CoreModel> electricPrepaidInquiry(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.listrikPrepaidPayment)
  Future<CoreModel> electricPrepaidPayment(@Body() Map<String, dynamic> body);

  @GET(PintuPayEndpoint.phonePostpaidProvider)
  Future<CoreModel> phonePostpaidProvider(@Query('auth_token') String authToken);

  @POST(PintuPayEndpoint.phonePostpaidInquiry)
  Future<CoreModel> phonePostpaidInquiry(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.phonePostpaidPayment)
  Future<CoreModel> phonePostpaidPayment(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.pgnInquiry)
  Future<CoreModel> pgnInquiry(@Body() Map<String, dynamic> body);

  @POST(PintuPayEndpoint.pgnPayment)
  Future<CoreModel> pgnPayment(@Body() Map<String, dynamic> body);

  @GET(PintuPayEndpoint.menus)
  Future<CoreModel> menus(@Query('auth_token') String authToken);

  @GET(PintuPayEndpoint.gameProvider)
  Future<CoreModel> gameProvider();

  @GET(PintuPayEndpoint.gameProduct)
  Future<CoreModel> gameProviderDetail(
    @Query('provider_id') String providerId,
    @Query('auth_token') String authToken
  );
}
