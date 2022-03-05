part of 'phone_postpaid_cubit.dart';

abstract class PhonePostpaidState extends Equatable {
  final List<PhonePostpaidModel>? pascaProviders;

  const PhonePostpaidState(this.pascaProviders);
}

class PascaEmpty extends PhonePostpaidState {
  const PascaEmpty() : super(null);

  @override
  List<Object> get props => [];
}

class PascaInitial extends PhonePostpaidState {
  const PascaInitial({
    required List<PhonePostpaidModel>? pascaProviders,
  }) : super(pascaProviders);

  @override
  List<Object> get props => [];
}

class InquirySuccess extends PhonePostpaidState {
  final ResponseInquiryPhonePaid? responseInquiryPasca;

  const InquirySuccess({
    required List<PhonePostpaidModel>? pascaProviders,
    required this.responseInquiryPasca,
  }) : super(pascaProviders);

  @override
  List<Object?> get props => [responseInquiryPasca];
}

class InquiryFailed extends PhonePostpaidState {
  final String errorMessage;

  const InquiryFailed({
    required List<PhonePostpaidModel>? pascaProviders,
    required this.errorMessage,
  }) : super(pascaProviders);

  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class InquiryLoading extends PhonePostpaidState {
  const InquiryLoading({
    List<PhonePostpaidModel>? pascaProviders,
  }) : super(pascaProviders);

  @override
  List<Object> get props => [];
}
