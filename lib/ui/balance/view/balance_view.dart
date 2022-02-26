import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:flutter/material.dart';

class Balance extends StatelessWidget {
  const Balance({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.money, color: BenpayPalette.darkBlue, size: 30,),
            const SizedBox(width: 10,),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Component.textDefault(
                  "Saldo Anda", 
                  colors: BenpayPalette.textGrey,
                  fontSize: 15
                ),
                Component.textBold("RP. 20.000", fontSize: 20)
              ],
            )
          ],
        ),
      ),
    );
  }
}


class Poin extends StatelessWidget {
  const Poin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.gavel_outlined, color: Colors.amber, size: 30,),
            const SizedBox(width: 10,),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Component.textDefault(
                  "Poin anda", 
                  colors: BenpayPalette.textGrey,
                  fontSize: 15
                ),
                Component.textBold("1000 POIN", fontSize: 20)
              ],
            )
          ],
        ),
      ),
    );
  }
}