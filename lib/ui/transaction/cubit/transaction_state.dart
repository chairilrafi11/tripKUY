part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionLoaded extends TransactionState {

  final List<ResponseTransaction> listTransactionSuccess;
  final List<ResponseTransaction> listTransactionPending;
  final List<ResponseTransaction> listTransactionFailed;
  final RefreshController successController;
  final RefreshController pendingController;
  final RefreshController failedController;

  const TransactionLoaded({
    required this.listTransactionSuccess,
    required this.listTransactionPending,
    required this.listTransactionFailed,
    required this.successController,
    required this.pendingController,
    required this.failedController
  });

  @override
  List<Object> get props => [
    listTransactionSuccess, 
    listTransactionPending, 
    listTransactionFailed,
    successController,
    pendingController,
    failedController
  ];
}
