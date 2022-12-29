import 'dart:convert';

import 'package:easy_travel/api.dart';
import 'package:easy_travel/views/screens/Home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../widget/Notify.dart';

class SignupController extends GetxController {
  String firstname = "";
  String lastname = "";
  String email = "";
  String password = "";
  String address = "";
  String phone = "";

  register(String firstname, String lastname, String email, String password,
      String address, String phone) {
    if (firstname.isEmpty) {
      Notify.snackbar("FirstName is required", "Please Input FirstName");
    } else if (lastname.isEmpty) {
      Notify.snackbar("LastName is required", "Please Input LastName");
    } else if (!isEmailValid(email)) {
      Notify.snackbar("Sign Up Failed", "Email Id is not Valid");
    } else if (password.isEmpty) {
      Notify.snackbar(
        "Password Not Empty",
        "Please Input Password",
      );
    } else if (address.isEmpty) {
      Notify.snackbar("Address is required", "Please Input Address");
    } else if (phone.isEmpty) {
      Notify.snackbar("Phone is required", "Please Input Phone");
    } else {
      firstname = firstname;
      lastname = lastname;
      email = email;
      password = password;
      address = address;
      phone = phone;

      registerWithEmail();
    }
  }

  bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  // static bool isPassWord(String password) {
  //   bool passwordValid =
  //       RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-6])(?=.*?[!@#\$&*~]).{8,}$')
  //           .hasMatch(password);
  //   return passwordValid;
  // }

  // Future<void> sendUserDataToServer() async {}
  //   Map<String, dynamic> dataBody = {
  //     SignUpModel.USER_EMAIL: email,
  //     SignUpModel.USER_PASS: password,
  //   };

  //   var dataToSend = json.encode(dataBody);
  //   var response = await http.post(Uri.parse(SignUpModel.signup_api_url),
  //       body: dataToSend);

  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> responseData = jsonDecode(response.body);
  //     if (responseData['r_msg'] == "success") {
  //       Get.to(VerificationScreen());
  //     } else if (responseData['r_msg'] == "failed") {
  //       Get.snackbar("Sign Up Failed", "Server Problem Occured",
  //           backgroundColor: Colors.black,
  //           snackPosition: SnackPosition.BOTTOM,
  //           borderRadius: 10,
  //           borderWidth: 2);
  //     } else if (responseData['r_msg'] == "email already exist") {
  //       Get.snackbar(
  //         "Sign Up Failed",
  //         "You have alreday registered",
  //         backgroundColor: Colors.black,
  //         snackPosition: SnackPosition.BOTTOM,
  //         borderRadius: 10,
  //         borderWidth: 2,
  //       );
  //     }
  //   } else if (response.statusCode != 200) {
  //     const Failure(message: "Something is Wrong !");
  //   } else {
  //     const CircularProgressIndicator(
  //       color: Colors.blue,
  //     );
  //   }
  // }

  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.register);
      Map body = {
        'first_name': firstname.toString(),
        'phone': phone,
        'address': address,
        'last_name': lastname,
        'email': email.trim(),
        'password': password,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['errorCode'] == "0") {
          Notify.snackbar("Success", "Signup Successfully !");
          Get.to(const HomeScreen());
        } else if (json['errorCode'] == "1") {
          Notify.snackbar("Failed", json['errorMsg']);
        }
      } else {
        Notify.snackbar("Failed", "Something is Worng");
      }
    } catch (e) {
      print(e);
      Notify.snackbar("Failed", "Something is Worng");
    }
  }
}
