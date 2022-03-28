import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/ui/component/component.dart';

import '../../core/util/util.dart';

class ComponentBottomsheet {
  
  static Future<String?> selectContact(List<Phone> listPhone, String contactName) {
    return showModalBottomSheet<String?>(
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25))
      ),
      context: navGK.currentContext!,
      builder: (BuildContext buildContext) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Component.textBold(
                contactName, 
                colors: PintuPayPalette.darkBlue, 
                fontSize: PintuPayConstant.fontSizeLargeExtra
              ),
              const SizedBox(height: 20,),
              Component.textDefault("Pilih salah satu nomer untuk melanjutkan"),
              const SizedBox(height: 20,),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: listPhone.map((e) => Container(
                  width: SizeConfig.blockSizeHorizontal * 100,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 0.5, color: Colors.black38),
                    )
                  ),
                  child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: PintuPayConstant.fontSizeLargeExtra,
                      color: PintuPayPalette.textGrey
                    ),
                  ),
                  child: Text(e.number.toString(), style: const TextStyle(color: PintuPayPalette.darkBlue),),
                  onPressed: () {
                    Navigator.pop(buildContext, e.number.replaceAll('-', '').replaceAll(' ', ''));
                  },
              ),
                )).toList(),
              ),
              const SizedBox(height: 30,),
              Component.button(
                label: "Batalkan", 
                onPressed: (){
                  Navigator.of(navGK.currentContext!).pop();
                }
              )
            ],
          ),
        );
      }
    );
  }

}