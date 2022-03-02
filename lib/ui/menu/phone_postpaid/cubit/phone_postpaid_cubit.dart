import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/ui/menu/phone_postpaid/provider/phone_postpaid_provider.dart';

part 'phone_postpaid_state.dart';

class PhonePostpaidCubit extends Cubit<PhonePostpaidState> {
  PhonePostpaidCubit() : super(PhonePostpaidInitial());

  onInquiry(){
    PhonePostpaidProvider.sample();
  }
}
