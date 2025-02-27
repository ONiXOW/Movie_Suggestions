
import '../../../../core/error/failures.dart';
import '../../../../domain/entities/LoginResponseEntity.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  Failures failures;

  LoginErrorState({required this.failures});
}

class LoginSuccessState extends LoginStates {
  LoginResponseEntity responseEntity;

  LoginSuccessState({required this.responseEntity});
}
