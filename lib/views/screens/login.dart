import 'package:easy_travel/controller/register_controller.dart';
import 'package:easy_travel/views/screens/signup.dart';
import 'package:easy_travel/widget/passwordfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/login_controller.dart';
import '../../widget/input_fields.dart';
import '../../widget/submit_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  final _globalKey = GlobalKey<FormState>();
  bool passwordvisible = true;

  String emailError = "Email Can not be empty ";
  String passwordError = "Password Can not be empty ";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/backgoundimage.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        SafeArea(
            child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/images/title.png"),
                const Text(
                  "Inloggen",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Color.fromARGB(255, 235, 235, 235),
                      fontFamily: "Poppins_medium",
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Om door te gaan",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Color.fromARGB(255, 235, 235, 235),
                      fontFamily: "Poppins_normal",
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Center(
                      child: Form(
                    key: _globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                            controller: emailController,
                            hintText: "Gebruikersnaam",
                            error: emailError,
                            onUseridValueChange: (value) {
                              print(value);
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        PasswordField(
                            controller: passwordController,
                            hintText: "Wachtwoord",
                            passwordvisible: passwordvisible,
                            error: passwordError,
                            onUseridValueChange: (value) {
                              print(value);
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        SubmitButton(
                          handleButtonClick: () {
                            signin();
                          },
                          title: 'Login',
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 90,
                                height: 2,
                                color:
                                    const Color.fromARGB(255, 215, 215, 215)),
                            const SizedBox(width: 5),
                            const Text(
                              "Inloggen met ",
                              style: TextStyle(
                                color: Color.fromARGB(255, 248, 246, 246),
                                fontFamily: "Poppins_medium",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 90,
                              height: 2,
                              color: const Color.fromARGB(255, 215, 215, 215),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                height: 40,
                                width: 40,
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: Image.asset(
                                  "assets/images/googlelogo.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Center(
                              child: Container(
                                height: 40,
                                width: 40,
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: Image.asset(
                                  "assets/images/fb.png",
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: const Text(
                                "Geen account?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Poppins_normal",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Center(
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen()));
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text(
                                  'Aanmaken',
                                  style: TextStyle(
                                    fontFamily: "Poppins_normal",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                )
              ],
            ),
          ),
        ))
      ],
    );
  }

  void signin() {
    final isValid = _globalKey.currentState!.validate();
    if (isValid) {
      LoginController.login(
        emailController.text,
        passwordController.text,
      );
    } else {
      return;
    }
  }
}
