import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_suggestions/error/failures.dart';
import 'package:movie_suggestions/ui/screens/login_screen/auth/AuthRepostiory.dart';
import 'package:movie_suggestions/ui/screens/login_screen/entities/LoginResponseEntity.dart';
import 'package:movie_suggestions/ui/screens/register_screen/auth/register_auth_repository.dart';
import 'package:movie_suggestions/ui/screens/register_screen/auth/RegisterResponseEntity.dart';
import 'package:movie_suggestions/ui/screens/register_screen/auth/auth_remote_data_source.dart';
@Injectable(as:RegisterAuthRepository)
class RegisterRepositoryImpl implements RegisterAuthRepository{
  RegisterRemoteDataSource registerRemoteDataSource;
  RegisterRepositoryImpl({required this.registerRemoteDataSource});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,String email,String password,String confirmPassword,String phone,int avaterId) async{
var either=await registerRemoteDataSource.register(name, email, password, confirmPassword, phone, avaterId);

return either.fold((error)=>Left(error),(response)=>Right(response));
  }

  
  
}