import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_suggestions/error/failures.dart';
import 'package:movie_suggestions/ui/screens/register_screen/auth/register_auth_repository.dart';
import 'package:movie_suggestions/ui/screens/register_screen/auth/RegisterResponseEntity.dart';


@injectable
class RegisterUseCase{

  RegisterAuthRepository authRepository;
  RegisterUseCase({required this.authRepository});

 Future<Either<Failures,RegisterResponseEntity>>invoke(String name,String email,String password,String confirmPassword,String phone,int avaterId){

   return authRepository.register(name, email, password, confirmPassword, phone, avaterId);
  }
}