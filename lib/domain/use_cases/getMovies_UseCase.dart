import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failures.dart';
import '../repositories/MoviesRepository.dart';
import 'MoviesResponseList.dart';



@injectable
class GetMoviesUseCase{
  MoviesRepository moviesRepository;
  GetMoviesUseCase({required this.moviesRepository});
  Future<Either<Failures, MoviesResponseEntity>> invoke(){
   return moviesRepository.getAllMovies();
  }

}