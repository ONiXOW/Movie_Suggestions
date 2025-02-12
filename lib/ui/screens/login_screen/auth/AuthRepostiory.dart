import 'package:dartz/dartz.dart';
import 'package:movie_suggestions/error/failures.dart';
import 'package:movie_suggestions/ui/screens/login_screen/entities/LoginResponseEntity.dart';

abstract class AuthRepository {

Future<Either<Failures,LoginResponseEntity>>login(String email,String password);

}