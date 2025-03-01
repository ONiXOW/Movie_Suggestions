
import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../use_cases/MoviesResponseList.dart';

abstract class MoviesRepository{

  Future<Either<Failures,MoviesResponseEntity>>getAllMovies();


}