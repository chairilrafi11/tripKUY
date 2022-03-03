import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/ui/transaction/model/response_transaction.dart';
import 'package:pintupay/ui/transaction/provider/transaction_provider.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future onGetTransactionList() async {
    emit(TransactionLoading());
    var result = await Transactionprovider.list();
    emit(TransactionLoaded(listTransaction: result));
  }
}
