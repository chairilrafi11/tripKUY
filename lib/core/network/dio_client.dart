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
}
