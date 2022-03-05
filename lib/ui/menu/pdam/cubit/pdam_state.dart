part of 'pdam_cubit.dart';

abstract class PdamState extends Equatable {
  final List<DistrictPDAM>? pdamDistricts;

  const PdamState(this.pdamDistricts);
}

class PdamEmpty extends PdamState {
  const PdamEmpty() : super(null);

  @override
  List<Object?> get props => [];
}

class PdamInitial extends PdamState {
  const PdamInitial(
      List<DistrictPDAM>? pdamDistricts,
      ) : super(pdamDistricts);

  @override
  List<Object> get props => [];
}

class InquirySuccess extends PdamState {
  final ResponseInquiryPDAM? responseInquiryPDAM;

  const InquirySuccess({
    required List<DistrictPDAM>? pdamDistricts,
    required this.responseInquiryPDAM,
  }) : super(pdamDistricts);

  @override
  List<Object?> get props => [responseInquiryPDAM];
}

class InquiryFailed extends PdamState {
  final String errorMessage;

  const InquiryFailed({
    required List<DistrictPDAM>? pdamDistricts,
    required this.errorMessage,
  }) : super(pdamDistricts);

  @override
  List<Object> get props => [
    errorMessage,
  ];
}

class InquiryLoading extends PdamState {
  const InquiryLoading({
    List<DistrictPDAM>? pdamDistricts,
  }) : super(pdamDistricts);

  @override
  List<Object> get props => [];
}
