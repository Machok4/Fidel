import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  // Your login logic here


var username;
var password;
var isPasswordVisible = false.obs;
login(user, pass) {
  // Implement your login logic here
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