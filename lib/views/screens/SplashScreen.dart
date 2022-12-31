import 'dart:async';

import 'package:easy_travel/views/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    double sheight = MediaQuery.of(context).size.height;
    double swidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backgroudsplash.png"),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Container(
              height: sheight / 5,
              width: swidth,
              child: Image.asset("assets/images/top.png", fit: BoxFit.fill)),
          Container(
            height: sheight / 1.67,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  DefaultTextStyle(
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      fontSize: 32,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(226, 43, 34, 4),
                      fontWeight: FontWeight.w700,
                    )),
                    child: const Text(
                      "Easy Travelling",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    width: 140,
                  ),
                ],
              ),
            ),
          ),
          Container(
              height: sheight / 5,
              width: swidth,
              child: Image.asset("assets/images/bottomdesign.png",
                  fit: BoxFit.fitWidth)),
        ],
      ),
    );
  }
}
