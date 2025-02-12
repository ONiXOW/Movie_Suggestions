import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_suggestions/error/failures.dart';
import 'package:movie_suggestions/ui/screens/login_screen/auth/AuthRemoteDataSource.dart';
import 'package:movie_suggestions/ui/screens/login_screen/entities/LoginResponseDm.dart';
import 'package:movie_suggestions/ui/screens/login_screen/entities/LoginResponseEntity.dart';
import 'package:movie_suggestions/web_services/model/endPoints.dart';
@Injectable(as:AuthRemoteDataSource )
class AuthRemoteDataImpl implements AuthRemoteDataSource{
 Dio dio=Dio();
  @override
  Future<Either<Failures, LoginResponseDm>> login(String email, String password)async {
    // TODO: implement login

   try{
     var response= await dio.post(EndPoints.login,data: {
       "email":email,
       "password":password,
     });
     var loginResponse=LoginResponseDm.fromJson(response.data);

     if(response.statusCode!>=200&&response.statusCode!<300){
       return Right(loginResponse);
     }else {
       return Left(ServerError(errorMessage:loginResponse.message!));
     }


   }
   catch (e){
return Left(Failures(errorMessage: e.toString()));
   }
  }

}