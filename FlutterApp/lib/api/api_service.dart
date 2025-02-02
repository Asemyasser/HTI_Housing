import 'package:http/http.dart' as http; // Import HTTP package
import 'dart:convert';
import 'LoginResponseModel.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    String url = 'https://htihousing-eel315fa.b4a.run/auth/login';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(loginRequestModel.toJson()),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(jsonDecode(response.body));
      } else {
        return LoginResponseModel.fromJson({
          'token': null,
          'error': 'Login failed: ${response.statusCode} - ${response.body}',
        });
      }
    } catch (e) {
      print("Error: $e");
      return LoginResponseModel(
        token: null,
        error: 'An error occurred: $e',
      );
    }


    }
}