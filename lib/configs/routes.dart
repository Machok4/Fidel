import 'package:acs314_project/views/login.dart';
import 'package:acs314_project/views/signup.dart';
import 'package:acs314_project/views/homescreen.dart';
import 'package:get/get.dart';
import 'package:acs314_project/views/profile.dart';
var routes = [
  GetPage(name: "/profilescreen",page: () => ProfileScreen()),
  GetPage(name: "/", page: () => LoginScreen()),
  GetPage(name: "/signup", page: () => SignUpScreen()),
  GetPage(name: "/homescreen", page: () => Homescreen()),
];
