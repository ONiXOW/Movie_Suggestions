import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_suggestions/error/failures.dart';
import 'package:movie_suggestions/ui/screens/login_screen/auth/AuthRemoteDataSource.dart';
import 'package:movie_suggestions/ui/screens/login_screen/auth/AuthRepostiory.dart';
import 'package:movie_suggestions/ui/screens/login_screen/entities/LoginResponseEntity.dart';
@Injectable(as: AuthRepository)
 class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failures, LoginResponseEntity>> login(String email, String password)async {
    // TODO: implement login
var either=await authRemoteDataSource.login(email, password);
return either.fold((error)=>Left(error),(response)=>Right(response));
  }
  
}