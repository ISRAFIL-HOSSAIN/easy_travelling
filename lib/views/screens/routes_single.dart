import 'package:easy_travel/views/screens/details_page.dart';
import 'package:easy_travel/views/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingleScreen extends StatefulWidget {
  const SingleScreen({super.key});

  @override
  State<SingleScreen> createState() => _SingleScreenState();
}

class _SingleScreenState extends State<SingleScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 248, 250),
      appBar: AppBar(
        title: const Text('Easy Traveling'),
        backgroundColor: const Color.fromARGB(230, 251, 190, 23),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
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
          Container(
            padding: EdgeInsets.all(10),
            color: const Color.fromARGB(255, 241, 248, 250),
            child: const Text(
              "Andalusie in 7 dagen, 500 km",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/sign_back.png"),
                fit: BoxFit.cover,
                //   image: NetworkImage(
                //       'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png'),
                //   fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(
                    5.0,
                    5.0,
                  ), //Offset
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            // child: Image.asset(
            //   "assets/images/sign_back.png",
            //   fit: BoxFit.cover,
            // ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Steden",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // List of Map routes
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: 350,
                child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 5),
                          child: Column(
                            children: [
                              Card(
                                elevation: 4.0,
                                child: Column(children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.all(8),
                                        // color: Colors.transparent,
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                230, 251, 190, 23),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text("Hello"),
                                            Icon(Icons.arrow_forward_ios),
                                          ],
                                        )),
                                  )
                                ]),
                              ),
                            ],
                          ));
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
