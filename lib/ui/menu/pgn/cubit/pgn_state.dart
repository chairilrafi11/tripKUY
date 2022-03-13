part of 'pgn_cubit.dart';

abstract class PGNState extends Equatable {
  const PGNState();

  @override
  List<Object> get props => [];
}

class PGNInitial extends PGNState {}
