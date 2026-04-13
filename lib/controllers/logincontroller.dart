import 'package:get/state_manager.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../configs/api_config.dart';

class LoginController extends GetxController {
  var username;
  var password;
  var isPasswordVisible = false.obs;

  Future<Map<String, dynamic>> login(String user, String pass) async {
    username = user;
    password = pass;

    try {
      final response = await http.post(
        ApiConfig.endpoint('login.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': username,
          'password': password,
        }),
      );

      final data = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && data['success'] == 1) {
        return data;
      }

      return {
        'success': 0,
        'message': data['message'] ?? 'Login failed',
      };
    } catch (_) {
      return {
        'success': 0,
        'message': 'Unable to reach the server',
      };
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
