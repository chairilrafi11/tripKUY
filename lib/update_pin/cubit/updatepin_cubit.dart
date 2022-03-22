import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'updatepin_state.dart';

class UpdatepinCubit extends Cubit<UpdatepinState> {
  UpdatepinCubit() : super(UpdatepinInitial());
}
