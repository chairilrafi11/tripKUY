part of 'phone_postpaid_cubit.dart';

abstract class PhonePostpaidState extends Equatable {

  const PhonePostpaidState();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class PhonePostpaidInitial extends PhonePostpaidState {}

class PhonePostpaidLoading extends PhonePostpaidState {}

class PhonePostpaidLoaded extends PhonePostpaidState {

  final List<PhonePostpaidProviderResponse> listProvider;
  final PhonePostpaidProviderResponse phonePostpaidProviderResponse;

  const PhonePostpaidLoaded({
    required this.listProvider,
    required this.phonePostpaidProviderResponse
  });
}
