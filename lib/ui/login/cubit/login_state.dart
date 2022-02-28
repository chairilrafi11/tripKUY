part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginChangePassword extends LoginState{
  final bool passwordView;

  const LoginChangePassword(this.passwordView);

  @override
  List<Object> get props => [passwordView];
}
