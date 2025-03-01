
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../use_cases/MoviesResponseList.dart';



abstract class MoviesRemoteDataSource{

  Future<Either<Failures,MoviesResponseEntity>>getAllMovies();


}