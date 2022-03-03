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

  const PulsaLoaded({
    required this.responsePulsa
  });

}
