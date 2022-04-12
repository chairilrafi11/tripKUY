import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/menu/tv/cubit/tv_cubit.dart';
import 'package:pintupay/ui/menu/tv/model/tv_product_response.dart';

import '../../../../core/pintupay/pintupay.dart';

class TvView extends StatelessWidget {
  TvView({ Key? key }) : super(key: key);

  
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController idController = TextEditingController();

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
                Component.appBar("TV & Internet", transparet: true),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Component.textBold("No. Pelanggan", textAlign: TextAlign.start),
                          const SizedBox(height: 16,),
                          TextFormField(
                            controller: idController,
                            decoration: Component.decorationNoBorder("contoh: 1234567890"),
                            maxLength: 16,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Wajib diisi*";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          districtList(),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(vertical: 25),
                            child: InkWell(
                              onTap: () {
                                if(formKey.currentState!.validate()){
                                  // BlocProvider.of<PdamCubit>(context).onInquiry(idController.text);
                                }
                              },
                              child: Container(
                                width: SizeConfig.blockSizeHorizontal * 100,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                decoration: const BoxDecoration(
                                  color: PintuPayPalette.darkBlue,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                child: Component.textBold(
                                  'Tagihan',
                                  colors: PintuPayPalette.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget inputNumber() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      width: SizeConfig.screenWidth * 1,
      child: TextFormField(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: idController,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          maxLength: 18,
          decoration:
              Component.inputDecoration("Kode Pelanggan", hintText: "12345")),
    );
  }

  Widget districtList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      width: SizeConfig.screenWidth * 1,
      child: BlocBuilder<TvCubit, TvState>(
        builder: (context, state) {
          if ((state is TvLoaded)) {
            return DropdownButton<TvProductResponse>(
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down_outlined),
              value: state.product,
              underline: Container(
                height: 1,
                color: PintuPayPalette.darkBlue,
              ),
              hint: Component.textDefault("Pilih Provider"),
              items: state.listProduct.map((TvProductResponse data) {
                return DropdownMenuItem(
                  value: data,
                  child: Text(
                    data.name ?? 'Pilih Provider',
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                BlocProvider.of<TvCubit>(context).setProduct(newValue!);
              }
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}