


import '../../../../core/error/failures.dart';
import '../../../../domain/use_cases/MoviesResponseList.dart';


abstract class MoviesStates{}
class initialMoviesStates extends MoviesStates{}
class LoadingMoviesStates extends MoviesStates{}
class ErrorMoviesStates extends MoviesStates{
  Failures errorMessage;
  ErrorMoviesStates({required this.errorMessage })  ;
}
class SuccessMoviesStates extends MoviesStates{
  MoviesResponseEntity moviesResponseEntity;
  SuccessMoviesStates({required this.moviesResponseEntity});

}