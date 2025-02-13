import 'package:dartz/dartz.dart';

import '../../../../error/failures.dart';
import 'RegisterResponseEntity.dart';

abstract class RegisterRemoteDataSource{

  Future<Either<Failures,RegisterResponseEntity>> register(String name,String email,String password,String confirmPassword,String phone
      ,int avaterId);
}