import 'dart:convert';

import 'package:easy_travel/api.dart';
import 'package:easy_travel/views/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/Notify.dart';

class LoginController extends GetxController {
  String email = "";
  String password = "";

  static login(String email, String password) {
    if (!isEmailValid(email)) {
      Notify.snackbar(
        "Sign Up Failed ",
        "Email Id is not valid ",
      );
    } else if (password.isEmpty) {
      Notify.snackbar("Password not empty ", "Please Input Password");
    } else {
      email = email;
      password = password;
      loginWithEmail(email, password);
    }
  }

  static bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  static bool isPassWord(String password) {
    bool passwordValid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-8])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(password);
    return passwordValid;
  }

  static Future<void> loginWithEmail(email, password) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login);
      Map body = {
        'email': email.trim(),
        'password': password,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      print("Response is : ");
      print(response.body);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['errorCode'] == "0") {
          Notify.snackbar("Success", "Login Successfully !");
          Get.to(const HomeScreen());
        } else if (json['errorCode'] == "1") {
          Notify.snackbar("Failed", "Something is Wrong !");
        }
      } else {
        Notify.snackbar("Failed", "Something is wrong ");
      }
    } catch (error) {
      Notify.snackbar("Failed", "Something is wrong ");
    }
  }
}
