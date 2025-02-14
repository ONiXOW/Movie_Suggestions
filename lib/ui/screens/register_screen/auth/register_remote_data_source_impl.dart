import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_suggestions/error/failures.dart';
import 'package:movie_suggestions/ui/screens/register_screen/auth/RegisterResponseDm.dart';
import 'package:movie_suggestions/ui/screens/register_screen/auth/auth_remote_data_source.dart';
import 'package:movie_suggestions/web_services/model/endPoints.dart';
@Injectable(as: RegisterRemoteDataSource )
class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource{
  final Dio dio=Dio();
  @override
  Future<Either<Failures, RegisterResponseDm>> register(String name,String email,String password,String confirmPassword,String phone,int avaterId) async {
    try {
      final List<ConnectivityResult>connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await dio.post(EndPoints.register, data:
        {
          "name": name,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
          "phone": phone,
          "avaterId": avaterId,
        },
          options:Options(
            validateStatus: (status)=>true,
          )
        );
        var registerResponse = RegisterResponseDm.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorMessage: registerResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }
    }catch(e){
      print(e.toString());
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
    }




