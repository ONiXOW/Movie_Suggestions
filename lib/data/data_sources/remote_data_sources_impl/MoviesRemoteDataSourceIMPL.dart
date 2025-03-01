import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api/api_manager.dart';
import '../../../core/api/end_points.dart';
import '../../../core/error/failures.dart';
import '../../../domain/repositories/data_sources/remote_data_sources/MoviesRemoteDataSource.dart';
import '../../../domain/use_cases/MoviesResponseList.dart';

@Injectable(as: MoviesRemoteDataSource)
class MoviesRemoteDataSourceIMPL implements MoviesRemoteDataSource{
 ApiManager apiManager;
 MoviesRemoteDataSourceIMPL({required this.apiManager});

  @override
  Future<Either<Failures, MoviesResponseEntity>> getAllMovies()async {

    var response=await apiManager.getData(endPoint: EndPoints.getMovies);
    var registerResponses=await MoviesResponseEntity.fromJson(response.data);

    if (response.statusCode! >= 200 || response.statusCode! < 300){
      return Right(registerResponses);

    }else{
      return Left(ServerError(errorMessage: registerResponses.statusMessage!));
    }
  }




}