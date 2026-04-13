import 'package:get/state_manager.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Future<Map<String, dynamic>> signUp(
    String firstname,
    String email,
    String password,
    String confirmPassword,
  ) async {
    if (firstname.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      return {'success': 0, 'message': 'Please fill in all fields'};
    }

    if (password != confirmPassword) {
      return {'success': 0, 'message': 'Passwords do not match'};
    }

    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse(
          "http://localhost/rootfolder/create.php?firstname=$firstname&email=$email&password=$password&confirmPassword=$confirmPassword",
        ),
      );

      final data = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && data['success'] == 1) {
        isLoading.value = false;
        return {'success': 1, 'message': 'Account created successfully'};
      }

      isLoading.value = false;
      return {'success': 0, 'message': data['message'] ?? 'Sign up failed'};
    } catch (e) {
      isLoading.value = false;
      return {'success': 0, 'message': 'Unable to reach the server: $e'};
    }
  }
}
