import 'package:pintupay/core/pintupay/pintupay_endpoint.dart';
import 'package:dio/dio.dart';
import 'package:pintupay/ui/verification/view/check_phone_number.dart';
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
  Future<CoreModel> pulsaProduct(
    @Query('phone_number') String phoneNumber, 
    @Query('auth_token') String authToken
  );

  @GET(PintuPayEndpoint.pulsaProvider)
  Future<CoreModel> pulsaProvider(
    @Query('phone_number') String phoneNumber, 
    @Query('auth_token') String authToken
  );

  @POST(PintuPayEndpoint.pulsaPayment)
  Future<CoreModel> pulsaPayment(@Body() Map<String, dynamic> body);

  @GET(PintuPayEndpoint.transactionList)
  Future<CoreModel> transactionList(
    @Query('auth_token') String authToken
  );

  @GET(PintuPayEndpoint.profile)
  Future<CoreModel> profile(
    @Path('auth_token') String authToken
  );

  @GET(PintuPayEndpoint.emoneyProvider)
  Future<CoreModel> empneyProvider();

  @GET(PintuPayEndpoint.emoneyProvider)
  Future<CoreModel> empneyProviderDetail(
    @Query('provider_id') String providerId, 
    @Query('auth_token') String authToken
  );

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

}
