import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/resources/string_manager.dart';


class LoginApiService {
  LoginApiService();

  Future<Map<String, dynamic>> loginn({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    Uri uri = Uri.parse('${AppStrings.baseUrl}$endpoint');
    http.Response response = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to post data: ${response.body}");
    }
  }
}
