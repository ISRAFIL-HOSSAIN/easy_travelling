import 'package:easy_travel/controller/register_controller.dart';
import 'package:easy_travel/views/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/input_fields.dart';
import '../../widget/submit_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  RegisterationController registerationController =
      Get.put(RegisterationController());

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
                  padding: EdgeInsets.all(25),
                  child: Center(
                      child: Column(
                    children: [
                      InputTextFieldWidget(
                          registerationController.nameController, 'voornaam'),
                      const SizedBox(
                        height: 20,
                      ),
                      InputTextFieldWidget(
                          registerationController.nameController, 'voornaam'),
                      const SizedBox(
                        height: 30,
                      ),
                      SubmitButton(
                        onPressed: () =>
                            registerationController.registerWithEmail(),
                        title: 'Login',
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                              width: 90,
                              height: 3,
                              color: Color.fromARGB(255, 215, 215, 215)),
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
                            color: Color.fromARGB(255, 215, 215, 215),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          Container(
                            height: 75,
                            width: 75,
                            padding: EdgeInsets.all(15),
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
                            height: 75,
                            width: 75,
                            padding: EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Image.asset(
                              "assets/images/fb.png",
                            ),
                          ),
                          const SizedBox(
                            width: 30,
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
                                  builder: (context) => SignupScreen()));
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
                  )),
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}
