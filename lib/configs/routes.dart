import 'package:acs314_project/views/login.dart';
import 'package:acs314_project/views/signup.dart';
import 'package:acs314_project/views/homescreen.dart';
import 'package:get/get.dart';


var routes =[
  GetPage(name: "/",page:()=>LoginScreen()),
  GetPage(name: "/signup", page:()=>SignUpScreen()),
 GetPage(name: "/homescreen", page:()=>Homescreen())
];