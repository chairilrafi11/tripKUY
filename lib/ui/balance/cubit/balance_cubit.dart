import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/core/database/box/user/user_box_controller.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/ui/profile/provider/profile_provider.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {

  BalanceCubit() : super(BalanceLoaded(balance: authUsecase.userBox.totalBalance!));

  onGetBalance() async {
    emit(BalanceLoading());
    var userBox = await ProfileProvider.profile();
    userBox.authToken = authUsecase.userBox.authToken!;
    emit(BalanceLoaded(balance: userBox.totalBalance!));
    authUsecase.setUser(userBox);
    UserBoxController.saveUser(userBox);
  }
}
