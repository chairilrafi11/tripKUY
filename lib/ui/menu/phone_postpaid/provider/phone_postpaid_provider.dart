import 'package:pintupay/core/network/network.dart';

class PhonePostpaidProvider {
  static sample() async {
    await DioService.checkConnection(tryAgainMethod: sample).then((dio) async {
      var dioClient = DioClient(dio);
      var dataSample = await dioClient.banner();
    });
  }
}