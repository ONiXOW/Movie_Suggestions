
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../entities/LoginResponseEntity.dart';
import '../../../entities/RegisterResponseEntity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password,String rePassword, String phone,int avaterId);

  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}
