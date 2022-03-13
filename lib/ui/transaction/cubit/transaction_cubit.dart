import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/ui/transaction/model/response_transaction.dart';
import 'package:pintupay/ui/transaction/provider/transaction_provider.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionLoading()){
    onGetTransactionList();
  }

  List<ResponseTransaction> listTransactionSuccess = [];
  List<ResponseTransaction> listTransactionPending = [];
  List<ResponseTransaction> listTransactionFailed = [];

  Future onGetTransactionList() async {

    var list = await Transactionprovider.list();
    for (var element in list) {
      if(
        element.statusCode == PintuPayConstant.transactionPending || 
        element.statusCode == PintuPayConstant.transactionWaitingApproval
      ){
        listTransactionPending.add(element);
      } else if (
        element.statusCode == PintuPayConstant.transactionSuccess ||
        element.statusCode == PintuPayConstant.transactionApproved
      ) {
        listTransactionSuccess.add(element);
      } else if (element.statusCode == PintuPayConstant.transactionfailed) {
        listTransactionFailed.add(element);
      } else {

      }
    }

    emit(TransactionLoaded(
      listTransactionSuccess: listTransactionSuccess,
      listTransactionPending: listTransactionPending,
      listTransactionFailed: listTransactionFailed
    ));
  }

  void onSearch(String keySearch){

    emit(TransactionLoading());

    List<ResponseTransaction> listSuccess = listTransactionSuccess;
    List<ResponseTransaction> listPending = listTransactionPending;
    List<ResponseTransaction> listFailed = listTransactionFailed;

    listSuccess.removeWhere((element) {
      return !element.messages!.contains(keySearch);
    });

    listPending.removeWhere((element) {
      return !element.messages!.contains(keySearch);
    });

    listFailed.removeWhere((element) {
      return !element.messages!.contains(keySearch);
    });

    emit(TransactionLoaded(
      listTransactionSuccess: listSuccess, 
      listTransactionPending: listPending, 
      listTransactionFailed: listFailed
    ));

  }
}
