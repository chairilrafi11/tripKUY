import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/ui/transaction/model/response_transaction.dart';
import 'package:pintupay/ui/transaction/provider/transaction_provider.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future onGetTransactionList() async {
    List<ResponseTransaction> listTransactionSuccess = [];
    List<ResponseTransaction> listTransactionPending = [];
    List<ResponseTransaction> listTransactionFailed = [];

    emit(TransactionLoading());

    var result = await Transactionprovider.list();
    for (var element in result) {
      if(element.statusCode == PintuPayConstant.transactionPending){
        listTransactionPending.add(element);
      } else if (element.statusCode == PintuPayConstant.transactionSuccess) {
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
}
