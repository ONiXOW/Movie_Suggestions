
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../entities/LoginResponseEntity.dart';
import '../../entities/RegisterResponseEntity.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String confirmPassword, String phone,int avaterId);

  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}
