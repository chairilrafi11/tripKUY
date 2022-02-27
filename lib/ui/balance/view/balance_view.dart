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

class BalanceNew extends StatelessWidget {
  const BalanceNew({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: BenpayPalette.whiteBackground,
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
                  colors: BenpayPalette.textGrey,
                  fontSize: 15
                ),
                const SizedBox(height: 20,),
                Component.textBold("RP 200.000", fontSize: 25)
              ],
            ),
            const Spacer(),
            Card(
              color: BenpayPalette.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add_outlined, color: Colors.white, size: 30,),
              )
            ),
          ],
        ),
      ),
    );
  }
}