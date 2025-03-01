import 'package:dartz/dartz.dart';

import '../../../../../core/customWidgets/error.dart';
import '../../model/login.dart';

abstract class LoginRepoContract {
  Future<Either<Failures, UserLogin>> loginUser({
    required String email,
    required String pass,
  });
}
