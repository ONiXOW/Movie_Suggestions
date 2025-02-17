import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'MoviesResponseModel.dart';
import 'endPoints.dart';

class ApiManager {
  static Future<MoviesResponseModel> getMovies() async {
    try {
      Uri url = Uri.parse(EndPoints.moviesList);

      // ✅ طباعة الرابط للتأكد منه
      debugPrint("Fetching data from: $url");

      var response = await http.get(url).timeout(Duration(seconds: 10));

      // ✅ طباعة كود الاستجابة
      debugPrint("Response Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        // ✅ طباعة بيانات الـ API
        debugPrint("API Response: $jsonResponse");

        return MoviesResponseModel.fromJson(jsonResponse);
      } else {
        throw Exception("Failed to load movies, Status Code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("API Error: $e");
      throw Exception("Error fetching movies: $e");
    }
  }
}
