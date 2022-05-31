import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:chairil/core/util/util.dart';
import 'package:chairil/ui/counter/view/counter_view.dart';
part 'splashscreen_state.dart';

class SplashscreenCubit extends Cubit<SplashscreenState> {
  
  SplashscreenCubit() : super(SplashscreenInitial());

  Future checkSessions() async {
    CoreFunction.logPrint("Check", "Sessions");
    pushAndRemoveUntil(CounterView(), RouterType.material);
  }

}
