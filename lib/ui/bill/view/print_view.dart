import 'dart:io';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component.dart';

import '../model/bill_status_model.dart';

class PrintView extends StatefulWidget {

  final BillStatusModel billStatusModel;

  const PrintView({ required this.billStatusModel, Key? key }) : super(key: key);

  @override
  State<PrintView> createState() => _PrintViewState();
}

class _PrintViewState extends State<PrintView> {
BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  List<BluetoothDevice> _devices = [];
  BluetoothDevice? _device;
  bool _connected = false;
  bool _pressed = false;
  String pathImage = "";
  final List<String> info = [
    "Nyalakan Bluetooth Hp dan printer",
    "Pairing Bluetooth printer",
    "Pilih nama device printer",
    "Tekan connect, bila butoon cetak berganti warna menjadi biru berarti siap untuk di cetak",
    "Tekan tombol cetak",
  ];

  @override
  void initState() {
   super.initState();
   initPlatformState();
   initSavetoPath();
  }

 initSavetoPath()async{
    //read and write
    //image max 300px X 300px
    const filename = 'yourlogo.png';
    var bytes = await rootBundle.load("assets/images/bg_print.png");
    String dir = (await getApplicationDocumentsDirectory()).path;
    writeToFile(bytes,'$dir/$filename');
    setState(() {
     pathImage='$dir/$filename';
   });
 }

  Future<void> initPlatformState() async {
    List<BluetoothDevice> devices = [];

   try {
     devices = await bluetooth.getBondedDevices();
   } on PlatformException {
     // TODO - Error
   }

   bluetooth.onStateChanged().listen((state) {
     switch (state) {
        case BlueThermalPrinter.CONNECTED:
          setState(() {
            _connected = true;
            _pressed = false;
         });
         break;
        case BlueThermalPrinter.DISCONNECTED:
         setState(() {
           _connected = false;
           _pressed = false;
          });
         break;
        default:
          print(state);
          break;
     }
   });

    if (!mounted) return;
   setState(() {
      _devices = devices;
   });
  }

 @override
 Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:Component.appBar("Cetak Bukti"),
        backgroundColor: PintuPayPalette.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: PintuPayConstant.paddingHorizontalScreen),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Component.textBold("Printer:"),
                    DropdownButton(
                       items: _getDeviceItems(),
                       onChanged: (value) => setState((){
                         _device = value as BluetoothDevice;
                       }),
                       value: _device,
                    ),
                    RaisedButton(
                       onPressed: _connected ? _disconnect : _connect,
                       child: Text(_connected ? 'Disconnect' : 'Connect'),
                     ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Component.button(
                label: "Cetak", 
                onPressed: _connected ? _tesPrint : null,
              ),
              const SizedBox(height: 20,),
              Component.textBold("Petunjuk Cetak Bukti"),
              ListView.builder(
                itemCount: info.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Component.textDefault("${index + 1}. "),
                        const SizedBox(width: 5,),
                        Flexible(
                          child: Component.textDefault(
                            info[index], 
                            fontSize: PintuPayConstant.fontSizeMedium,
                            maxLines: 4
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
     ),
   );
 }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
   if (_devices.isEmpty) {
     items.add(const DropdownMenuItem(
       child: Text('NONE'),
     ));
    } else {
     _devices.forEach((device) {
       items.add(DropdownMenuItem(
        child: Text(device.name ?? ""),
          value: device,
       ));
     });
   }
   return items;
  }

 void _connect() {
    if (_device == null) {
      CoreFunction.showToast("Pilih Device terlebuh dahulu");
   } else {
      bluetooth.isConnected.then((isConnected) {
        CoreFunction.logPrint("Cek Connect Bluetooth", isConnected.toString());
        _connected = isConnected ?? false;
       if (!(isConnected ?? false)) {
          bluetooth.connect(_device!).catchError((error) {
           setState(() => _pressed = false);
         });
         setState(() => _pressed = true);
       } else {
         setState(() => _pressed = true);
       }
      });
    }
 }

  void _disconnect() {
    bluetooth.disconnect();
    setState(() => _pressed = true);
 }

//write to app path
 Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
 }

  void _tesPrint() async {
    bluetooth.isConnected.then((isConnected) {
    if (isConnected!) {
        bluetooth.printNewLine();
        bluetooth.printImage(pathImage);   //path of your image/logo
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.printCustom(authUsecase.userBox.storeName ?? "", 3, 1);
        bluetooth.printCustom(authUsecase.userBox.address ?? "", 0, 1);
        bluetooth.printCustom(authUsecase.userBox.phoneNumber ?? "", 0, 1);
        bluetooth.printNewLine();
        bluetooth.printCustom("--------------------------------", 1, 1);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("Tanggal", DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now()), -1);
        for (var element in widget.billStatusModel.billBody) {
          bluetooth.printLeftRight(element.key, element.value, -1);
        }
        bluetooth.printNewLine();
        bluetooth.printCustom("--------------------------------", 1, 1);
        bluetooth.printNewLine();
        bluetooth.printCustom("Struk ini merupakan bukti\npembayaran yang sah", 0, 1);
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.printCustom("Terima Kasih", 2, 1);
        bluetooth.printNewLine();
        bluetooth.printCustom("--- PintuPay System ---", 1, 1);
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.paperCut();
        }
   });
  }
}