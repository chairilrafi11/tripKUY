import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pintupay/ui/menu/phone_postpaid/model/phone_postpaid_model.dart';

import '../../../../core/util/core_function.dart';
import '../../../../core/util/core_variable.dart';
import '../../../../core/util/size_config.dart';
import '../cubit/phone_postpaid_cubit.dart';
import 'inquiry_pasca.dart';

class PhonePostpaidView extends StatefulWidget {
  const PhonePostpaidView({Key? key}) : super(key: key);

  @override
  _PhonePostpaidViewState createState() => _PhonePostpaidViewState();
}

class _PhonePostpaidViewState extends State<PhonePostpaidView> {
  PhonePostpaidModel? tempdata;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController custCodeController = TextEditingController();

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
                Component.appBar("Pascabayar", transparet: true),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: Column(
                      children: [
                        // TextFormField(
                        //   // controller: phoneContactController,
                        //   controller: custCodeController,
                        //   decoration: Component.inputDecoration("No Pelanggan"),
                        //   maxLength: 16,
                        //   keyboardType: TextInputType.number,
                        //   inputFormatters: [
                        //     FilteringTextInputFormatter.digitsOnly,
                        //   ],
                        //   validator: (value) {
                        //     if (value?.isEmpty ?? true) {
                        //       return "Wajib diisi*";
                        //     }
                        //   },
                        // ),
                        inputNumber(),
                        const SizedBox(
                          height: 10,
                        ),
                        providerList(),
                        const SizedBox(
                          height: 20,
                        ),
                        Component.button(
                            label: "Cek Tagihan",
                            onPressed: () {
                              PhonePostpaidCubit().onInquiry(
                                custId: custCodeController.text,
                                providerName: tempdata?.product ?? '',
                              );
                            }),
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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Pascabayar'),
  //       backgroundColor: PintuPayPalette.green,
  //       elevation: 0,
  //     ),
  //     backgroundColor: PintuPayPalette.green,
  //     body: Container(
  //       padding: EdgeInsets.symmetric(
  //         vertical: SizeConfig.screenHeight * 0.03,
  //         horizontal: SizeConfig.screenWidth * 0.03,
  //       ),
  //       decoration: const BoxDecoration(
  //         color: PintuPayPalette.white,
  //         borderRadius: BorderRadius.vertical(
  //           top: Radius.circular(20.0),
  //         ),
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           ...inputArea(context),
  //           inquiryView(),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  List<Widget> inputArea(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Component.textBold(
          'Provider Pascabayar',
          colors: PintuPayPalette.darkBlue,
          fontSize: 15,
        ),
      ),
      providerList(),
      const SizedBox(
        height: 10,
      ),
      inputNumber(),
      Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(
          vertical: 25,
        ),
        child: InkWell(
          onTap: () {
            // var form = formKey.currentState;
            if (tempdata != null) {
              BlocProvider.of<PhonePostpaidCubit>(context).onInquiry(
                custId: custCodeController.text,
                providerName: tempdata?.product ?? '',
              );
            } else {
              CoreFunction.showToast('Provider Tidak Boleh Kosong');
            }
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: SizeConfig.blockSizeHorizontal * 80,
            decoration: BoxDecoration(
                borderRadius: CoreVariable.borderRadius10,
                color: PintuPayPalette.green),
            alignment: Alignment.center,
            child: Component.textBold('Cek Tagihan',
                colors: PintuPayPalette.white, fontSize: 15),
          ),
        ),
      ),
    ];
  }

  Widget inputNumber() {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      width: SizeConfig.screenWidth * 1,
      child: TextFormField(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: custCodeController,
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.done,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLength: 18,
        decoration: Component.inputDecoration("Kode Pelanggan"),
        validator: (value) {
          if (value == null) return 'Nomor Pelanggan Tidak Boleh Kosong';
          if (value.length < 8) return 'Nomor Pelanggan Harus Lebih dari 8';
          return null;
        },
      ),
    );
  }

  Widget inquiryView() {
    return BlocBuilder<PhonePostpaidCubit, PhonePostpaidState>(
      builder: (context, state) {
        if (state is InquirySuccess) {
          return InquiryPasca(
            responseInquiryPasca: state.responseInquiryPasca,
          );
        } else if (state is InquiryFailed) {
          return const SizedBox();
        } else if (state is InquiryLoading) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget providerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      width: SizeConfig.screenWidth * 1,
      child: BlocBuilder<PhonePostpaidCubit, PhonePostpaidState>(
        builder: (context, state) {
          if ((state.pascaProviders?.isNotEmpty ?? false)) {
            return DropdownButton<PhonePostpaidModel>(
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down_outlined),
                value: tempdata,
                underline: Container(
                  height: 1,
                  color: Colors.grey,
                ),
                hint: const Text(
                  'Pilih provider',
                  style: TextStyle(fontSize: 18),
                ),
                items: state.pascaProviders?.map((PhonePostpaidModel data) {
                  return DropdownMenuItem(
                    value: data,
                    child: Text(
                      data.name ?? '',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    tempdata = newValue;
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
