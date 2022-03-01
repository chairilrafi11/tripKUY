// import 'package:etekad/core/core.dart';
// import 'package:etekad/core/database/box/user_box.dart';
// import 'package:etekad/ui/component/component.dart';
// import 'package:etekad/ui/login/view/login.dart';
// import 'package:etekad/ui/pin/cubit/pin_create_cubit.dart';
// import 'package:etekad/ui/verification/view/verificaton_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nav_router/nav_router.dart';

// class PinCreate extends StatefulWidget {

//   final VerificationType verificationType;
//   final UserBox userBox;

//   const PinCreate({ required this.userBox, required this.verificationType, Key? key }) : super(key: key);

//   @override
//   State<PinCreate> createState() => _PinCreateState();
// }

// class _PinCreateState extends State<PinCreate> {

//   final _formKey = GlobalKey<FormState>();
//   late PinCreateCubit pinCreateCubit;

//   @override
//   void initState() {
//     super.initState();
//     pinCreateCubit = PinCreateCubit(widget.userBox, widget.verificationType);
//   }

//   Future<bool> onWillPop(BuildContext context) {
//     if (ModalRoute.of(context)!.isFirst) {
//       pushAndRemoveUntil(Login(), RouterType.material);
//       return Future<bool>.value(false);
//     } else {
//       return Future<bool>.value(true);
//     }
//   }

//   Future<bool> onBack(BuildContext context) {
//     if (ModalRoute.of(context)!.isFirst) {
//       pushAndRemoveUntil(Login(), RouterType.material);
//       return Future<bool>.value(false);
//     } else {
//       Navigator.of(context).pop();
//       return Future<bool>.value(true);
//     }
//   }

//   static Widget otpKeyboardInputButton({String label = "", VoidCallback? onPressed, Color colors = EtekadPalette.white}) {
//     return Material(
//       color: Colors.transparent,
//       child: Card(
//         color: colors,
//         shape: RoundedRectangleBorder(
//           side: const BorderSide(color: EtekadPalette.green, width: 2),
//           borderRadius: BorderRadius.circular(100.0),
//         ),
//         child: InkWell(
//           onTap: onPressed,
//           borderRadius: BorderRadius.circular(100.0),
//           child: SizedBox(
//             height: SizeConfig.screenHeight * 0.1,
//             width: SizeConfig.screenHeight * 0.1,
//             child: Center(
//               child: Text(
//                 label,
//                 style: const TextStyle(
//                   fontSize: 30.0,
//                   color: EtekadPalette.green,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () => onWillPop(context),
//       child: Scaffold(
//         appBar: Component.appbarDefault(title: "PIN"),
//         body: Container(
//           color: EtekadPalette.green,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//             decoration: const BoxDecoration(
//               color: EtekadPalette.white,
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(20.0),
//                 topLeft: Radius.circular(20.0)
//               )
//             ),
//             child: ListView(
//               children: [
//                 SizedBox(height: SizeConfig.blockSizeHorizontal * 15),
//                 BlocProvider(
//                   create: (context) => pinCreateCubit,
//                   child: BlocBuilder<PinCreateCubit, PinCreateState>(
//                     builder: (context, state) {
//                       return Form(
//                         key: _formKey,
//                         child: Column(
//                           children: [
//                             Component.textBold(state.label, fontSize: 13, textAlign: TextAlign.center), 
//                             Container(
//                               margin: const EdgeInsets.symmetric(
//                                   vertical: 20, horizontal: 0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: <Widget>[
//                                   _otpTextField(state.digitOne),
//                                   _otpTextField(state.digitTwo),
//                                   _otpTextField(state.digitThree),
//                                   _otpTextField(state.digitFour),
//                                   _otpTextField(state.digitFive),
//                                   _otpTextField(state.digitSix),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   )
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: SizeConfig.blockSizeHorizontal * 0.1),
//                   child: Container(
//                     padding: EdgeInsets.only(
//                       top: SizeConfig.screenHeight * 0.03,
//                       bottom: SizeConfig.screenHeight * 0.02
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         Flexible(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: <Widget>[
//                               otpKeyboardInputButton(
//                                 colors: Colors.white,
//                                 label: "1",
//                                 onPressed: () {
//                                   pinCreateCubit.inputDigit(1);
//                                 }
//                               ),
//                               otpKeyboardInputButton(
//                                 colors: Colors.white,
//                                 label: "2",
//                                 onPressed: () {
//                                   pinCreateCubit.inputDigit(2);
//                                 }
//                               ),
//                               otpKeyboardInputButton(
//                                 colors: Colors.white,
//                                 label: "3",
//                                 onPressed: () {
//                                   pinCreateCubit.inputDigit(3);
//                                 }
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(padding: EdgeInsets.only(bottom: SizeConfig.blockSizeHorizontal * 1)),
//                         Flexible(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: <Widget>[
//                               otpKeyboardInputButton(
//                                 colors: Colors.white,
//                                 label: "4",
//                                 onPressed: () {
//                                   pinCreateCubit.inputDigit(4);
//                                 }
//                               ),
//                               otpKeyboardInputButton(
//                                 colors: Colors.white,
//                                 label: "5",
//                                 onPressed: () {
//                                   pinCreateCubit.inputDigit(5);
//                                 }
//                               ),
//                               otpKeyboardInputButton(
//                                 colors: Colors.white,
//                                 label: "6",
//                                 onPressed: () {
//                                   pinCreateCubit.inputDigit(6);
//                                 }
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(padding: EdgeInsets.only(bottom: SizeConfig.blockSizeHorizontal * 1)),
//                         Flexible(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: <Widget>[
//                               otpKeyboardInputButton(
//                                 colors: Colors.white,
//                                 label: "7",
//                                 onPressed: () {
//                                   pinCreateCubit.inputDigit(7);
//                                 }
//                               ),
//                               otpKeyboardInputButton(
//                                 colors: Colors.white,
//                                 label: "8",
//                                 onPressed: () {
//                                   pinCreateCubit.inputDigit(8);
//                                 }
//                               ),
//                               otpKeyboardInputButton(
//                                 colors: Colors.white,
//                                 label: "9",
//                                 onPressed: () {
//                                   pinCreateCubit.inputDigit(9);
//                                 }
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(padding: EdgeInsets.only(bottom: SizeConfig.blockSizeHorizontal * 1)),
//                         Flexible(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: <Widget>[
//                               GestureDetector(
//                                 onTap: () => onBack(context),
//                                 child: const SizedBox(
//                                   width: 80.0,
//                                   child: Text(
//                                     "Cancel",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: EtekadPalette.orange,
//                                       fontSize: 15
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               otpKeyboardInputButton(
//                                 colors: EtekadPalette.white,
//                                 label: "0",
//                                 onPressed: () {
//                                   pinCreateCubit.inputDigit(0);
//                                 }
//                               ),
//                               InkWell(
//                                 onTap: pinCreateCubit.deleteDigit,
//                                 borderRadius: BorderRadius.circular(40.0),
//                                 child: Container(
//                                   height: 80.0,
//                                   width: 80.0,
//                                   decoration: const BoxDecoration(
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: const Center(
//                                     child: Icon(
//                                       Icons.backspace,
//                                       color: EtekadPalette.green,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _otpTextField(int? digit) {
//     return Container(
//       width: SizeConfig.blockSizeHorizontal * 12,
//       padding: const EdgeInsets.all(5),
//       height: SizeConfig.blockSizeHorizontal * 15,
//       alignment: Alignment.center,
//       child: digit == -1
//         ? const Icon(
//             Icons.lock,
//             color: EtekadPalette.green,
//             size: 40,
//           )
//         : const Icon(
//             Icons.lock_open,
//             color: EtekadPalette.green,
//             size: 40,
//           ),
//     );
//   }
// }
