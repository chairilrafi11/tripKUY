part of 'pin_cubit.dart';

class PinState extends Equatable {

  final int digitOne;
  final int digitTwo;
  final int digitThree;
  final int digitFour;
  final int digitFive;
  final int digitSix;

  const PinState({
    this.digitOne = -1,
    this.digitTwo = -1,
    this.digitThree = -1,
    this.digitFour = -1,
    this.digitFive = -1,
    this.digitSix = -1,
  });

  @override
  List<Object> get props => [digitOne, digitTwo, digitThree, digitFour, digitFive, digitSix];
}
