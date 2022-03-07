part of 'topup_cubit.dart';

abstract class TopupState extends Equatable {
  const TopupState();

  @override
  List<Object> get props => [];
}

class TopupInitial extends TopupState {}

class TopupLoading extends TopupState {}

class TopupLoaded extends TopupState {
  
  final List<BankResponse> listBank;

  const TopupLoaded({
    required this.listBank
  });
  
}
