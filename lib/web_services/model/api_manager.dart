//
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:movie_suggestions/error/failures.dart';
// import 'package:movie_suggestions/web_services/model/RegisterModel.dart';
// import 'package:movie_suggestions/web_services/model/RegisterResponse.dart';
// import 'package:movie_suggestions/web_services/model/endPoints.dart';
//
// class ApiManager {
//   Dio dio=Dio();
//
//   Future<Either<Failures,RegisterResponse>>register({
//     required String name,
//     required String phone,
//     required String email,
//     required String password,
//     required String rePassword,
//     required int avaterId,
// })
//  async {
//
// var response=await dio.post(EndPoints.register,
//
//     data: {
//       "name":name,
//       "email":email,
//       "password":password,
//       "confirmPassword":rePassword,
//       "phone":phone,
//       "avaterId":avaterId,
// }
// );
//  var registerResponse=RegisterResponse.fromJson(response.data);
//
//  if(response.statusCode!>=200&&response.statusCode!<300){
//    return Right(registerResponse);
//  }else{
//    return Left(ServerError(errorMessage: registerResponse.message!));
//  }
//
//   }
//
//
// }
