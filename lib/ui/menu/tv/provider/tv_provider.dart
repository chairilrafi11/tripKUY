import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/ui/menu/tv/model/tv_product_response.dart';

import '../model/tv_inquiry_request.dart';

class TVProvider {

  static Future<List<TvProductResponse>> products() async {
    List<TvProductResponse> list = [];
    var dio = await DioService.checkConnection(tryAgainMethod: products);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.tvProducts();
    for (var i = 0; i < result.data.length; i++) {
      list.add(TvProductResponse.fromJson(result.data[i]));
    }
    return list;
  } 

  static Future<TvInquiryRequest> inquiry(Map<String, dynamic> inquiryModel) async {
    var dio = await DioService.checkConnection(tryAgainMethod: inquiry, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.tvInquiry(inquiryModel);
    return TvInquiryRequest.fromJson(result.data);
  } 

  static Future<TvInquiryRequest> payment(Map<String, dynamic> inquiryModel) async {
    var dio = await DioService.checkConnection(tryAgainMethod: payment, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.tvPayment(inquiryModel);
    return TvInquiryRequest.fromJson(result.data);
  } 
}