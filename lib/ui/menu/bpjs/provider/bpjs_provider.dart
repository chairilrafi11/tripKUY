import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/ui/menu/bpjs/model/bpjs_inquiry_response.dart';
import 'package:pintupay/ui/menu/bpjs/model/bpjs_payment_response.dart';
import 'package:pintupay/ui/menu/pulsa/model/recent_number_response.dart';

class BPJSProvider {

  static Future<BPJSInquiryResponse> inquiry(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: inquiry, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.bpjsInquiry(body);
    return BPJSInquiryResponse.fromJson(result.data);
  } 

  static Future<BPJSPaymentResponse> payment(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: inquiry, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.bpjsPayment(body);
    return BPJSPaymentResponse.fromJson(result.data);
  } 

  static Future<List<RecentNumberResponse>> recentNumber(String type) async {
    var dio = await DioService.checkConnection(tryAgainMethod: recentNumber, isLoading: false);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.recentNumberPPOB(authUsecase.userBox.authToken!, type);
    List<RecentNumberResponse> list = [];
    result.data.forEach((v) {
      list.add(RecentNumberResponse.fromJson(v));
    });
    return list;
  }

}