import 'package:flutter/material.dart';
import 'package:pintupay/core/pintupay/pintupay_palette.dart';

import '../../../core/util/size_config.dart';
import '../../component/component.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  _TermsAndConditionState createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBar('Panduan & Ketentuan'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Component.textBold(
                  "Syarat & Ketentuan",
                  colors: Colors.black87,
                  fontSize: 17,
                  textAlign: TextAlign.center
              ),
              const SizedBox(height: 20),
              Component.textBold(
                  "Apa PintuPay itu?",
                  colors: Colors.black87, fontSize: 17
              ),
              const SizedBox(height: 10),
              Component.textDefault(
                  "PintuPay merupakan layanan dompet elektronik server base dengan media transaksi berupa \n kartu & aplikasi smartphone. Untuk saat ini, aplikasi baru tersedia untuk pengguna Android.",
                  maxLines: 5
              ),
              const SizedBox(height: 20),
              Component.textBold(
                  "Bagaimana cara Top-up?",
                  colors: Colors.black87, fontSize: 17
              ),
              const SizedBox(height: 10),
              Component.textDefault(
                  "PintuPay bisa di Top-up secara tunai dengan mendatangi jaringan PintuPay atau Merchant terdekat. Selain itu Top-up bisa dilihat pada menu Top-up.",
                  maxLines: 5
              ),
              const SizedBox(height: 20),
              Component.textBold(
                  "Saya membeli pulsa tapi pulsa tidak masuk dan saldo saya terpotong",
                  colors: Colors.black87,
                  fontSize: 17
              ),
              const SizedBox(height: 10),
              Component.textDefault(
                  "Apabila pulsa Anda tidak masuk dan saldo terpotong, kami akan melakukan pengecekan transaksi Anda, dan saldo anda akan dikembalikan apabila pembelian pulsa gagal. Jika dalam jangka waktu 1x24 jam pulsa tidak masuk dan saldo belum dikembalikan silahkan hubungi kami melalui menu komplain.",
                  maxLines: 6
              ),
              const SizedBox(height: 20),
              // Component.textBold("Biaya-biaya", colors: Colors.black87, fontSize: 17),
              // const SizedBox(height: 10),
              // Component.textDefault(
              //     "- Topup Virtual Account (BNI, BCA, Mandiri, BSI, Muamalat, Bank Lain) Rp1000,- \n - Transfer Bank Rp2000,-",
              //     maxLines: 5
              // ),
              const SizedBox(height: 20),
              _buttonOK(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonOK() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: PintuPayPalette.darkBlue,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop(true);
            },
            child: Container(
              alignment: Alignment.center,
              height: SizeConfig.blockSizeVertical * 4,
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
      ),
    );
  }
}