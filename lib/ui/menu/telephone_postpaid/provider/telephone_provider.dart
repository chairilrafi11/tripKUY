import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/ui/menu/telephone_postpaid/model/telephone_inquiry_response.dart';
import 'package:pintupay/ui/menu/telephone_postpaid/model/telephone_payment_response.dart';

class TelephoneProvider {

  static Future<TelephoneInquiryResponse> inquiry(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: inquiry, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.telephoneInquiry(body);
    return TelephoneInquiryResponse.fromJson(result.data);
  } 

  static Future<TelephonePaymentResponse> payment(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: inquiry, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.telephonePayment(body);
    return TelephonePaymentResponse.fromJson(result.data);
  } 

}