part of 'game_detail_cubit.dart';

abstract class GameDetailState extends Equatable {
  const GameDetailState();

  @override
  List<Object> get props => [];
}

class GameDetailInitial extends GameDetailState {}

class GameDetailLoaded extends GameDetailState {

  final GameProductResponse gameProductResponse;

  const GameDetailLoaded({
    required this.gameProductResponse
  });
}

class GameDetailLoading extends GameDetailState {}

class GameDetailEmpty extends GameDetailState {}
