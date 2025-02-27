
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';
import '../entities/LoginResponseEntity.dart';
import '../repositories/auth/auth_repository.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failures, LoginResponseEntity>> invoke(String email,
      String password) {
    return authRepository.login(email, password);
  }
}