import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_suggestions/web_services/model/RegisterResponse.dart';

import 'endPoints.dart';

class ApiService {
  // تعريف الـ baseUrl
  static const String baseUrl = 'https://route-movie-apis.vercel.app/';

  // دالة login
  static Future<Map<String, dynamic>?> login(
      String email, String password) async {
    final url =
        Uri.parse(baseUrl + EndPoints.login); // دمج baseUrl مع الـ endpoint
    try {
      final response = await http.post(
        url,
        body: jsonEncode({'email': email, 'password': password}),
      );

      // تحقق من حالة الاستجابة
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        // طباعة معلومات الخطأ
        print('Login failed: ${response.statusCode}, ${response.body}');
        return {'error': 'Login failed'};
      }
    } catch (e) {
      // التعامل مع الأخطاء
      print('Error during login: $e');
      return {'error': 'An error occurred during login'};
    }
  }

  // دالة register
  static Future<RegisterResponse?> register(
      String name,
      String email,
      String password,
      String confirmPassword,
      String phone,
      int avaterId) async {
    final url =
        Uri.parse(baseUrl + EndPoints.register); // دمج baseUrl مع الـ endpoint

    final jsonData = jsonEncode(
      {
        'name': name,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'phone': phone,
        'avaterId': avaterId
      },
    );
    try {
      final response = await http.post(
        url,
        body: jsonData,
        headers: {'Content-Type': "application/json"},
        // headers: {'Content-Type': 'application/json'},
      );

      // تحقق من حالة الاستجابة
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return RegisterResponse.fromJson(jsonDecode(response.body));
      } else {
        // طباعة معلومات الخطأ
        print('Registration failed: ${response.statusCode}, ${response.body}');
        // return {'error': 'Registration failed'};
      }
    } catch (e) {
      // التعامل مع الأخطاء
      print('Error during registration: $e');
      // return {'error': 'An error occurred during registration'};
    }
  }
}
