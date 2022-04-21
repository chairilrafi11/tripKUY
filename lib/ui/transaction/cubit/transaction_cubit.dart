import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/ui/transaction/model/response_transaction.dart';
import 'package:pintupay/ui/transaction/provider/transaction_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionLoading()){
    onGetTransactionList();
  }

  final RefreshController successController = RefreshController();
  final RefreshController pendingController = RefreshController();
  final RefreshController failedController = RefreshController();
  int page = 1;

  Future onGetTransactionList({bool isLoadMore = false}) async {

    final List<ResponseTransaction> listSuccess = [];
    final List<ResponseTransaction> listPending = [];
    final List<ResponseTransaction> listFailed = [];

    if(isLoadMore){
      page += 1;
    } else {
      emit(TransactionLoading());
    }

    var list = await Transactionprovider.list(page: page);

    if (list.isNotEmpty) {
      successController.footerMode!.value = LoadStatus.canLoading;
      successController.loadComplete();
      pendingController.footerMode!.value = LoadStatus.canLoading;
      pendingController.loadComplete();
      failedController.footerMode!.value = LoadStatus.canLoading;
      failedController.loadComplete();
    } else {
      successController.footerMode!.value = LoadStatus.noMore;
      successController.loadNoData();
      pendingController.footerMode!.value = LoadStatus.noMore;
      pendingController.loadNoData();
      failedController.footerMode!.value = LoadStatus.noMore;
      failedController.loadNoData();
    }

    successController.refreshCompleted();

    for (var element in list) {
      if(
        element.statusCode == PintuPayConstant.transactionPending || 
        element.statusCode == PintuPayConstant.transactionWaitingApproval
      ){
        listPending.add(element);
      } else if (
        element.statusCode == PintuPayConstant.transactionSuccess ||
        element.statusCode == PintuPayConstant.transactionApproved
      ) {
        listSuccess.add(element);
      } else if (element.statusCode == PintuPayConstant.transactionfailed) {
        listFailed.add(element);
      } else {

      }
    }

    if (isLoadMore) {
      TransactionLoaded transactionLoaded = state as TransactionLoaded;
      emit(TransactionLoaded(
        listTransactionSuccess: transactionLoaded.listTransactionSuccess + listSuccess,
        listTransactionPending: transactionLoaded.listTransactionPending + listPending,
        listTransactionFailed: transactionLoaded.listTransactionFailed + listFailed,
        successController: successController,
        pendingController: pendingController,
        failedController: failedController
      ));
    } else {
      emit(TransactionLoaded(
        listTransactionSuccess: listSuccess,
        listTransactionPending: listPending,
        listTransactionFailed: listFailed,
        successController: successController,
        pendingController: pendingController,
        failedController: failedController
      ));
    }
  }

  void onSearch(String keySearch){

    emit(TransactionLoading());
    
    TransactionLoaded transactionLoaded = state as TransactionLoaded;

    List<ResponseTransaction> listSuccess = transactionLoaded.listTransactionSuccess;
    List<ResponseTransaction> listPending = transactionLoaded.listTransactionPending;
    List<ResponseTransaction> listFailed = transactionLoaded.listTransactionFailed;

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
      listTransactionFailed: listFailed,
      successController: successController,
      pendingController: pendingController,
      failedController: failedController
    ));

  }
}
