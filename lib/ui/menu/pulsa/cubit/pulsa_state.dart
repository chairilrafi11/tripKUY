part of 'pulsa_cubit.dart';

abstract class PulsaState extends Equatable {
  const PulsaState();

  @override
  List<Object> get props => [];
}

class PulsaInitial extends PulsaState {}

class PulsaLoading extends PulsaState {}

class PulsaLoaded extends PulsaState {
  
  final ResponsePulsa responsePulsa;
  final PulsaProviderResponse pulsaProviderResponse;

  const PulsaLoaded({
    required this.responsePulsa,
    required this.pulsaProviderResponse
  });

}

class PulsaEmpty extends PulsaState {}

class PulsaRecentNumber extends PulsaState {
  final List<RecentNumberResponse> listRecent;

  const PulsaRecentNumber({
    required this.listRecent
  });
}