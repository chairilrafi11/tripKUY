import 'package:flutter/cupertino.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/util/core_function.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pintupay/ui/menu/bpjs/cubit/bpjs_cubit.dart';
import 'package:pintupay/ui/menu/bpjs/model/bpjs_inquiry_model.dart';

import '../../../../core/util/util.dart';

class BPJSView extends StatefulWidget {

  BPJSView({ Key? key }) : super(key: key);

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
                        InkWell(
                          onTap: () => showPicker(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Flexible(
                                flex: 1,
                                child: Icon(
                                  Icons.event_note,
                                  color: PintuPayPalette.darkBlue,
                                  size: 30,
                                )
                              ),
                              const SizedBox(width: 5,),
                              Flexible(
                                flex: 9,
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  textInputAction: TextInputAction.done,
                                  enabled: false,
                                  controller: monthController,
                                  style: const TextStyle(fontSize: 14),
                                  decoration: Component.inputDecoration("Bulan")
                                ),
                              ),
                            ],
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
                            BpjsCubit().onInquiry(
                              idController.text,
                              month.toString()
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