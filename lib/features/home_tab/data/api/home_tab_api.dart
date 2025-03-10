import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../core/api/api_constants.dart';
import '../../../../core/api/api_endPoints.dart';
import '../model/MoviesListModel.dart';

class HomeTabApi{
  HomeTabApi();

  Future<MoviesListModel>? getMoviesList(String genre) async {
    Uri url = Uri.parse('${ApiConstants.movieUrl}${ApiEndPoints.movieList}?limit=50&genre=$genre');
    if (genre == '') {
      url = Uri.parse('${ApiConstants.movieUrl}${ApiEndPoints.movieList}?limit=50');
    }
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return MoviesListModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to get movies list: ${response.body}");
      }
    } catch (e) {
      throw Exception("Failed to get movies list: ${e.toString()}");
    }
  }

}
