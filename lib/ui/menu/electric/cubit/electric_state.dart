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
  final List<RecentNumberResponse> listRecent;

  const ElectricLoaded({
    required this.electricTokenResponse,
    required this.listRecent
  });
}
class ElectricEmpty extends ElectricState {}
