import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';

part 'pin_state.dart';

class PinCubit extends Cubit<PinState> {

  PinCubit() : super(const PinState());

  int digitOne = -1;
  int digitTwo = -1;
  int digitThree = -1;
  int digitFour = -1;
  int digitFive = -1;
  int digitSix = -1;

  inputDigit(int digit){
    if (digitOne == -1) {
      digitOne = digit;
    } else if (digitTwo == -1) {
      digitTwo = digit;
    } else if (digitThree == -1) {
      digitThree = digit;
    } else if (digitFour == -1) {
      digitFour = digit;
    } else if (digitFive == -1) {
      digitFive = digit;
    } else if (digitSix == -1) {
      digitSix = digit;
      var otpCode = digitOne.toString() +
        digitTwo.toString() +
        digitThree.toString() +
        digitFour.toString() +
        digitFive.toString() +
        digitSix.toString();

      checkCode(otpCode);
    }
    
    emit(PinState(
      digitOne: digitOne, 
      digitTwo: digitTwo,
      digitThree: digitThree,
      digitFour: digitFour,
      digitFive: digitFive,
      digitSix: digitSix,
    ));
  }

  deleteDigit() {
    if (digitSix != -1) {
      digitSix = -1;
    } else if (digitFive != -1) {
      digitFive = -1;
    } else if (digitFour != -1) {
      digitFour = -1;
    } else if (digitThree != -1) {
      digitThree = -1;
    } else if (digitTwo != -1) {
      digitTwo = -1;
    } else if (digitOne != -1) {
      digitOne = -1;
    }

    emit(PinState(
      digitOne: digitOne, 
      digitTwo: digitTwo,
      digitThree: digitThree,
      digitFour: digitFour,
      digitFive: digitFive,
      digitSix: digitSix,
    ));
  }

  Future checkCode(String otp) async {
    Navigator.of(navGK.currentContext!).pop(otp);
  }

}
