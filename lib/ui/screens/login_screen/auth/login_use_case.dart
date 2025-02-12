import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_suggestions/ui/screens/login_screen/auth/AuthRepostiory.dart';

import '../../../../error/failures.dart';
import '../entities/LoginResponseEntity.dart';
@injectable
 class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});


  Future<Either<Failures,LoginResponseEntity>>invoke(String email,String password)
  {
    return authRepository.login(email, password);
  }
}