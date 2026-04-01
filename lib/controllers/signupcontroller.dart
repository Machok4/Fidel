import 'package:get/state_manager.dart';

class Signupcontroller extends GetxController {
  // Your login logic here

  var username;
  var password;
  var isPasswordVisible = false.obs;
  signup(user, pass) {
    // Implement your signup logic here
    username = user;
    password = pass;
    if (username == "Fidel" && password == "12345") {
      return true;
    } else {
      return false;
    }
  }

  togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
