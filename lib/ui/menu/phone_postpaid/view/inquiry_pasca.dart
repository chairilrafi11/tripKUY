import 'package:flutter/material.dart';
import 'package:pintupay/core/pintupay/pintupay.dart';

import '../../../../core/util/core_function.dart';
import '../../../../core/util/size_config.dart';
import '../../../component/component.dart';
import '../model/response_inquiry_postpaid.dart';

class InquiryPasca extends StatelessWidget {
  final ResponseInquiryPhonePaid? responseInquiryPasca;

  const InquiryPasca({
    Key? key,
    required this.responseInquiryPasca,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Component.textDefault(
                    'Harga Total',
                    fontSize: 14,
                  ),
                  Component.textBold(
                      CoreFunction.moneyFormatter(
                        responseInquiryPasca?.total,
                      ),
                      fontSize: 16),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Component.textDefault(
                      'Nama',
                      fontSize: 14,
                    ),
                  ),
                  Component.textBold(
                    responseInquiryPasca?.nama ?? '',
                    fontSize: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Component.textDefault(
                      'Periode',
                      fontSize: 14,
                    ),
                  ),
                  Component.textBold(
                    responseInquiryPasca?.bulan ?? '',
                    fontSize: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Component.textDefault(
                      'Biaya Admin',
                      fontSize: 14,
                    ),
                  ),
                  Component.textBold(
                    CoreFunction.moneyFormatter(
                      responseInquiryPasca?.admin,
                    ),
                    fontSize: 16,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Component.textDefault(
                  'Harga Total',
                  fontSize: 14,
                ),
                Component.textBold(
                  CoreFunction.moneyFormatter(
                    responseInquiryPasca?.total,
                  ),
                  fontSize: 16,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Component.textDefault(
                    'Kode Pelanggan',
                    fontSize: 14,
                  ),
                ),
                Component.textBold(
                  responseInquiryPasca?.idPelanggan ?? '',
                  fontSize: 16,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Component.textDefault(
                    'Tagihan',
                    fontSize: 14,
                  ),
                ),
                Component.textBold(
                  CoreFunction.moneyFormatter(
                    responseInquiryPasca?.tagihan,
                  ),
                  fontSize: 16,
                ),
              ],
            )
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 35,
            width: MediaQuery.of(context).size.width * 0.5,
            child: CheckboxListTile(
              value: true,
              onChanged: (value) {},
              title: Component.textDefault(
                "Kirim Notifikasi",
                fontSize: 14,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: InkWell(
            child: Container(
              width: SizeConfig.blockSizeHorizontal * 70,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: const BoxDecoration(
                color: PintuPayPalette.green,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Component.textBold(
                  'Bayar',
                  colors: PintuPayPalette.white, fontSize: 15
              ),
            ),
          ),
        ),
      ],
    );
  }
}
