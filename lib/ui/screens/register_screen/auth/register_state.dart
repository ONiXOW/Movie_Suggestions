


import 'package:movie_suggestions/ui/screens/register_screen/auth/RegisterResponseEntity.dart';

abstract class RegisterState {}
class AuthInitial extends RegisterState {}


class RegisterLoadingState extends RegisterState {}
class RegisterSuccessState extends RegisterState {
  RegisterResponseEntity registerResponseEntity;
  RegisterSuccessState({required this.registerResponseEntity});
}
class RegisterFailedState extends RegisterState {
  var message;
  RegisterFailedState({required this.message});
}


