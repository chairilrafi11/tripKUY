import 'package:pintupay/core/network/network.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/ui/transaction/model/response_transaction.dart';

class Transactionprovider {

  static Future<List<ResponseTransaction>> list() async {
    List<ResponseTransaction> list = [];
    var dio = await DioService.checkConnection(tryAgainMethod: list);
    DioClient dioClient = DioClient(dio);
    var transactionData = await dioClient.transactionList(authUsecase.responseLogin.authToken ?? "");
    for (var i = 0; i < transactionData.data.length; i++) {
      list.add(ResponseTransaction.fromJson(transactionData.data[i]));
    }
    return list;
  } 

}