import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/util/core_function.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pintupay/ui/menu/bpjs/cubit/bpjs_cubit.dart';
import 'package:pintupay/ui/menu/bpjs/model/bpjs_inquiry_model.dart';

class BPJSView extends StatelessWidget {

  BPJSView({ Key? key }) : super(key: key);

  final TextEditingController idController = TextEditingController();
  final TextEditingController monthController = TextEditingController();

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
                Component.appBar("BPJS", transparet: true),
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
                          controller: idController,
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
                          controller: monthController,
                          decoration: Component.inputDecoration("Periode"),
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
                            BpjsCubit().onInquiry(
                              idController.text,
                              monthController.text
                            );
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