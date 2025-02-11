import 'dart:convert';
import 'package:http/http.dart' as http;

import 'endPoints.dart';

class ApiService {
  // تعريف الـ baseUrl
  static const String baseUrl = 'https://route-movie-apis.vercel.app/';

  // دالة login
  static Future<Map<String, dynamic>?> login(String email, String password) async {
    final url = Uri.parse(baseUrl + EndPoints.login); // دمج baseUrl مع الـ endpoint
    try {
      final response = await http.post(
        url,
        body: jsonEncode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
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
  static Future<Map<String, dynamic>?> register(
      String name, String email, String password, String confirmPassword, String phone) async {
    final url = Uri.parse(baseUrl + EndPoints.register); // دمج baseUrl مع الـ endpoint
    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'phone': phone,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      // تحقق من حالة الاستجابة
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        // طباعة معلومات الخطأ
        print('Registration failed: ${response.statusCode}, ${response.body}');
        return {'error': 'Registration failed'};
      }
    } catch (e) {
      // التعامل مع الأخطاء
      print('Error during registration: $e');
      return {'error': 'An error occurred during registration'};
    }
  }
}
