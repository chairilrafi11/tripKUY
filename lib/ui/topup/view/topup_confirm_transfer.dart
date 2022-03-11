import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import '../../../core/pintupay/pintupay_constant.dart';
import '../../../core/pintupay/pintupay_palette.dart';
import '../../../core/util/size_config.dart';
import '../../component/component.dart';
import '../../dashboard/view/dashboard.dart';

enum TopupType { bank, virtualAccount }

class TopupConfirmTransfer extends StatefulWidget {
  const TopupConfirmTransfer({
    Key? key,
  }) : super(key: key);

  @override
  _TopupConfirmTransferState createState() => _TopupConfirmTransferState();
}

class _TopupConfirmTransferState extends State<TopupConfirmTransfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: PintuPayPalette.white,
      body: Stack(
        children: [
          Component.header(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: PintuPayConstant.paddingHorizontalScreen),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Component.appBar("Konfirmasi Topup", transparet: true),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: PintuPayConstant.paddingHorizontalScreen),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Component.textBold(
                          "Jumlah Topup               : Rp50.000",
                          fontSize: PintuPayConstant.fontSizeMedium,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Component.textBold("Biaya Virtual Account : Rp2.000",
                            fontSize: PintuPayConstant.fontSizeMedium),
                        const SizedBox(
                          height: 30,
                        ),
                        Component.textBold("Total Tagihan",
                            fontSize: PintuPayConstant.fontSizeMedium),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 350,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: PintuPayPalette.darkBlue,
                              width: 2,
                            ),
                          ),
                          child: const Center(
                              child: Text("50.000",
                                  style: TextStyle(fontSize: 20))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Component.textBold("Nomor VA",
                            fontSize: PintuPayConstant.fontSizeMedium),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 350,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: PintuPayPalette.darkBlue,
                              width: 2,
                            ),
                          ),
                          child: const Center(
                              child: Text("0000987",
                                  style: TextStyle(fontSize: 20))),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Component.textBold("Cara Bayar"),
                        const SizedBox(
                          height: 20,
                        ),
                        ExpansionTile(
                          title: const Text(
                            'ATM',
                            style: TextStyle(
                              color: PintuPayPalette.white,
                            ),
                          ),
                          collapsedBackgroundColor: PintuPayPalette.darkBlue,
                          backgroundColor: PintuPayPalette.darkBlue,
                          children: [
                            _buildInputInfoTopupAtm(),
                          ],
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        ExpansionTile(
                          title: const Text(
                            'Mobile BCA',
                            style: TextStyle(
                              color: PintuPayPalette.white,
                            ),
                          ),
                          collapsedBackgroundColor: PintuPayPalette.darkBlue,
                          backgroundColor: PintuPayPalette.darkBlue,
                          children: [
                            _buildInputInfoTopupAtm(),
                          ],
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        ExpansionTile(
                          title: const Text(
                            'Internet Banking',
                            style: TextStyle(
                              color: PintuPayPalette.white,
                            ),
                          ),
                          collapsedBackgroundColor: PintuPayPalette.darkBlue,
                          backgroundColor: PintuPayPalette.darkBlue,
                          children: [
                            _buildInputInfoTopupAtm(),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            pushAndRemoveUntil(Dashboard());
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 20, left: 10, right: 10),
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: SizeConfig.screenHeight * 0.05,
                            decoration: const BoxDecoration(
                                color: PintuPayPalette.darkBlue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Component.textBold('Beranda',
                                colors: PintuPayPalette.white, fontSize: 17),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            pushAndRemoveUntil(Dashboard());
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: SizeConfig.screenHeight * 0.05,
                            decoration: const BoxDecoration(
                                color: PintuPayPalette.orange,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Component.textBold('Batal',
                                colors: Colors.black, fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildInputInfoTopupAtm() {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      color: PintuPayPalette.darkBlue,
      child: Align(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Component.textDefault('- Masukkan kartu ATM dan PIN Bank Anda',
                colors: Colors.black,
                fontSize: 15,
                textAlign: TextAlign.start,
                maxLines: 5),
            const SizedBox(
              height: 10,
            ),
            Component.textDefault('- Pilih menu Transaksi Lain',
                colors: Colors.black,
                fontSize: 15,
                textAlign: TextAlign.start,
                maxLines: 5),
            const SizedBox(
              height: 10,
            ),
            Component.textDefault('- Pilih menu Pembayaran',
                colors: Colors.black,
                fontSize: 15,
                textAlign: TextAlign.start,
                maxLines: 5),
            const SizedBox(
              height: 10,
            ),
            Component.textDefault('- Pilih menu Lainnya',
                colors: Colors.black,
                fontSize: 15,
                textAlign: TextAlign.start,
                maxLines: 5),
            const SizedBox(
              height: 10,
            ),
            Component.textDefault('- Pilih menu BSI',
                colors: Colors.black,
                fontSize: 15,
                textAlign: TextAlign.start,
                maxLines: 5),
            const SizedBox(
              height: 10,
            ),
            Component.textDefault('- Masukkan nomor VA',
                colors: Colors.black,
                fontSize: 15,
                textAlign: TextAlign.start,
                maxLines: 5),
            const SizedBox(
              height: 10,
            ),
            Component.textDefault('- Masukkan nominal Topup',
                colors: Colors.black,
                fontSize: 15,
                textAlign: TextAlign.start,
                maxLines: 5),
            const SizedBox(
              height: 10,
            ),
            Component.textDefault(
                '- Ikuti instruksi untuk menyelesaikan transaksi',
                colors: Colors.black,
                fontSize: 15,
                textAlign: TextAlign.start,
                maxLines: 5),
          ],
        ),
      ),
    );
  }
}
