import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:pintupay/ui/menu/phone_postpaid/model/phone_postpaid_provider_response.dart';

import '../../../../core/util/size_config.dart';
import '../cubit/phone_postpaid_cubit.dart';

class PhonePostpaidView extends StatefulWidget {
  const PhonePostpaidView({Key? key}) : super(key: key);

  @override
  _PhonePostpaidViewState createState() => _PhonePostpaidViewState();
}

class _PhonePostpaidViewState extends State<PhonePostpaidView> {

  PhonePostpaidProviderResponse? phonePostpaidProviderResponse;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController custCodeController = TextEditingController();
  final PhonePostpaidCubit phonePostpaidCubit = PhonePostpaidCubit();

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
                        TextFormField(
                          // controller: phoneContactController,
                          controller: custCodeController,
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
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocProvider(
                          create: (context) => phonePostpaidCubit,
                          child: providerList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Component.button(
                          label: "Cek Tagihan",
                          onPressed: () {
                            phonePostpaidCubit.onInquiry(
                              custCodeController.text,
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

  Widget providerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      width: SizeConfig.screenWidth * 1,
      child: BlocBuilder<PhonePostpaidCubit, PhonePostpaidState>(
        builder: (context, state) {
          if (state is PhonePostpaidLoaded) {
            return DropdownButton<PhonePostpaidProviderResponse>(
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down_outlined),
              value: phonePostpaidProviderResponse,
              underline: Container(
                height: 1,
                color: PintuPayPalette.darkBlue,
              ),
              hint: Component.textDefault("Pilih Provider"),
              items: state.listProvider.map((PhonePostpaidProviderResponse data) {
                return DropdownMenuItem(
                  value: data,
                  child: Text(
                    data.name ?? 'Pilih Provider',
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  phonePostpaidProviderResponse = newValue;
                });
                phonePostpaidCubit.setProvder(newValue!);
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
