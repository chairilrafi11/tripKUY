// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:etekad/core/database/box/user_box.dart';
// import 'package:etekad/core/database/etekad_database.dart';
// import 'package:etekad/core/util/util.dart';
// import 'package:etekad/ui/approval/cubit/approval_cubit.dart';
// import 'package:etekad/ui/approval/view/approval.dart';
// import 'package:etekad/ui/profile/provider/profile_provider.dart';
// import 'package:etekad/ui/update_password/model/confirm_pin.dart';
// import 'package:etekad/ui/update_password/provider/update_password_provider.dart';
// import 'package:etekad/ui/verification/view/verificaton_page.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nav_router/nav_router.dart';

// part 'pin_create_state.dart';

// class PinCreateCubit extends Cubit<PinCreateState> {
//   UserBox userBox;
//   VerificationType verificationType;

//   PinCreateCubit(this.userBox, this.verificationType)
//       : super(const PinCreateState());

//   int digitOne = -1;
//   int digitTwo = -1;
//   int digitThree = -1;
//   int digitFour = -1;
//   int digitFive = -1;
//   int digitSix = -1;
//   String pin = "";
//   String confirmPin = "";

//   inputDigit(int digit) {
//     if (digitOne == -1) {
//       digitOne = digit;
//     } else if (digitTwo == -1) {
//       digitTwo = digit;
//     } else if (digitThree == -1) {
//       digitThree = digit;
//     } else if (digitFour == -1) {
//       digitFour = digit;
//     } else if (digitFive == -1) {
//       digitFive = digit;
//     } else if (digitSix == -1) {
//       digitSix = digit;
//       var otpCode = digitOne.toString() +
//           digitTwo.toString() +
//           digitThree.toString() +
//           digitFour.toString() +
//           digitFive.toString() +
//           digitSix.toString();

//       checkCode(otpCode);
//     }

//     emit(PinCreateState(
//       label: state.label,
//       digitOne: digitOne,
//       digitTwo: digitTwo,
//       digitThree: digitThree,
//       digitFour: digitFour,
//       digitFive: digitFive,
//       digitSix: digitSix,
//     ));
//   }

//   clear() {
//     digitOne = -1;
//     digitTwo = -1;
//     digitThree = -1;
//     digitFour = -1;
//     digitFive = -1;
//     digitSix = -1;
//   }

//   deleteDigit() {
//     if (digitSix != -1) {
//       digitSix = -1;
//     } else if (digitFive != -1) {
//       digitFive = -1;
//     } else if (digitFour != -1) {
//       digitFour = -1;
//     } else if (digitThree != -1) {
//       digitThree = -1;
//     } else if (digitTwo != -1) {
//       digitTwo = -1;
//     } else if (digitOne != -1) {
//       digitOne = -1;
//     }

//     emit(PinCreateState(
//       label: "",
//       digitOne: digitOne,
//       digitTwo: digitTwo,
//       digitThree: digitThree,
//       digitFour: digitFour,
//       digitFive: digitFive,
//       digitSix: digitSix,
//     ));
//   }

//   Future checkCode(String otp) async {
//     if (pin == "") {
//       pin = otp;
//       clear();
//       emit(PinCreateState(
//         label: "Konfirmasi PIN",
//         digitOne: digitOne,
//         digitTwo: digitTwo,
//         digitThree: digitThree,
//         digitFour: digitFour,
//         digitFive: digitFive,
//         digitSix: digitSix,
//       ));
//     } else if (confirmPin == "") {
//       confirmPin = otp;
//       var pinCreateResponse = await UpdatePasswordProvider.createPin(
//           PinCreate(pin: pin, confirmPin: confirmPin));
//       if (pinCreateResponse.status == "success") {
//         var user = await ProfileProvider.profile();
//         if (verificationType == VerificationType.import) {
//           EtekadDatabase.saveUser(userBox);
//           pushAndRemoveUntil(
//               BlocProvider(
//                 create: (context) =>
//                     ApprovalCubit(VerificationType.import, userBox),
//                 child: Approval(userBox: userBox),
//               ),
//               RouterType.material);
//         } else {
//           CoreFunction.checkStatus(user, verificationType);
//         }
//       } else {
//         pin = "";
//         confirmPin = "";
//         clear();
//         emit(PinCreateState(
//           label: "Silahkan Buat PIN",
//           digitOne: digitOne,
//           digitTwo: digitTwo,
//           digitThree: digitThree,
//           digitFour: digitFour,
//           digitFive: digitFive,
//           digitSix: digitSix,
//         ));
//       }
//     }
//   }
// }
