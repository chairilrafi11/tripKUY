import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/usecase/view_usecase.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pintupay/ui/component/shimmer.dart';
import 'package:pintupay/ui/menu/bpjs/cubit/bpjs_cubit.dart';
import 'package:pintupay/ui/menu/pulsa/model/recent_number_response.dart';

import '../../../../core/util/util.dart';

class BPJSView extends StatefulWidget {

  const BPJSView({ Key? key }) : super(key: key);

  @override
  State<BPJSView> createState() => _BPJSViewState();
}

class _BPJSViewState extends State<BPJSView> {

  late int month;
  List<String>? _monthList = <String>[];
  final TextEditingController idController = TextEditingController();
  final TextEditingController monthController = TextEditingController();

  void showPicker() {
    FocusScope.of(context).unfocus();
    var thisMonth = DateTime.now().month;
    var thisYear = DateTime.now().year;
    CoreFunction.logPrint("thisMonth", thisMonth);

    _monthList = List.generate(PintuPayConstant.decodedMonth.length, (index) {
      if (index == 0) {
        return '${PintuPayConstant.decodedMonth[thisMonth - 1]} $thisYear';
      } else if (index <= (PintuPayConstant.decodedMonth.length - thisMonth)) {
        return '${PintuPayConstant.decodedMonth[thisMonth +
            (index - 1)]} $thisYear';
      } else {
        var indexFirst = (PintuPayConstant.decodedMonth.length - thisMonth) - (index - 1);
        return '${PintuPayConstant.decodedMonth[indexFirst.abs()]} ${thisYear + 1}';
      }
    });

    showModalBottomSheet(
      isScrollControlled: false,
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        int select = 1;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                onSelectedItemChanged: (value) {
                  setState(() {
                    monthController.text = '${_monthList?[value]}';
                    select = value + 1;
                  });
                },
                itemExtent: 32.0,
                children: List.generate(
                  _monthList?.length ?? 0, (i) => Text('${_monthList?[i]}'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              width: SizeConfig.blockSizeHorizontal * 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: CoreVariable.borderRadius10,
                  ),
                  primary: PintuPayPalette.darkBlue,
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.1),
                  elevation: 2.0,
                ),
                child: const Text(
                  'Pilih',
                  style: TextStyle(color: PintuPayPalette.white),
                ),
                onPressed: () {
                  List<String> listMonth = CoreVariable.decodedMonth;
                  int indexMonth = listMonth.indexWhere((element) {
                    var monthFromList = element;
                    var monthFromSelected = _monthList?[(select - 1)]??"";
                    return monthFromSelected.toLowerCase().contains(monthFromList.toLowerCase());
                  });
                  FocusScope.of(context).requestFocus(FocusNode());
                  setState(() {
                    if (indexMonth != -1) {
                      indexMonth = indexMonth + 1;
                      month = indexMonth;
                    } else {
                      month = 0;
                    }
                    CoreFunction.logPrint("Month", month);
                    monthController.text = '${_monthList?[(select - 1)]}';
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Component.textBold("No. Pelanggan", textAlign: TextAlign.start),
                        const SizedBox(height: 16,),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: TextFormField(
                                controller: idController,
                                decoration: InputDecoration(
                                  fillColor: PintuPayPalette.blueLight.withAlpha(50),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(color: PintuPayPalette.white),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(color: PintuPayPalette.white),
                                  ),
                                  counterText: "",
                                  hintText: "contoh: 1234567890",
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.close,
                                      color: PintuPayPalette.darkBlue,
                                    ),
                                    onPressed: (){
                                      idController.clear();
                                      BlocProvider.of<BpjsCubit>(context).onRecentNumber();
                                    }
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                  hintStyle: const TextStyle(fontSize: 15.0, color: PintuPayPalette.blue1, fontWeight: FontWeight.w500)
                                ),
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
                            ),
                            const SizedBox(width: 10,),
                            IconButton(
                              onPressed: () async {
                                String billingNumber = await CoreFunction.showScanner(ScanMode.BARCODE);
                                CoreFunction.logPrint("Billing Number", billingNumber);
                                if (billingNumber != "-1") {
                                  BlocProvider.of<BpjsCubit>(context).onInquiry(
                                    billingNumber,
                                    DateTime.now().month.toString()
                                  );
                                }
                              }, 
                              icon: const Icon(
                                Icons.qr_code_scanner,
                                color: PintuPayPalette.darkBlue,
                              )
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Component.textBold("Bulan", textAlign: TextAlign.start),
                        const SizedBox(height: 16,),
                        InkWell(
                          onTap: () => showPicker(),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                            enabled: false,
                            controller: monthController,
                            style: const TextStyle(fontSize: 14),
                            decoration: Component.decorationNoBorder("Pilih Bulan", iconPrefix: Icons.event_note)
                          ),
                        ),
                        // TextFormField(
                        //   controller: monthController,
                        //   decoration: Component.inputDecoration("Periode"),
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
                        const SizedBox(height: 20,),
                        Component.button(
                          label: "Cek Tagihan",
                          onPressed: (){
                            BlocProvider.of<BpjsCubit>(context).onInquiry(
                              idController.text,
                              month.toString()
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Component.textBold(
                  "Transaksi Terakhir",
                  fontSize: PintuPayConstant.fontSizeLarge
                ),
                const SizedBox(height: 8,),
                Component.divider(),
                BlocBuilder<BpjsCubit, BpjsState>(
                  builder: (context, state) {
                    if (state is BpjsLoading) {
                      return const ShimmerList();
                    } else if (state is BpjsRecentNumber) {
                      return recent(state.listRecent);
                    } else {
                      return Container();
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget recent(List<RecentNumberResponse> listRecent){
    if (listRecent.isNotEmpty){
      return ListView.builder(
        itemCount: listRecent.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 0),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              BlocProvider.of<BpjsCubit>(context).onInquiry(
                listRecent[index].numbers.toString(), 
                DateTime.now().month.toString()
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: [                
                    Image.asset( 
                      ViewUsecase.iconFeature(Feature.bpjs),
                      height: 40,
                    ),
                    // Component.textBold(listRecent[index].name ?? "", colors: PintuPayPalette.darkBlue),
                    const SizedBox(width: 10,),
                    Component.textBold(
                      listRecent[index].numbers ?? "",
                      fontSize: PintuPayConstant.fontSizeLarge,
                      colors: PintuPayPalette.darkBlue
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      return Component.emptyRecent();
    }
  }
}