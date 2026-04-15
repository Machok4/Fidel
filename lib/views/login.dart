import 'package:acs314_project/configs/colors.dart';
import 'package:acs314_project/controllers/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

LoginController loginController = Get.put(LoginController());
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "LOGIN SCREEN",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/loginimage.jpg.jpg', height: 100, width: 100),
              Text(
                "Login Screen",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Enter username",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Use email or phone number",

                  prefixIcon: Icon(Icons.person),
                ),
              ),
              //SizedBox(height: 30),
              Padding(padding: const EdgeInsets.fromLTRB(10, 0, 0, 0)),

              Row(
                children: [
                  Text(
                    "Enter password",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Obx(
                () => TextField(
                  controller: passwordController,
                  obscureText: !loginController.isPasswordVisible.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: "Don't use an easy password",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        loginController.togglePasswordVisibility();
                      },
                      child: Icon(
                        loginController.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              SizedBox(height: 30),
              MaterialButton(
                onPressed: () async {
                  final result = await loginController.login(
                    usernameController.text,
                    passwordController.text,
                  );
                  if (result['success'] == 1) {
                    Get.offAndToNamed("/homescreen");
                  } else {
                    Get.snackbar(
                      "Login Failed",
                      result['message'] ?? "Invalid username or password",
                      progressIndicatorBackgroundColor: Colors.red,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                color: Colors.green,
                minWidth: double.infinity,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 5.0, 10.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Don't have an account??"),
                        SizedBox(width: 6),
                        GestureDetector(
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            Get.toNamed("/signup");
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Forgot password??"),
                        SizedBox(width: 6),
                        Text(
                          "Reset password",
                          style: TextStyle(color: primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
