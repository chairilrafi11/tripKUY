import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/ui/menu/pdam/model/pdam_disctric_response.dart';
import 'package:pintupay/ui/menu/pdam/model/pdam_inquiry_response.dart';

class PDAMProvider {

  static Future<List<PDAMDistricResponse>> distric() async {
    List<PDAMDistricResponse> list = [];
    var dio = await DioService.checkConnection(tryAgainMethod: distric);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.pdamProduct(authUsecase.userBox.authToken ?? "");
    for (var i = 0; i < result.data.length; i++) {
      list.add(PDAMDistricResponse.fromJson(result.data[i]));
    }
    return list;
  } 

  static Future<PDAMInquiryResponse> inquiry(Map<String, dynamic> inquiryModel) async {
    var dio = await DioService.checkConnection(tryAgainMethod: distric, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.pdamInquiry(inquiryModel);
    return PDAMInquiryResponse.fromJson(result.data);
  } 

  static Future<PDAMInquiryResponse> payment(Map<String, dynamic> inquiryModel) async {
    var dio = await DioService.checkConnection(tryAgainMethod: distric, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.pdamPayment(inquiryModel);
    return PDAMInquiryResponse.fromJson(result.data);
  } 
}