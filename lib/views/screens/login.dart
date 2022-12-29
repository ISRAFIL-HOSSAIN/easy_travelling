import 'package:easy_travel/controller/register_controller.dart';
import 'package:easy_travel/views/screens/signup.dart';
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
                DefaultTextStyle(
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 26,
                    color: Color.fromARGB(225, 203, 224, 245),
                    fontWeight: FontWeight.w500,
                  )),
                  child: const Text(
                    "Inloggen",
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15),
                DefaultTextStyle(
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(225, 203, 224, 245),
                    fontWeight: FontWeight.w400,
                  )),
                  child: const Text(
                    "Om door te gaan",
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Center(
                      child: Form(
                    key: _globalKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            controller: emailController,
                            hintText: "E-mail adres",
                            error: emailError,
                            onUseridValueChange: (value) {
                              print(value);
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                            controller: passwordController,
                            hintText: "Wachtwoord",
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
                          children: [
                            Container(
                                width: 90,
                                height: 3,
                                color:
                                    const Color.fromARGB(255, 215, 215, 215)),
                            const SizedBox(width: 5),
                            const Text(
                              "Inloggen met ",
                              style: TextStyle(
                                color: Color.fromARGB(255, 226, 226, 226),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 90,
                              height: 3,
                              color: const Color.fromARGB(255, 215, 215, 215),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 60,
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: Image.asset(
                                "assets/images/googlelogo.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: Image.asset(
                                "assets/images/fb.png",
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
                          children: [
                            Container(
                              child: DefaultTextStyle(
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(223, 212, 233, 255),
                                  fontWeight: FontWeight.w500,
                                )),
                                child: const Text(
                                  "Geen account?",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            OutlinedButton(
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
                                style: TextStyle(color: Colors.black),
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
