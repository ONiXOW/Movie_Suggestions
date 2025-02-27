
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_cases/login_use_case.dart';
import 'login_states.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());

  //todo: hold data - handle logic

  TextEditingController mailController =
      TextEditingController(text: 'amira66@route.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Amira123456');
  var formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
          mailController.text, passwordController.text);
      either.fold((error) {
        emit(LoginErrorState(failures: error));
      }, (response) {
        emit(LoginSuccessState(responseEntity: response));
      });
    }
  }
}
