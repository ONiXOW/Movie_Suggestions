
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:movie_suggestions/shared/cache_network.dart';
import 'package:movie_suggestions/web_services/api_constant.dart';
import 'auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avaterId,

  })
  async{
    emit(RegisterLoadingState());
    Uri url=Uri.parse(ApiConstant.registerUrl);

   var response=await http.post(url,
       body: {
     'name':name,
     'email':email,
     'password':password,
     'phone':phone,
     'confirmPassword':confirmPassword,
         "avaterId":avaterId

   }
   );
dynamic responseBody=jsonDecode(response.body);
   if(response.statusCode==200||response.statusCode==201){
     emit(RegisterSuccessState());
     //emit success
     print(response.body);
   }
   else{

     emit(RegisterFailedState(message:responseBody['message'].toString(),));
     print(response.body);
     //emit failed

   }
  }
  void login({required String email,required String password })
  async{
emit(LoginLoadingState());

    try{
      Response response=await http.post(Uri.parse('https://route-movie-apis.vercel.app/auth/login'),
          body: {
        "email":email,
        "password":password,
      });
if(response.statusCode==200||response.statusCode==201){
  var responseData=jsonDecode(response.body);
  if(responseData['message']=='Success Login'){
    debugPrint('Login is Successfully and his data is :$responseData');
   await CacheNetwork.insertCache(key: 'token', value: responseData['data']['token']);
    emit(LoginSuccessState());
  }
  else{
    debugPrint('Failed to Login and Reason is  :${responseData['message']}');
    emit(LoginFailedState(message:responseData['message']));
  }
}
    }catch (e){
      emit(LoginFailedState(message: e.toString()));
    }
  }

}
