import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/ui/menu/bpjs/model/bpjs_inquiry_response.dart';

class BPJSProvider {

  static Future<BPJSInquiryResponse> inquiry(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: inquiry, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.bpjsInquiry(body);
    return BPJSInquiryResponse.fromJson(result.data);
  } 

  static Future<BPJSInquiryResponse> payment(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: inquiry, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.bpjsInquiry(body);
    return BPJSInquiryResponse.fromJson(result.data);
  } 

}