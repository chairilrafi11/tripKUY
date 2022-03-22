import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/balance/cubit/balance_cubit.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/topup/cubit/topup_cubit.dart';
import 'package:pintupay/ui/topup/view/topup_select_bank.dart';
import 'package:flutter/material.dart';

// class Balance extends StatelessWidget {
//   const Balance({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(Icons.money, color: PintuPayPalette.darkBlue, size: 30,),
//             const SizedBox(width: 10,),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Component.textDefault(
//                   "Saldo Anda", 
//                   colors: PintuPayPalette.textGrey,
//                   fontSize: 15
//                 ),
//                 Component.textBold(CoreFunction.moneyFormatter(authUsecase.userBox.totalBalance), fontSize: 20)
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


// class Poin extends StatelessWidget {
//   const Poin({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(Icons.gavel_outlined, color: Colors.amber, size: 30,),
//             const SizedBox(width: 10,),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Component.textDefault(
//                   "Poin anda", 
//                   colors: PintuPayPalette.textGrey,
//                   fontSize: 15
//                 ),
//                 Component.textBold("1000 POIN", fontSize: 20)
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class BalanceNew extends StatelessWidget {
  const BalanceNew({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: PintuPayPalette.darkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Component.textDefault(
                  "saldo anda", 
                  colors: PintuPayPalette.white,
                  fontSize: 15
                ),
                const SizedBox(height: 20,),
                BlocBuilder<BalanceCubit, BalanceState>(
                  builder: (context, state) {
                    if(state is BalanceLoading){
                      return const CircularProgressIndicator(color: PintuPayPalette.darkBlue,);
                    } else if(state is BalanceLoaded) {
                      return Component.textBold(CoreFunction.moneyFormatter(state.balance), fontSize: 25, colors: PintuPayPalette.white);
                    } else {
                      return Container();
                    }
                  },
                )
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: (){
                routePush(
                  BlocProvider(
                    create: (context) => TopupCubit(),
                    child: const TopupSelectbank(), 
                  ),
                  RouterType.material
                );
              },
              child: Card(
                color: PintuPayPalette.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add_outlined, color: Colors.white, size: 30,),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}