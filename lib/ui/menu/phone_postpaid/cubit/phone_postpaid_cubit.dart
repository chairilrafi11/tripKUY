import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/ui/menu/phone_postpaid/model/phone_postpaid_model.dart';

import '../../../../core/util/core_function.dart';
import '../../../bill/model/bill_body_model.dart';
import '../../../bill/model/bill_model.dart';
import '../../../bill/model/bill_status_model.dart';
import '../model/response_inquiry_postpaid.dart';
import '../repository/phone_paid_repository.dart';

part 'phone_postpaid_state.dart';

class PhonePostpaidCubit extends Cubit<PhonePostpaidState> {
  PhonePostpaidCubit() : super(const PascaEmpty()) {
    getProductPasca();
  }

  final PhonePaidRepository pascaRepository = PhonePaidRepository();

  Future<void> getProductPasca() async {
    pascaRepository.getProvider().then((pascaProviders) {
      emit(PascaInitial(pascaProviders: pascaProviders));
    });
  }

  Future<void> onInquiry({
    required String custId,
    required String providerName,
  }) async {
    await pascaRepository.inquiry(custId, providerName).then((responseInquiry) {
      CoreFunction.logPrint('response', responseInquiry?.toJson());
      _navigateToBill(responseInquiry, providerName);
    });
  }

  Future<void> onPayment() async {
    await pascaRepository.onPayment().then((response) {
      if (response != null) {
        BillStatusModel status = BillStatusModel(
          billBody: [
            BillBodyModel(
                'Transaction ID :', "#${response['transaction_id'] ?? ''}"),
            BillBodyModel(
                'ID Pelanggan : ', "${response['id_pelanggan'] ?? ''}"),
            BillBodyModel('Nama Pelanggan : ', "${response['nama'] ?? ''}"),
            BillBodyModel('Nominal : ',
                CoreFunction.moneyFormatter("${response['tagihan'] ?? "0"}")),
            BillBodyModel('Biaya Admin : ',
                CoreFunction.moneyFormatter("${response['admin'] ?? "0"}")),
            BillBodyModel('Keterangan : ',
                response['description'] ?? 'Pembayaran HP Pascabayar')
          ],
          createdAt: response['created_at'] ?? '',
          status: response['status'] ?? '',
        );
        CoreFunction.openBillDetail(status);
      }
    });
  }

  void _navigateToBill(
      ResponseInquiryPhonePaid? responseInquiryPasca, String providerName) {
    BillModel billModel = BillModel(users: [
      {'Nama', responseInquiryPasca?.nama ?? ''},
      {'Id Pelanggan', responseInquiryPasca?.idPelanggan ?? ''},
      {"No Reference", responseInquiryPasca?.noResi ?? ''},
      {'Periode', "${responseInquiryPasca?.bulan} Bulan"},
      {"No Resi", responseInquiryPasca?.noResi ?? ''},
    ], cost: [
      {'Tagihan', responseInquiryPasca?.tagihan.toString() ?? ''},
      {'Biaya Admin', responseInquiryPasca?.admin.toString() ?? ''},
    ], totalPayment: responseInquiryPasca?.total.toString() ?? '');

    String tittle = "Konfirmasi bayar Hp Pascabayar";
    String content =
        "Anda akan membayar tagihan $providerName seharga ${CoreFunction.moneyFormatter(responseInquiryPasca?.total)}?\n Bukti transaksi pembayaran dikirim via E-mail. Pastikan E-mail yang terdaftar sudah benar.}";
    Set<String> contentDialog = {tittle, content};

    // routePush(
    //     Bill(
    //       billModel: billModel,
    //       methodPayment: onPayment,
    //       contentDialog: contentDialog,
    //       userDataBox: UserBox(),
    //     ),
    //     RouterType.cupertino
    // );
  }
}
