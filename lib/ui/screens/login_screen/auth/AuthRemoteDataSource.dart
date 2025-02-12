import 'package:dartz/dartz.dart';

import '../../../../error/failures.dart';
import '../entities/LoginResponseEntity.dart';

abstract class  AuthRemoteDataSource{


  Future<Either<Failures,LoginResponseEntity>>login(String email,String password);
}