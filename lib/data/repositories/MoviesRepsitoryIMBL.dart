import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/failures.dart';
import '../../domain/repositories/MoviesRepository.dart';
import '../../domain/repositories/data_sources/remote_data_sources/MoviesRemoteDataSource.dart';
import '../../domain/use_cases/MoviesResponseList.dart';

@Injectable(as:MoviesRepository)
class MoviesRepositoryIMBL implements MoviesRepository{
 MoviesRemoteDataSource moviesRemoteDataSource;
 MoviesRepositoryIMBL({required this.moviesRemoteDataSource});
  @override
  Future<Either<Failures, MoviesResponseEntity>> getAllMovies()async {
    var either=await moviesRemoteDataSource.getAllMovies();
    return either.fold((error)=>Left(error),
            (categoryResponse)=>Right(categoryResponse));

  }



}