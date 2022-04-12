import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/core/pintupay/pintupay_crypt.dart';
import 'package:pintupay/core/util/core_function.dart';
import 'package:pintupay/ui/menu/tv/model/tv_inquiry_request.dart';
import 'package:pintupay/ui/menu/tv/model/tv_payment_request.dart';
import 'package:pintupay/ui/menu/tv/model/tv_product_response.dart';
import 'package:pintupay/ui/menu/tv/provider/tv_provider.dart';

import '../../../../core/network/model/post_body.dart';
import '../../../../core/util/util.dart';

part 'tv_state.dart';

class TvCubit extends Cubit<TvState> {
  TvCubit() : super(TvInitial()){
    onGetProvider();
  }

  List<Set<String>> listInformation = [];
  late TvPaymentRequest tvPaymentRequest;

  Future<void> onGetProvider() async {
    TvProductResponse tvProductResponse = TvProductResponse();
    var products = await TVProvider.products();
    products.add(tvProductResponse);
    emit(TvLoaded(
      listProduct: products,
      product: tvProductResponse
    ));
  }

  void setProduct(TvProductResponse tvProductResponse){
    TvLoaded tvLoaded = state as TvLoaded;
    emit(TvLoaded(
      listProduct: tvLoaded.listProduct,
      product: tvProductResponse
    ));
  }

  Future onInquiry(String customerId) async {
    TvLoaded pdamLoaded = state as TvLoaded;
    var authUsecase;
    TvInquiryRequest tvInquiryRequest = TvInquiryRequest(
      act: "inquiry",
      authToken: authUsecase.userBox.authToken,
      pelId: customerId,
      product: pdamLoaded.product.product,
      totalPayment: ""
    );
    var inquiry = PintuPayCrypt().encrypt(jsonEncode(tvInquiryRequest), await PintuPayCrypt().getPassKeyPref());
    var result = await TVProvider.inquiry(BodyRequestV7(inquiry, inquiry).toJson());

    // if(result.noPel! = null){
      
    //   //? Create Object Payment
      
    //   PDAMPaymentModel paymentModel = PDAMPaymentModel(
    //     act: "payment",
    //     authToken: authUsecase.userBox.authToken,
    //     id: customerId,
    //     product: pdamLoaded.distric.name,
    //     productId: pdamLoaded.distric.id,
    //     totalPayment: result.totTagihan.toString(),
    //   );

    //   pdamPaymentModel = paymentModel;

    //   listInformation = [
    //     {"Jenis Transaksi", "Pdam"},
    //     {"Nama Pengguna", result.nama.toString()},
    //     {"No Pelanggan", result.noPel.toString()},
    //     {"No Reff", result.referalNumber.toString()},
    //     {"Periode", result.periode.toString()},
    //     {"Stand", result.stand.toString()},
    //     {"Tagihan", CoreFunction.moneyFormatter(result.tagihan)},
    //     {"Biaya Admin", CoreFunction.moneyFormatter(result.beaAdmin)},
    //     {"Total Tagihan", CoreFunction.moneyFormatter(result.totTagihan)},
    //   ];

    //   routePush(
    //     PaymentView(
    //       listInformation: listInformation,
    //       paymentMethod: onPayment,
    //       feature: Feature.pdam,
    //     ), 
    //     RouterType.material
    //   );
    // }
  }

  Future onPayment() async {
    CoreFunction.showPin(navGK.currentContext!).then((value) async {
      if(value != null) {
      //   tvPaymentRequest.pin = value;
      //   var payment = PintuPayCrypt().encrypt(jsonEncode(pdamPaymentModel), await PintuPayCrypt().getPassKeyPref());
      //   var result = await PDAMProvider.payment(BodyRequestV7(payment, payment).toJson());

      //   BillStatusModel billStatusModel = BillStatusModel(
      //     billBody: listInformation.map((e){
      //       return BillBodyModel(e.first, e.last);
      //     }).toList(),
      //     status: ""
      //   );

      //   if(result.nama != null){
      //     routePush(
      //       BillView(
      //         billStatusModel: billStatusModel,
      //         billStatus: BillStatus.success,
      //       ),
      //       RouterType.material
      //     );
      //   }
      }
    });
  }

}
