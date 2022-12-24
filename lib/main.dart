import 'package:easy_travel/views/screens/Home.dart';
import 'package:easy_travel/views/screens/signup.dart';
import 'package:easy_travel/views/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'SplashScreen': (context) => const SplashScreen(),
      'register': (context) => const SignupScreen(),
      'home' : (context)=>const HomeScreen(),
    },
  ));
}
