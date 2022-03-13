import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/ui/menu/pgn/model/pgn_inquiry_response.dart';
import 'package:pintupay/ui/menu/telephone_postpaid/model/telephone_payment_response.dart';

class PGNProvider {

  static Future<PGNInquiryResponse> inquiry(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: inquiry, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.pgnInquiry(body);
    return PGNInquiryResponse.fromJson(result.data);
  } 

  static Future<TelephonePaymentResponse> payment(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: inquiry, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.pgnPayment(body);
    return TelephonePaymentResponse.fromJson(result.data);
  } 

}