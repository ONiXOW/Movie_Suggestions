import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movie_suggestions/error/failures.dart';
import 'package:movie_suggestions/ui/screens/login_screen/auth/login_use_case.dart';
import 'package:movie_suggestions/ui/screens/login_screen/entities/LoginResponseEntity.dart';

part 'auth_state.dart';
@injectable
class LoginViewModel extends Cubit<LoginState> {
  final formKey = GlobalKey<FormState>();
  LoginViewModel({required this.loginUseCase}) : super(AuthInitial());

  LoginUseCase loginUseCase;

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  void login()async{

    if(formKey.currentState?.validate()==true){
emit(LoginLoadingState());
var either =await loginUseCase.invoke(emailController.text, passwordController.text);
either.fold((error){
  emit(LoginErrorState(error: error));
},(response){
  emit(LoginSuccessState(responseEntity: response));
});
    }

  }
}
