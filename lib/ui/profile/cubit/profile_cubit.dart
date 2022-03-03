import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pintupay/ui/profile/provider/profile_provider.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {

  ProfileCubit() : super(ProfileInitial());

  Future getProfile() async {
    await ProfileProvider.profile();
  }
}
