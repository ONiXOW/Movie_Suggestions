
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';
import '../../domain/entities/LoginResponseEntity.dart';
import '../../domain/entities/RegisterResponseEntity.dart';
import '../../domain/repositories/auth/auth_repository.dart';
import '../../domain/repositories/data_sources/remote_data_sources/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password,String confirmPassword, String phone,int avaterId) async {
    var either = await authRemoteDataSource.register(
        name, email, password,confirmPassword, phone,avaterId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password) async {
    var either = await authRemoteDataSource.login(email, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
