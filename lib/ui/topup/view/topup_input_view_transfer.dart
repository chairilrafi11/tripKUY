// import 'package:intl/intl.dart';
// import 'package:nav_router/nav_router.dart';
// import 'package:pintupay/core/pintupay/pintupay_palette.dart';
// import 'package:pintupay/core/pintupay/pintupay_constant.dart';
// import 'package:pintupay/ui/component/component.dart';
// import 'package:pintupay/ui/topup/model/bank_response.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pintupay/ui/topup/view/topup_confirm_bsi.dart';
//
// class TopupInputViewTransfer extends StatefulWidget {
//   final BankResponse bankResponse;
//
//   const TopupInputViewTransfer({required this.bankResponse, Key? key}) : super(key: key);
//
//   @override
//   State<TopupInputViewTransfer> createState() => _TopupInputViewTransferState();
// }
//
// class _TopupInputViewTransferState extends State<TopupInputViewTransfer> {
//   final TextEditingController nomController = TextEditingController();
//
//   final TextEditingController nameController = TextEditingController();
//
//   final TextEditingController noController = TextEditingController();
//
//   bool bsiTopup = false;
//
//   bool bankTransfer = false;
//
//   String _formatNumber(String s) => NumberFormat.decimalPattern('id')
//       .format(int.parse(s.replaceAll('.', '').replaceAll(',', '')));
//
//   void changeBsiTopup(value) {
//     setState(() {
//       bsiTopup = value;
//     });
//   }
//
//   void changeBankTransfer(value) {
//     setState(() {
//       bankTransfer = value;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: PintuPayPalette.white,
//       body: Stack(
//         children: [
//           Component.header(),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: PintuPayConstant.paddingHorizontalScreen),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Component.appBar("Topup", transparet: true),
//                 Card(
//                   margin: const EdgeInsets.symmetric(vertical: 10),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 30, horizontal: 20),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Component.textBold("Jumlah Topup",
//                             fontSize: PintuPayConstant.fontSizeLargeExtra),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         TextFormField(
//                           controller: nomController,
//                           onChanged: (value) {
//                             if (value.isNotEmpty) {
//                               value = _formatNumber(value
//                                   .replaceAll(',', '')
//                                   .replaceAll('.', ''));
//                               nomController.value = TextEditingValue(
//                                 text: value,
//                                 selection: TextSelection.collapsed(
//                                     offset: value.length),
//                               );
//                             }
//                           },
//                           decoration: Component.inputDecoration("Nominal"),
//                           maxLength: 7,
//                           autofocus: true,
//                           keyboardType: TextInputType.number,
//                           textInputAction: TextInputAction.next,
//                           inputFormatters: [
//                             FilteringTextInputFormatter.digitsOnly,
//                             FilteringTextInputFormatter.deny(RegExp(r'^0+')),
//                           ],
//                           validator: (value) {
//                             if (value?.isEmpty ?? true) {
//                               return "Wajib diisi*";
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             const Icon(
//                               Icons.info,
//                               color: PintuPayPalette.darkBlue,
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Component.textDefault(
//                                 "Mininal nominal Topup adalah 50.000",
//                                 fontSize: PintuPayConstant.fontSizeMedium)
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Checkbox(
//                                 activeColor: PintuPayPalette.darkBlue,
//                                 value: bsiTopup,
//                                 onChanged: (value) => changeBsiTopup(value)),
//                             const Flexible(
//                               child: Text(
//                                 "BSI",
//                                 style: TextStyle(
//                                     fontSize: 12, color: Colors.black),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Checkbox(
//                                 activeColor: PintuPayPalette.darkBlue,
//                                 value: bankTransfer,
//                                 onChanged: (value) =>
//                                     changeBankTransfer(value)),
//                             const Flexible(
//                               child: Text(
//                                 "Via Bank Transfer",
//                                 style: TextStyle(
//                                     fontSize: 12, color: Colors.black),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Component.textBold("Formulir Akun Bank",
//                             fontSize: PintuPayConstant.fontSizeLargeExtra),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         TextFormField(
//                           // controller: phoneContactController,
//                           decoration:
//                           Component.inputDecoration("Nama Pemilik Bank"),
//                           maxLength: 30,
//                           autofocus: true,
//                           keyboardType: TextInputType.text,
//                           textInputAction: TextInputAction.next,
//                           validator: (value) {
//                             if (value?.isEmpty ?? true) {
//                               return "Wajib diisi*";
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         TextFormField(
//                           // controller: phoneContactController,
//                           decoration:
//                           Component.inputDecoration("Nomer Rekening Bank"),
//                           maxLength: 16,
//                           autofocus: true,
//                           keyboardType: TextInputType.number,
//                           textInputAction: TextInputAction.done,
//                           inputFormatters: [
//                             FilteringTextInputFormatter.digitsOnly,
//                           ],
//                           validator: (value) {
//                             if (value?.isEmpty ?? true) {
//                               return "Wajib diisi*";
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Flexible(
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               const Icon(
//                                 Icons.info,
//                                 color: PintuPayPalette.darkBlue,
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Flexible(
//                                 child: Component.textDefault(
//                                     "Masukan informasi bank yang digunakan untuk mentrasfer",
//                                     fontSize: PintuPayConstant.fontSizeMedium,
//                                     maxLines: 2),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: Component.button(
//                       label: "Lanjutkan",
//                       onPressed: () {
//                         routePush(
//                             const TopupConfirmNew(), RouterType.cupertino);
//                       }),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
