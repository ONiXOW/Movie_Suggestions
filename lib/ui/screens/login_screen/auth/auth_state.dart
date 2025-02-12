part of 'login_view_model.dart';

@immutable
 class LoginState {}

final class AuthInitial extends LoginState {}


class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{
  LoginResponseEntity responseEntity;
  LoginSuccessState({required this.responseEntity});
}
class LoginErrorState extends LoginState {
  Failures error;

  LoginErrorState({required this.error});
}