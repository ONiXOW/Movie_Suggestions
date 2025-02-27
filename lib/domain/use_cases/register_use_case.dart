
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';
import '../entities/RegisterResponseEntity.dart';
import '../repositories/auth/auth_repository.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, RegisterResponseEntity>> invoke(String name,
      String email, String password, String confirmPassword, String phone,int avaterId) {
    return authRepository.register(name, email, password, confirmPassword, phone,avaterId);
  }
}
