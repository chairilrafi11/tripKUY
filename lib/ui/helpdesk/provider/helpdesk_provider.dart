import 'package:pintupay/core/network/dio_client.dart';
import 'package:pintupay/core/network/dio_service.dart';

import '../model/helpdesk_response.dart';

class HelpdeskProvider {
  
  static Future<List<HelpDeskResponse>> fetchData() async {
    List<HelpDeskResponse> list = [];
    await DioService.checkConnection(tryAgainMethod: fetchData).then((value) async {
      DioClient dioClient = DioClient(value);
      var response = await dioClient.helpDesk();
      for (var i = 0; i < response.data; i++) {
        list.add(HelpDeskResponse.fromJson(response.data[i]));
      }
    });
    return list;
  }
}