import 'package:benpay/core/util/constant.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhonePostpaidView extends StatelessWidget {
  const PhonePostpaidView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Component.header(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: BenpayConstant.paddingHorizontalScreen),
            child: ListView(
              children: [    
                Component.appBar("Pascabayar", transparet: true),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          // controller: phoneContactController,
                          decoration: Component.inputDecoration("No Pelanggan"),
                          maxLength: 16,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return "Wajib diisi*";
                            }
                          },
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          // controller: phoneContactController,
                          decoration: Component.inputDecoration("Provider"),
                          maxLength: 16,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return "Wajib diisi*";
                            }
                          },
                        ),
                        const SizedBox(height: 20,),
                        Component.button(
                          label: "Cek Tagihan",
                          onPressed: (){}
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}