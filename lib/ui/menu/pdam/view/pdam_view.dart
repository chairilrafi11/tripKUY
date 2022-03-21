import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pintupay/ui/menu/pdam/model/pdam_disctric_response.dart';

import '../../../../core/util/core_function.dart';
import '../../../../core/util/size_config.dart';
import '../cubit/pdam_cubit.dart';

class PDAMView extends StatelessWidget {
  PDAMView({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController idController = TextEditingController();

  final PdamCubit pdamCubit = PdamCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Component.header(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: PintuPayConstant.paddingHorizontalScreen),
            child: ListView(
              children: [
                Component.appBar("PDAM", transparet: true),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: idController,
                            decoration:
                                Component.decorationNoBorder("No Pelanggan"),
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
                          const SizedBox(
                            height: 10,
                          ),
                          BlocProvider(
                            create: (context) => pdamCubit,
                            child: districtList(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(vertical: 25),
                            child: InkWell(
                              onTap: () {
                                // pdamCubit.onInquiry(idController.text);
                                if(formKey.currentState!.validate()){
                                  pdamCubit.onInquiry(idController.text);
                                }
                              },
                              child: Container(
                                width: SizeConfig.blockSizeHorizontal * 100,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: const BoxDecoration(
                                    color: PintuPayPalette.darkBlue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0))),
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
      child: BlocBuilder<PdamCubit, PdamState>(
        builder: (context, state) {
          if ((state is PDAMLoaded)) {
            return DropdownButton<PDAMDistricResponse>(
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down_outlined),
                value: state.distric,
                underline: Container(
                  height: 1,
                  color: PintuPayPalette.darkBlue,
                ),
                hint: Component.textDefault("Pilih daerah"),
                items: state.listDistric.map((PDAMDistricResponse data) {
                  return DropdownMenuItem(
                    value: data,
                    child: Text(
                      data.description ?? 'Pilih daerah',
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  pdamCubit.setDistric(newValue!);
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
