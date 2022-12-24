import 'package:easy_travel/views/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 248, 250),
      appBar: AppBar(
          title: Text('Easy Traveling'),
          backgroundColor: Color.fromARGB(230, 251, 190, 23),
          actions: [
            TextButton(
                onPressed: () async {
                  final SharedPreferences? prefs = await _prefs;
                  prefs?.clear();
                  Get.offAll(const LoginScreen());
                },
                child: const Text(
                  'logout',
                  style: TextStyle(color: Color.fromARGB(255, 33, 33, 33)),
                ))
          ]),
      body: Column(children: [
        Container(
          color: Colors.white,
          child: Center(
            child: Column(children: [
              const SizedBox(height: 30),
              const Text(
                "Easy Travelling",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Row(children: [
                  const SizedBox(
                    width: 40,
                  ),
                  Container(
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 40,
                      width: 260,
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      "assets/images/accountlogo.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 20),
            ]),
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 241, 248, 250),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Routes",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            elevation: 4.0,
                            child: Column(children: [
                              Container(
                                height: 200.0,
                                width: MediaQuery.of(context).size.width,
                                child: Image.asset(
                                  "assets/images/sign_back.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.centerLeft,
                                child: Text("Hello"),
                              )
                            ]),
                          ),
                        ]),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
