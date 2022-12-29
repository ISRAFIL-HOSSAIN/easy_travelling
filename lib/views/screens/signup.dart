import 'package:easy_travel/controller/register_controller.dart';
import 'package:easy_travel/views/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/input_fields.dart';
import '../../widget/submit_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignupController signupController = Get.put(SignupController());
  final _globalKey = GlobalKey<FormState>();

  String firstnameError = "FirstName Can not be empty ";
  String lastnameError = "LastName Can not be empty ";
  String emailError = "Email Can not be empty ";
  String addressError = "Address Can not be empty ";
  String passwordError = "Password Can not be empty ";
  String phoneError = "Phone Can not be empty ";

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/sign_back.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        SafeArea(
            child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  DefaultTextStyle(
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 26,
                      color: Color.fromARGB(225, 203, 224, 245),
                      fontWeight: FontWeight.w600,
                    )),
                    child: const Text(
                      "Account aanmaken",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  DefaultTextStyle(
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(225, 203, 224, 245),
                      fontWeight: FontWeight.w400,
                    )),
                    child: const Text(
                      "Om door te gaan",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  registerWidget(),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Container(
                        child: DefaultTextStyle(
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(225, 203, 224, 245),
                            fontWeight: FontWeight.w400,
                          )),
                          child: const Text(
                            "Heeft u al een account ? ",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Inloggen',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
        ))
      ],
    );
  }

  Widget registerWidget() {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          CustomTextField(
              controller: firstnameController,
              hintText: 'voornaam',
              error: firstnameError,
              onUseridValueChange: (value) {
                print(value);
              }),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
              controller: lastnameController,
              hintText: 'achternaam',
              error: lastnameError,
              onUseridValueChange: (value) {
                print(value);
              }),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
              controller: emailController,
              hintText: 'E-mail adres',
              error: emailError,
              onUseridValueChange: (value) {
                print(value);
              }),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
              controller: addressController,
              hintText: 'adres',
              error: addressError,
              onUseridValueChange: (value) {
                print(value);
              }),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
              controller: mobileController,
              hintText: 'telefoon',
              error: phoneError,
              onUseridValueChange: (value) {
                print(value);
              }),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
              controller: passwordController,
              hintText: 'Wachtwoord',
              error: passwordError,
              onUseridValueChange: (value) {
                print(value);
              }),
          const SizedBox(
            height: 20,
          ),
          SubmitButton(
            handleButtonClick: () {
              signup();
            },
            title: 'Aanmaken',
          ),
        ],
      ),
    );
    
  }
  void signup() {
    final isValid = _globalKey.currentState!.validate();
    if (isValid) {
      signupController.register(
        firstnameController.text,
        lastnameController.text,
        emailController.text,
        passwordController.text,
        addressController.text,
        mobileController.text,
      );
    } else {
      return;
    }
  }

  
}
