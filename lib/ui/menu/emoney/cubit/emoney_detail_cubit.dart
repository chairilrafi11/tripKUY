import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nav_router/nav_router.dart';
import 'package:pintupay/ui/menu/emoney/model/emoney_product_response.dart';
import 'package:pintupay/ui/menu/emoney/provider/emoney_provider.dart';

import '../../../../core/network/model/post_body.dart';
import '../../../../core/pintupay/pintupay_crypt.dart';
import '../../../../core/usecase/auth_usecase.dart';
import '../../../../core/usecase/view_usecase.dart';
import '../../../../core/util/util.dart';
import '../../../bill/model/bill_body_model.dart';
import '../../../bill/model/bill_status_model.dart';
import '../../../bill/view/bill_view.dart';
import '../../../payment/view/payment_view.dart';
import '../model/emoney_payment_request.dart';
import '../model/emoney_provder.dart';

part 'emoney_detail_state.dart';

class EmoneyDetailCubit extends Cubit<EmoneyDetailState> {
  
  final EmoneyProviderResponse emoneyProviderResponse;

  EmoneyDetailCubit({required this.emoneyProviderResponse}) : super(EmoneyDetailLoading()){
    onGetProviderDetail(emoneyProviderResponse.id.toString());
  }
  
  late Emoney emoney;
  List<Set<String>> listInformation = [];
  late EmoneyPaymentRequest emoneyPaymentRequest;
  
  Future onGetProviderDetail(String providerId) async {
    var emoneys = await EmoneyProvider.providerDetail(providerId);
    if(emoneys.emoney != null) {
      emit(EmoneyDetailLoaded(emoneyProductResponse: emoneys));
    } else {
      emit(EmoneyDetailEmpty()); 
    }
  }


  Future inquiry(String id, Emoney value) async {
    emoney = value;
      
      //? Create Object Payment
      emoneyPaymentRequest = EmoneyPaymentRequest(
        payment: true,
        authToken: authUsecase.userBox.authToken,
        transaction: Transaction(
          balance: "cash",
          indentifierNumber: id,
          messages: emoney.name,
          productPriceId: emoney.productId,
          providerId: emoneyProviderResponse.id,
          transactionTypeId: 1,
          time: DateTime.now().toString(),
          userId: authUsecase.userBox.id
        )
      );

      listInformation = [
        {"Product", emoneyProviderResponse.name.toString()},
        {"No Pelanggan", id.toString()},
        {"Product", emoney.name.toString()},
        {"harga", CoreFunction.moneyFormatter(emoney.salePrice.toString())},
        {"Total", CoreFunction.moneyFormatter(emoney.salePrice)},
      ];

      routePush(
        PaymentView(
          listInformation: listInformation,
          paymentMethod: onPayment,
          feature: Feature.emoney,
        ), 
        RouterType.material
      );
    }
  
  onPayment(){
    CoreFunction.showPin(navGK.currentContext!).then((value) async {
      if(value != null) {
        emoneyPaymentRequest.pin = value;
        var payment = PintuPayCrypt().encrypt(jsonEncode(emoneyPaymentRequest), await PintuPayCrypt().getPassKeyPref());
        var result = await EmoneyProvider.payment(BodyRequestV7(payment, payment).toJson());

        if(result.id != null) {
          BillStatusModel billStatusModel = BillStatusModel(
            billBody: listInformation.map((e){
              return BillBodyModel(e.first, e.last);
            }).toList(),
            status: ""
          );

          routePush(BillView(
            billStatusModel
          ));
        }
      }
    });
  }
}
