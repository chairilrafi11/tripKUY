import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/core/network/model/post_body.dart';
import 'package:pintupay/core/pintupay/pintupay_crypt.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/core/usecase/view_usecase.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/bill/model/bill_body_model.dart';
import 'package:pintupay/ui/bill/model/bill_status_model.dart';
import 'package:pintupay/ui/bill/view/bill_view.dart';
import 'package:pintupay/ui/menu/pgn/model/pgn_inquiry_request_new.dart';
import 'package:pintupay/ui/menu/pgn/model/pgn_inquiry_request.dart';
import 'package:pintupay/ui/menu/pgn/provider/pgn_provider.dart';
import 'package:pintupay/ui/payment/view/payment_view.dart';

part 'pgn_state.dart';

class PGNCubit extends Cubit<PGNState> {

  PGNCubit() : super(PGNInitial());

  late PGNPaymentRequest pgnPaymentRequest;
  List<Set<String>> listInformation = [];

  Future onInquiry(String number) async {
   PGNInquiryRequest pgnInquiryRequest = PGNInquiryRequest(
      act: "inquiry",
      authToken: authUsecase.userBox.authToken,
      id: number,
      totalPayment: ""
    );
    var inquiry = PintuPayCrypt().encrypt(jsonEncode(pgnInquiryRequest), await PintuPayCrypt().getPassKeyPref());
    var result = await PGNProvider.inquiry(BodyRequestV7(inquiry, inquiry).toJson());

    if(result.idPel != null){
      
      //? Create Object Payment
      PGNPaymentRequest payment = PGNPaymentRequest(
        act: "payment",
        authToken: authUsecase.userBox.authToken,
        id: number,
        totalPayment: "",
        balance: "cash",
        transactionId: result.transactionId.toString()
      );

      pgnPaymentRequest= payment;

      listInformation = [
        {"Nama Pengguna", result.nama.toString()},
        {"No Pelanggan", result.idPel.toString()},
        {"No Reff", result.refnum.toString()},
        {"Jumlah Bulan", result.jmlBln.toString()},
        {"Daya", result.daya.toString()},
        {"Tagihan", CoreFunction.moneyFormatter(result.jmlBlnTagihan)},
        {"Biaya Admin", CoreFunction.moneyFormatter(result.admin)},
        {"Total Tagihan", CoreFunction.moneyFormatter(result.total)},
      ];

      routePush(
        PaymentView(
          listInformation: listInformation,
          paymentMethod: onPayment,
          feature: Feature.pgn,
        ), 
        RouterType.material
      );
    }
  }
    
  onPayment(){
    CoreFunction.showPin(navGK.currentContext!).then((value) async {
      if(value != null) {
        pgnPaymentRequest.pin = value;
        var payment = PintuPayCrypt().encrypt(jsonEncode(pgnPaymentRequest), await PintuPayCrypt().getPassKeyPref());
        var result = await PGNProvider.payment(BodyRequestV7(payment, payment).toJson());

        if(result.id != null){

          BillStatusModel billStatusModel = BillStatusModel(
            billBody: listInformation.map((e){
              return BillBodyModel(e.first, e.last);
            }).toList(),
            status: ""
          );

          routePush(
            BillView(
              billStatusModel: billStatusModel,
              billStatus: BillStatus.success,
            ),
            RouterType.material
          );

        }
      }
    });
  }
}
