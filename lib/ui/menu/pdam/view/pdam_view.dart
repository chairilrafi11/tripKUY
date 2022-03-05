import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/util/core_function.dart';
import '../../../../core/util/size_config.dart';
import '../cubit/pdam_cubit.dart';
import '../model/district_pdam.dart';

class PDAMView extends StatefulWidget {
  const PDAMView({Key? key}) : super(key: key);

  @override
  _PDAMViewState createState() => _PDAMViewState();
}

class _PDAMViewState extends State<PDAMView> {
  DistrictPDAM? tempData;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController custCode = TextEditingController();

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
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          // controller: phoneContactController,
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
                        districtList(),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 25),
                          child: InkWell(
                            onTap: () {
                              if (tempData != null) {
                                BlocProvider.of<PdamCubit>(context).onInquiry(
                                  customerId: custCode.text,
                                  selectedDistrict: tempData,
                                );
                              } else {
                                CoreFunction.showToast(
                                    'Provider Tidak Boleh Kosong');
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
                        // // TextFormField(
                        // //   // controller: phoneContactController,
                        // //   decoration: Component.decorationNoBorder("Wilayah"),
                        // //   maxLength: 16,
                        // //   keyboardType: TextInputType.number,
                        // //   inputFormatters: [
                        // //     FilteringTextInputFormatter.digitsOnly,
                        // //   ],
                        // //   validator: (value) {
                        // //     if (value?.isEmpty ?? true) {
                        // //       return "Wajib diisi*";
                        // //     }
                        // //   },
                        // // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // Component.button(
                        //     label: "Cek Tagihan", onPressed: () {}),
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

  Widget inputNumber() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      width: SizeConfig.screenWidth * 1,
      child: TextFormField(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: custCode,
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
          if ((state.pdamDistricts?.isNotEmpty ?? false)) {
            return DropdownButton<DistrictPDAM>(
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down_outlined),
                value: tempData,
                underline: Container(
                  height: 1,
                  color: Colors.grey,
                ),
                hint: const Text(
                  'Pilih Daerah',
                  style: TextStyle(fontSize: 14),
                ),
                items: state.pdamDistricts?.map((DistrictPDAM data) {
                  return DropdownMenuItem(
                    value: data,
                    child: Text(
                      data.description ?? '',
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    tempData = newValue;
                  });
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
