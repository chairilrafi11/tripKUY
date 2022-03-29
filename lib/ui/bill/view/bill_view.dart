import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';
import 'package:pintupay/core/pintupay/pintupay_constant.dart';
import 'package:pintupay/core/usecase/view_usecase.dart';
import 'package:pintupay/core/util/benpay_cupertino_dialog.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/bill/model/bill_status_model.dart';
import 'package:pintupay/ui/bill/view/print_view.dart';
import 'package:pintupay/ui/component/component.dart';
import 'package:pintupay/ui/dashboard/view/dashboard.dart';
import 'package:flutter/material.dart';

import '../../balance/cubit/balance_cubit.dart';

enum BillStatus {success, failed, pending}

class BillView extends StatelessWidget {

  final BillStatusModel billStatusModel;
  final String? messages;
  final bool fromTrans;
  final BillStatus billStatus;

  const BillView({
    Key? key,
    required this.billStatusModel, 
    required this.billStatus,
    this.messages,
    this.fromTrans = false
  }) : super(key: key);

  static GlobalKey billContainer = GlobalKey();

  String titleTransaction(){
    switch (billStatus) {
      case BillStatus.pending:
        return "Transaksi sedang kami proses";
      case BillStatus.success:
        return "Transaksi Berhasil";
      case BillStatus.failed:
        return "Transaksi Gagal";
      default:
        return "";
    }
  }

  confirmSaveBill(String fileName, File file) {
    return showDialog(
      context: navGK.currentContext!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Konfirmasi Simpan",
                style: TextStyle(
                  color: PintuPayPalette.darkBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Simpan Bukti $fileName?",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: SizeConfig.blockSizeHorizontal * 30,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: const Text(
                        "Batal",
                        style: TextStyle(color: PintuPayPalette.white),
                      )
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      OpenFile.open(file.path, type: "image/png");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      width: SizeConfig.blockSizeHorizontal * 30,
                      color: PintuPayPalette.darkBlue,
                      child: const Text(
                        "Simpan",
                        style: TextStyle(color: PintuPayPalette.white),
                      )
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: onBackPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: const BoxDecoration(
            color: PintuPayPalette.darkBlue,
            image: DecorationImage(
              image: AssetImage(
                "assets/images/header_login.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: SizeConfig.blockSizeHorizontal * 3),
                  Component.textBold(
                    titleTransaction(),
                    colors: PintuPayPalette.white,
                    fontSize: SizeConfig.blockSizeHorizontal * 5
                  ),
                  SizedBox(height: SizeConfig.blockSizeHorizontal * 5),
                  RepaintBoundary(
                    key: billContainer,
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal * 85,
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(r"assets/images/bg_bill_status.png"),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/icons/logo.png",
                              // width: SizeConfig.blockSizeHorizontal * 10,
                              height: SizeConfig.blockSizeHorizontal * 10,
                            ),
                          ),
                          SizedBox(height: SizeConfig.blockSizeHorizontal * 10),
                          for (int i = 0; i < billStatusModel.billBody.length; i++) _textBill(
                            billStatusModel.billBody[i].key,
                            billStatusModel.billBody[i].value,
                            padding: 10
                          ),
                          if(messages != null) Padding(
                            padding: EdgeInsets.only(top: SizeConfig.blockSizeHorizontal * 5),
                            child: Component.textDefault(
                              messages ?? "",
                              fontSize: PintuPayConstant.fontSizeLarge,
                              colors: PintuPayPalette.orange
                            ),
                          ),
                          SizedBox(height: SizeConfig.blockSizeHorizontal * 5),
                          const Divider(
                            thickness: 1.5,
                          ),
                          SizedBox(height: SizeConfig.blockSizeHorizontal * 2),
                          Center(
                            child: Component.textDefault(
                              "Captured from PintuPay",
                              fontSize: SizeConfig.blockSizeHorizontal * 3
                            ),
                          ),
                          SizedBox(height: SizeConfig.blockSizeHorizontal * 2),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockSizeHorizontal * 5),
                  _buttonReceipt(),
                  _buttonPrint(),
                  _buttonOK(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveBill(String fileName, bool isShare, String transactionId) async {
    return Future.delayed(const Duration(milliseconds: 20), () async {
      RenderRepaintBoundary? boundary = billContainer.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage();
      var dir = (await getApplicationDocumentsDirectory()).path;
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      File imgFile = File('$dir/$fileName.png');
      imgFile.writeAsBytes(pngBytes, mode: FileMode.write).then((value) {
        if (isShare) {
          // final box = navGK.currentContext!.findRenderObject() as RenderBox?;
          // Share.shareFiles(
          //   [
          //     value.path,
          //   ],
          //   mimeTypes: ['images/png'],
          //   text: 'Bukti Transaksi ECoop',
          //   subject: 'Id Transaksi $transactionId',
          //   sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
          // );
        } else {
          GallerySaver.saveImage(
            value.path,
            toDcim: true,
            albumName: 'pintupay',
          ).then((bool? isSaved) {
            if (isSaved ?? false) {
              confirmSaveBill('$fileName.png', value);
            }
          });
        }
      });
    });
  }

  _downloadBill(bool isShare) async {
    var storageStatus = await Permission.storage.status;
    CoreFunction.logPrint("childDetail", storageStatus.toString());
    if (storageStatus == PermissionStatus.granted) {
      String fileName = "Pintupay_${billStatusModel.billBody[1].value}_${DateTime.now().toString()}".replaceAll(" ", "_");
      _saveBill(fileName, isShare, billStatusModel.billBody[1].value);
    } else {
      await Permission.storage.request().then((value) async {
        CoreFunction.logPrint('permissionHandler.PermissionStatus', value.toString());
        _downloadBill(isShare);
      });
    }
  }

  Widget _textBill(String first, String last, {double padding = 0}) {
    padding = SizeConfig.blockSizeHorizontal * 1.5;
    bool isTotal = first.toLowerCase().contains("total");
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isTotal 
            ? Component.textBold(
                first,
                fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                maxLines: 5
              ) 
            : Component.textDefault(
              first,
              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
              maxLines: 5
            ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Component.textBold(
              last,
              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
              textAlign: TextAlign.end,
              colors: isTotal ? PintuPayPalette.orange : PintuPayPalette.darkBlue,
              maxLines: 5
            )
          ),
        ],
      ),
    );
  }

  Widget _buttonOK() => Center(
    child: SizedBox(
      width: SizeConfig.blockSizeHorizontal * 85,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: PintuPayPalette.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if(fromTrans){
            Navigator.pop(navGK.currentContext!);
          } else {
            navToDashboard();
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 3,
            vertical: SizeConfig.blockSizeHorizontal * 3
          ),
          child: Component.textBold(
            'Beranda',
            colors: PintuPayPalette.darkBlue,
            fontSize: PintuPayConstant.fontSizeLarge
          ),
        ),
      ),
    )
  );

  Widget _buttonReceipt() => Center(
    child: SizedBox(
      width: SizeConfig.blockSizeHorizontal * 85,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: PintuPayPalette.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          _downloadBill(false);
          // _downloadCardBottomSheet();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 3,
            vertical: SizeConfig.blockSizeHorizontal * 3
          ),
          child: Component.textBold(
            'Unduh Bukti Pembayaran',
            colors: PintuPayPalette.darkBlue,
            fontSize: PintuPayConstant.fontSizeLarge
          ),
        ),
      ),
    )
  );

  Widget _buttonPrint() => Center(
    child: SizedBox(
      width: SizeConfig.blockSizeHorizontal * 85,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: PintuPayPalette.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          routePush(PrintView(billStatusModel: billStatusModel), RouterType.material);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 3,
            vertical: SizeConfig.blockSizeHorizontal * 3
          ),
          child: Component.textBold(
            'Cetak Bukti',
            colors: PintuPayPalette.darkBlue,
            fontSize: PintuPayConstant.fontSizeLarge
          ),
        ),
      ),
    )
  );

  Future<bool> onBackPressed() {
    navToDashboard();
    return Future.value(false);
  }

  Future navToDashboard() async {
    await BalanceCubit().onGetBalance(isLoading: true);
    pushAndRemoveUntil(Dashboard(), RouterType.material);
  }
}
