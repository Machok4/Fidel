
import 'package:acs314_project/controllers/signupcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Signupcontroller signupController = Get.put(Signupcontroller());
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: Text(
           "SIGN UP",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Text(
                  "Sign up",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Enter email",style: TextStyle(fontSize:15,fontWeight: FontWeight.w700),),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    hintText:"Use a valid email",
                    
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 30),
                Padding(padding: const EdgeInsets.fromLTRB(10, 0, 0, 0)),
                
                Row(
                  children: [
                    Text("Create password",style: TextStyle(fontSize:15,fontWeight: FontWeight.w700),),
                   
                  ],
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: "Don't use an easy password",
                    suffixIcon: Icon(Icons.visibility_off),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text("Confirm password",style: TextStyle(fontSize:15,fontWeight: FontWeight.w700),),
                   
                  ],
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: "Re-enter the password",
                    suffixIcon: Icon(Icons.visibility_off),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 30),
                MaterialButton(
                  onPressed: () {
                  bool success = Signupcontroller.signup(
                    emailController.text,
                    passwordController.text,
                  );
                  if (success) {
                    Get.offAndToNamed("/homescreen");
                  } else {
                    Get.snackbar(
                      "Signup Failed",
                      "Invalid email or password",
                      progressIndicatorBackgroundColor: Colors.red,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                 
                  color: Colors.blue,
                  minWidth: double.infinity,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    "Sign Up",
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
                          Text("Already have an account??"),
                          SizedBox(width: 6),
                          GestureDetector(
                            
                            onTap: () => Get.toNamed("/login"),
                             child: Text("Login", style: TextStyle(color: Colors.blue)),
                              // Handle login tap
                            
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
