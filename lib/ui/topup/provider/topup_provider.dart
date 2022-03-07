import 'package:pintupay/ui/topup/model/bank_response.dart';
import 'package:pintupay/ui/topup/model/topup_request_response.dart';

import '../../../core/network/network.dart';

class TopupProvider {

  static Future<List<BankResponse>> bank() async {
    List<BankResponse> list = [];
    var dio = await DioService.checkConnection(tryAgainMethod: bank);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.banks();
    for (var i = 0; i < result.data.length; i++) {
      list.add(BankResponse.fromJson(result.data[i]));
    }
    return list;
  } 

  static Future<TopupRequestResponse> request(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: request, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.topupRequest(body);
    return TopupRequestResponse.fromJson(result.data);
  } 

  static Future confirm(Map<String, dynamic> body) async {
    var dio = await DioService.checkConnection(tryAgainMethod: confirm, isLoading: true);
    DioClient dioClient = DioClient(dio);
    var result = await dioClient.topupConfirm(body);
  } 

}