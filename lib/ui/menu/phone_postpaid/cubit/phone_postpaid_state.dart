part of 'phone_postpaid_cubit.dart';

abstract class PhonePostpaidState extends Equatable {
  const PhonePostpaidState();

  @override
  List<Object> get props => [];
}

class PascabayarInitial extends PhonePostpaidState {}

class PascabayarLoading extends PhonePostpaidState {}

class PascabayarLoaded extends PhonePostpaidState {
  final List<PascabayarProviderResponse> listProvider;
  final PascabayarProviderResponse provider;

  const PascabayarLoaded({required this.listProvider, required this.provider});

  @override
  List<Object> get props => [listProvider, provider];
}
