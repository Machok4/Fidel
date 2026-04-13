import 'package:get/state_manager.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  var username;
  var password;
  var isPasswordVisible = false.obs;

  Future<Map<String, dynamic>> login(String user, String pass) async {
    username = user;
    password = pass;

    try {
      final response = await http.get(
        Uri.parse(
          "http://192.168.11.28/rootfolder/login.php?email=$username&password=$password",
        ),
      );

      final data = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && data['success'] == 1) {
        return data;
      }

      return {
        'success': 0,
        'message': data['message'] ?? 'Invalid email or password',
      };
    } catch (e) {
      return {'success': 0, 'message': 'Unable to reach the server: $e'};
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
