import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/constant.dart';
import 'package:benpay/core/util/util.dart';
import 'package:benpay/ui/bill/model/bill_status_model.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:benpay/ui/dashboard/view/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:nav_router/nav_router.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart' as permissionhandler;

class BillStatus extends StatefulWidget {

  final BillStatusModel billStatusModel;
  final bool fromTrans;

  const BillStatus(this.billStatusModel, {Key? key,this.fromTrans = false}) : super(key: key);

  @override
  _BillStatusState createState() => _BillStatusState();
}

class _BillStatusState extends State<BillStatus> {
  static GlobalKey billContainer = GlobalKey();
  late BillStatusModel billStatusModel = widget.billStatusModel;

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
            color: BenpayPalette.darkBlue,
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
                    "Transaksi Berhasil!",
                    colors: BenpayPalette.white,
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
                          // Row(
                          //   mainAxisSize: MainAxisSize.max,
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Component.textBold() , fontSize: SizeConfig.blockSizeHorizontal * 3.5),
                          //   ],
                          // ),
                          // _textBill("Tanggal : ", DateFormat('yyyy-mm-dd hh:mm:ss').format(DateTime.parse(billStatusModel.createdAt))),
                          
                          // const Divider(
                          //   thickness: 1.5,
                          // ),
                          for (int i = 0; i < billStatusModel.billBody.length; i++) _textBill(
                            billStatusModel.billBody[i].key,
                            billStatusModel.billBody[i].value,
                            padding: 10
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
                  _buttonOK(),
                  _buttonReceipt(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveBill(String fileName, bool isShare, String transactionId) async {
    // return Future.delayed(const Duration(milliseconds: 20), () async {
    //   RenderRepaintBoundary? boundary = billContainer.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    //   ui.Image image = await boundary!.toImage();
    //   var dir = (await getApplicationDocumentsDirectory()).path;
    //   ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    //   Uint8List pngBytes = byteData!.buffer.asUint8List();
    //   File imgFile = File('$dir/$fileName.png');
    //   imgFile.writeAsBytes(pngBytes, mode: FileMode.write).then((value) {
    //     if (isShare) {
    //       final box = context.findRenderObject() as RenderBox?;
    //       Share.shareFiles(
    //         [
    //           value.path,
    //         ],
    //         mimeTypes: ['images/png'],
    //         text: 'Bukti Transaksi ECoop',
    //         subject: 'Id Transaksi $transactionId',
    //         sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    //       );
    //     } else {
    //       GallerySaver.saveImage(
    //         value.path,
    //         toDcim: true,
    //         albumName: 'ecoop',
    //       ).then((bool? isSaved) {
    //         if (isSaved ?? false) {
    //           _openFile('$fileName.png', value);
    //         }
    //       });
    //     }
    //   });
    // });
  }

  _downloadBill(bool isShare) async {
    // CoreFunction.logPrint("childDetail", "dowloadCard");
    // var storageStatus = await permissionhandler.Permission.storage.status;
    // CoreFunction.logPrint("childDetail", storageStatus.toString());
    // if (storageStatus == permissionhandler.PermissionStatus.granted) {
    //   String fileName = "E_Receipt_${billStatusModel.billBody.first.value}".replaceAll(" ", "_");
    //   _saveBill(fileName, isShare, billStatusModel.billBody.first.value);
    // } else {
    //   await permissionhandler.Permission.storage.request().then((value) async {
    //     CoreFunction.logPrint('permissionHandler.PermissionStatus', value.toString());
    //     _downloadBill(isShare);
    //   });
    // }
  }

  _openFile(String fileName, File file) {
    // CoreFunction.logPrint("childDetail", "_openFile");
    // showEtikadCupertionDialog(builder: (BuildContext buildContext) {
    //   return EtikadCupertinoDialog(
    //     title: const Text("Konfirmasi"),
    //     content: Column(
    //       children: [
    //         Text("Buka File $fileName?"),
    //       ],
    //     ),
    //     actions: [
    //       CupertinoDialogAction(
    //         child: const Text("Tidak"),
    //         isDefaultAction: false,
    //         isDestructiveAction: true,
    //         onPressed: () {
    //           Navigator.pop(buildContext);
    //         },
    //       ),
    //       CupertinoDialogAction(
    //         child: const Text("Ya"),
    //         isDefaultAction: true,
    //         isDestructiveAction: false,
    //         onPressed: () {
    //           Navigator.pop(buildContext);
    //           OpenFile.open(file.path, type: "image/png");
    //         },
    //       ),
    //     ],
    //   );
    // });
  }

  _downloadCardBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext buildContext) {
        return CupertinoActionSheet(
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('Unduh'),
              onPressed: () {
                Navigator.pop(buildContext);
                _downloadBill(false);
              },
            ),
            CupertinoDialogAction(
              child: const Text('Bagikan'),
              onPressed: () {
                Navigator.pop(buildContext);
                _downloadBill(true);
              },
            ),
          ],
          cancelButton: CupertinoDialogAction(
            child: const Text('Batalkan'),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(buildContext);
            },
          ),
          title: const Text('Pilih Aksi'),
        );
      },
    );
  }

  Widget _textBill(String first, String last, {double padding = 0}) {
    padding = SizeConfig.blockSizeHorizontal * 1.5;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Component.textDefault(
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
              colors: BenpayPalette.darkBlue,
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
          primary: BenpayPalette.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if(widget.fromTrans){
            Navigator.pop(context);
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
            'OK',
            colors: BenpayPalette.darkBlue,
            fontSize: BenpayConstant.fontSizeLarge
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
          primary: BenpayPalette.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          _downloadCardBottomSheet();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 3,
            vertical: SizeConfig.blockSizeHorizontal * 3
          ),
          child: Component.textBold(
            'Unduh Bukti Pembayaran',
            colors: BenpayPalette.darkBlue,
            fontSize: BenpayConstant.fontSizeLarge
          ),
        ),
      ),
    )
  );

  Future<bool> onBackPressed() {
    navToDashboard();
    return Future.value(false);
  }

  navToDashboard() {
    pushAndRemoveUntil(Dashboard(), RouterType.material);
  }
}