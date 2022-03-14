part of 'game_cubit.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}
class GameInitial extends GameState {}

class GameLoading extends GameState {}

class GameLoaded extends GameState {

  final List<GameProviderResponse> list;

  const GameLoaded({
    required this.list
  });
}
