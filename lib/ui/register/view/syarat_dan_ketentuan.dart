import 'package:benpay/core/benpay_palette.dart';
import 'package:benpay/core/util/size_config.dart';
import 'package:benpay/ui/component/component.dart';
import 'package:flutter/material.dart';

import 'model_syarat_ketentuan.dart';

class SyaratDanKetentuan extends StatefulWidget {
  const SyaratDanKetentuan({Key? key}) : super(key: key);

  @override
  _SyaratDanKetentuanState createState() => _SyaratDanKetentuanState();
}

final List<String> listTitle = [
  "No",
  "Jenis Simpanan",
  "Nominal",
  "Keterangan"
];

final List<ModelSyaratKetentuan> modelSyaratKetentuanList = [
  ModelSyaratKetentuan("No", "Jenis Simpanan", "Nominal", "Keterangan"),
  ModelSyaratKetentuan("1", "Simpanan Pokok", "Rp212.000,-",
      "Hanya sekali saat mendaftar menjadi anggota"),
  ModelSyaratKetentuan(
      "2", "Simpanan Wajib", "Rp120.000,-", "Dibayarkan sekali setiap tahun"),
  ModelSyaratKetentuan(
      "3",
      "Simpanan Sukarela \n a. Simpanan Minimarket \n b. Simpanan Properti \n c. Simpanan LKS",
      "",
      "Hanya bisa diambil setelah 12 dan dikosongkan bagi anggota yang akan mengikuti pendaftaran kolektif"),
  ModelSyaratKetentuan("4", "Wakaf Uang", "",
      "Untuk pemberdayaan ekonomi Ummat dan dikosongkan bagi anggota yang akan mengikuti pendaftaran kolektif"),
  ModelSyaratKetentuan("5", "Simpanan Multiguna", "Rp50.000,-",
      "Untuk kartu anggota dan sisanya bisa digunakan transaksi oleh anggota via aplikasi KS212 Mobile untuk PPOB dll"),
  ModelSyaratKetentuan("6", "Biaya Virtual Account Bank", "Rp2.000,-",
      "Ditetapkan oleh bank penyedia jasa Virtual Account Biaya administrasi, hanya sekali saat mendaftar anggota"),
  ModelSyaratKetentuan("7", "Biaya Registrasi Awal", "Rp16.000,-", ""),
];

class _SyaratDanKetentuanState extends State<SyaratDanKetentuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildLogo(),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Component.textBold("Syarat & Ketentuan",
                    colors: Colors.black87, fontSize: 17),
              ),
              const SizedBox(
                height: 20,
              ),
              // Component.textDefault(
              //     "Dengan ini saya mengajukan permohonan menjadi anggota Koperasi syariah 212 dan bersedia memenuhi ketentuan ketentuan dan persyaratan yang berlaku, yaitu :",
              //     fontWeight: FontWeight.bold,
              //     maxLines: 4,
              //     textAlign: TextAlign.justify),
              // const SizedBox(
              //   height: 10,
              // ),
              // Component.textDefault(
              //     "- Menaati Anggaran Dasar dan Anggaran Rumah Tangga serta segala peraturan yang berlaku di Koperasi Syariah 212",
              //     textAlign: TextAlign.justify),
              // Component.textDefault(
              //     "- Melampirkan fotokopi identitas diri (ID) yang masih berlaku (KTP/SIM/PASSWORD)",
              //     textAlign: TextAlign.justify),
              // Component.textDefault(
              //     "- Membayar simpanan pokok dan simpanan wajib (setiap tahun), serta simpanan lain sebagai berikut:",
              //     textAlign: TextAlign.justify),
              // const SizedBox(
              //   height: 20,
              // ),
              // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     ListView.builder(
              //       physics: const NeverScrollableScrollPhysics(),
              //       shrinkWrap: true,
              //       padding: const EdgeInsets.symmetric(vertical: 10),
              //       itemCount: modelSyaratKetentuanList.length,
              //       itemBuilder: (BuildContext context, int index) {
              //         return Table(
              //           border: TableBorder.symmetric(),
              //           columnWidths: const {
              //             0: FlexColumnWidth(.3),
              //             1: FlexColumnWidth(1.8),
              //             2: FlexColumnWidth(1.2),
              //             3: FlexColumnWidth(2),
              //           },
              //           children: [
              //             TableRow(children: [
              //               Text(modelSyaratKetentuanList[index].no!,
              //                   style: index == 0
              //                       ? const TextStyle(
              //                       fontWeight: FontWeight.bold)
              //                       : const TextStyle(fontSize: 12)),
              //               Text(modelSyaratKetentuanList[index].jenisSimpanan!,
              //                   style: index == 0
              //                       ? const TextStyle(
              //                       fontWeight: FontWeight.bold)
              //                       : const TextStyle(fontSize: 12)),
              //               Text(modelSyaratKetentuanList[index].nominal!,
              //                   style: index == 0
              //                       ? const TextStyle(
              //                       fontWeight: FontWeight.bold)
              //                       : const TextStyle(fontSize: 12)),
              //               Text(modelSyaratKetentuanList[index].keterangan!,
              //                   style: index == 0
              //                       ? const TextStyle(
              //                       fontWeight: FontWeight.bold)
              //                       : const TextStyle(fontSize: 12)),
              //             ]),
              //           ],
              //         );
              //       },
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Component.textDefault("TOTAL SIMPANAN DISETORKAN RP 400.000,-",
              //     fontSize: 12,
              //     fontWeight: FontWeight.bold,
              //     textAlign: TextAlign.start),
              // const SizedBox(
              //   height: 10,
              // ),
              _buttonOK(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/icons/logo.png',
            height: SizeConfig.blockSizeHorizontal * 15,
          )
        ],
      ),
    );
  }

  Widget _buttonOK() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: BenpayPalette.darkBlue,
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