part of 'pdam_cubit.dart';

abstract class PdamState extends Equatable {
  const PdamState();

  @override
  List<Object> get props => [];
}

class PDAMInitial extends PdamState {}

class PDAMLoading extends PdamState {}

class PDAMLoaded extends PdamState {

  final List<PDAMDistricResponse> listDistric;
  final PDAMDistricResponse distric;

  const PDAMLoaded({
    required this.listDistric,
    required this.distric
  });

  @override
  List<Object> get props => [listDistric, distric];
}

