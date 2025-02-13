import 'package:dartz/dartz.dart';
import 'package:movie_suggestions/error/failures.dart';
import 'package:movie_suggestions/ui/screens/register_screen/auth/RegisterResponseEntity.dart';

abstract class RegisterAuthRepository{

 Future<Either<Failures,RegisterResponseEntity>> register(String name,String email,String password,String confirmPassword,String phone,int avaterId);
}