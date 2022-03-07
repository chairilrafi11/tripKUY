import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/size_config.dart';
import '../cubit/phone_postpaid_cubit.dart';
import '../model/pascabayar_provider_response.dart';

class PhonePostpaidView extends StatefulWidget {
  const PhonePostpaidView({Key? key}) : super(key: key);

  @override
  _PhonePostpaidViewState createState() => _PhonePostpaidViewState();
}

class _PhonePostpaidViewState extends State<PhonePostpaidView> {
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
                          create: (context) => phonePostpaidCubit,
                          child: providerList(),
                        ),
                        // providerList(),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 25),
                          child: InkWell(
                            onTap: () {
                              phonePostpaidCubit
                                  .onInquiry(custCodeController.text);
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget providerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      width: SizeConfig.screenWidth * 1,
      child: BlocBuilder<PhonePostpaidCubit, PhonePostpaidState>(
        builder: (context, state) {
          if ((state is PascabayarLoaded)) {
            return DropdownButton<PascabayarProviderResponse>(
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down_outlined),
                value: state.provider,
                underline: Container(
                  height: 1,
                  color: PintuPayPalette.darkBlue,
                ),
                hint: const Text(
                  'Pilih provider',
                  style: TextStyle(fontSize: 18),
                ),
                items:
                    state.listProvider.map((PascabayarProviderResponse data) {
                  return DropdownMenuItem(
                    value: data,
                    child: Text(
                      data.product ?? 'Pilih provider',
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  phonePostpaidCubit.setProvider(newValue!);
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
