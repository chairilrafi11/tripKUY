import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notifcation_state.dart';

class NotifcationCubit extends Cubit<NotifcationState> {
  NotifcationCubit() : super(NotifcationInitial());
}
