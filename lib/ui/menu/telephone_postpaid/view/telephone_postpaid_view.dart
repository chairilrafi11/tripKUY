import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pintupay/ui/menu/telephone_postpaid/cubit/telephone_cubit.dart';

class TelephonePostpaid extends StatelessWidget {

  TelephonePostpaid({ Key? key }) : super(key: key);

  final TextEditingController phonenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Component.header(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: PintuPayConstant.paddingHorizontalScreen),
            child: ListView(
              children: [    
                Component.appBar("Telephone", transparet: true),
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
                          decoration: Component.inputDecoration("Nomor Telephone"),
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
                          onPressed: (){
                            TelephoneCubit().onInquiry(phonenumberController.text);
                          }
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