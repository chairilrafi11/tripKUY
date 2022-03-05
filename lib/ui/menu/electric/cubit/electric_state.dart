part of 'electric_cubit.dart';

abstract class ElectricState extends Equatable {
  const ElectricState();

  @override
  List<Object> get props => [];
}

class ElectricInitial extends ElectricState {}

class ElectricLoading extends ElectricState {}

class ElectricLoaded extends ElectricState {

  final ElectricTokenResponse electricTokenResponse;

  const ElectricLoaded({
    required this.electricTokenResponse
  });
}
