import 'package:easy_travel/views/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Traveling'),
        backgroundColor: const Color.fromARGB(230, 251, 190, 23),
      ),
      body: Column(
        children: [
          Container(
            child: Center(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15, bottom: 21),
                    height: 40,
                    width: 28,
                    child: Image.asset(
                      "assets/images/backarrow.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            "Easy Travelling",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(height: 5),
                          const SizedBox(
                            width: 50,
                          ),
                          Container(
                            child: Image.asset(
                              "assets/images/logo.png",
                              height: 30,
                              width: 240,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
          DefaultTabController(
              length: 3,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 90,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Parkeren",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 90,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Overnachten",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 130,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 252, 252, 252),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.orange)),
                      child: Text(
                        "Boodschappen",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
