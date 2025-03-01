
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_cases/MoviesResponseList.dart';
import '../../../../domain/use_cases/getMovies_UseCase.dart';

import 'Movies_States.dart';


@injectable
class MoviesViewModel extends Cubit<MoviesStates>{
  GetMoviesUseCase getMoviesUseCase;
  MoviesViewModel({required this.getMoviesUseCase}):super(initialMoviesStates());
  List<Movies>moviesList =[];

  void getAllMovies()async{
    emit(LoadingMoviesStates());
    var either=await  getMoviesUseCase.invoke();
    either.fold((error){
      emit(ErrorMoviesStates(errorMessage: error));
    }, (response){
      moviesList=response!.data! as List<Movies>   ;
      emit(SuccessMoviesStates(  moviesResponseEntity: response)); // Success state

    });
  }
}