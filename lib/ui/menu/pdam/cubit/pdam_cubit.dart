import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/util/core_function.dart';
import '../../../bill/model/bill_body_model.dart';
import '../../../bill/model/bill_model.dart';
import '../../../bill/model/bill_status_model.dart';
import '../model/district_pdam.dart';
import '../model/response_inquiry_pdam.dart';
import '../repository/pdam_repository.dart';

part 'pdam_state.dart';

class PdamCubit extends Cubit<PdamState> {
  PdamCubit() : super(const PdamEmpty()) {
    onGetDistrict();
  }

  PdamRepository pdamRepository = PdamRepository();

  Future<void> onGetDistrict() async {
    pdamRepository.getPdamDistricts().then((listDistrict) {
      CoreFunction.logPrint('getPdamDistricts', jsonEncode(listDistrict));
      emit(PdamInitial(listDistrict));
    });
  }

  Future<void> onInquiry({
    required String customerId,
    DistrictPDAM? selectedDistrict,
  }) async {
    pdamRepository.onInquiry(customerId, selectedDistrict).then((response) {
      CoreFunction.logPrint('DataDong', jsonEncode(response));
      _navigateToBill(response, selectedDistrict);
    });
  }

  Future<void> onPayment() async {
    pdamRepository.onPayment().then((response) {
      if (response != null) {
        BillStatusModel status = BillStatusModel(
          billBody: [
            BillBodyModel(
                'Transaction ID :', "#${response['transaction_id'] ?? ''}"),
            BillBodyModel(
                'ID Pelanggan : ', "${response['no_pel'] ?? ''}"),
            BillBodyModel('Nama Pelanggan : ', "${response['nama'] ?? ''}"),
            BillBodyModel('Nominal : ',
                CoreFunction.moneyFormatter("${response['tagihan'] ?? "0"}")),
            BillBodyModel('Biaya Admin : ',
                CoreFunction.moneyFormatter("${response['bea_admin'] ?? "0"}")),
            BillBodyModel('Keterangan : ', response['description'] ?? 'Pembayaran PDAM')
          ],
          createdAt: response['created_at'] ?? '',
          status: response['status'] ?? '',
        );
        CoreFunction.openBillDetail(status);
      }
    });
  }

  void _navigateToBill(ResponseInquiryPDAM? responseInquiryPDAM,
      DistrictPDAM? selectedDistrict) {
    BillModel billModel = BillModel(users: [
      {'Name', responseInquiryPDAM?.nama ?? ''},
      {'Id pelanggan', responseInquiryPDAM?.noPel ?? ''},
      // {"No Resi", responseInquiryPDAM.noResi},
      {'Periode', responseInquiryPDAM?.periode ?? ''},
      {"Stand", responseInquiryPDAM?.stand.toString() ?? ''},
    ], cost: [
      {'Tagihan', responseInquiryPDAM?.tagihan.toString() ?? ''},
      {'Biaya Admin', responseInquiryPDAM?.beaAdmin.toString() ?? ''},
    ], totalPayment: responseInquiryPDAM?.totTagihan.toString() ?? '');
    String title = "Konfirmasi bayar PDAM";
    String content =
        "Anda akan Membayar tagihan PDAM atas nama ${responseInquiryPDAM?.nama} Id Pelanggan ${responseInquiryPDAM?.noPel} Untuk Periode ${responseInquiryPDAM?.periode} Bulan Seharga ${CoreFunction.moneyFormatter(responseInquiryPDAM?.totTagihan)}?\n Bukti transaksi pembayaran dikirim via E-mail. Pastikan E-mail yang terdaftar sudah benar.";
    Set<String> contentDialog = {title, content};

    // routePush(
        // Bill(
        //   billModel: billModel,
        //   methodPayment: onPayment,
        //   contentDialog: contentDialog,
        //   userDataBox: UserBox(),
        // ),
        // RouterType.cupertino);
  }
}
