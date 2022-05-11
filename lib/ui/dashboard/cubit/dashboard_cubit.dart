import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:etekad/core/util/core_function.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {

  DashboardCubit() : super(const DashboardState(navBarItem: NavBarItem.home));

  DateTime? backButtonPressTime;
  final snackBarDuration = const Duration(seconds: 3);

  void pickItem(int i) async {
    // if (state != i) {
      switch (i) {
        case 0:
          emit(const DashboardState(navBarItem: NavBarItem.home));
          break;
        case 1:
          emit(const DashboardState(navBarItem: NavBarItem.order));
          break;
        case 2:
          emit(const DashboardState(navBarItem: NavBarItem.chat));
          break;
        case 3:
          emit(const DashboardState(navBarItem: NavBarItem.profile));
          break;
      }
    // }
  }

  Future<bool> handleWillPop() async {
    final now = DateTime.now();
    final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed = backButtonPressTime == null || now.difference(backButtonPressTime!) > snackBarDuration;

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = now;
      // CoreFunction.showToast("Tekan sekali lagi untuk keluar");
      return false;
    }
    return true;
  }
}
