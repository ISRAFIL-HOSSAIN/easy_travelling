import 'package:easy_travel/views/screens/login.dart';
import 'package:easy_travel/views/screens/routes_single.dart';
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
    var img = "assets/images/sign_back.png";
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 248, 250),
      appBar: AppBar(
          title: const Text('Easy Traveling'),
          backgroundColor: const Color.fromARGB(230, 251, 190, 23),
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
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: Column(children: [
                const SizedBox(height: 15),
                const Text(
                  "Easy Travelling",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
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
          const SizedBox(
            height: 15,
          ),
          Container(
            color: const Color.fromARGB(255, 241, 248, 250),
            padding: EdgeInsets.only(right: 250),
            child: const Text(
              "Routes",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          // List of Map routes
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              Card(
                                elevation: 10.0,
                                margin: EdgeInsets.only(bottom: 15),
                                child: Column(children: [
                                  GestureDetector(
                                    onTap: () {
                                      showDialogFunc(context, img[index]);
                                    },
                                    child: Container(
                                      height: 200.0,
                                      width: MediaQuery.of(context).size.width,
                                      child: Image.asset(
                                        img,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SingleScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(16.0),
                                      alignment: Alignment.centerLeft,
                                      child: const Text("Hello"),
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ));
                    }),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

showDialogFunc(BuildContext context, String img) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: Material(
                type: MaterialType.transparency,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Color.fromARGB(255, 80, 80, 80)),
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => Get.back(),
                            child: Container(
                              height: 20,
                              width: 20,
                              child: Image.asset("assets/images/cancel.png"),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.asset(img),
                      )
                    ],
                  ),
                )));
      });
}
