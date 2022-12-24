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
  RegisterationController registerationController =
      Get.put(RegisterationController());

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
    return Column(
      children: [
        InputTextFieldWidget(
            registerationController.nameController, 'voornaam'),
        const SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
            registerationController.nameController, 'Achternaam'),
        const SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
            registerationController.emailController, 'E-mail adres'),
        const SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
            registerationController.passwordController, 'Wachtwoord'),
        const SizedBox(
          height: 30,
        ),
        SubmitButton(
          onPressed: () => registerationController.registerWithEmail(),
          title: 'Aanmaken',
        )
      ],
    );
  }
}
