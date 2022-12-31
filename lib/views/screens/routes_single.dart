import 'package:easy_travel/views/screens/Home.dart';
import 'package:easy_travel/views/screens/details_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/Route_model.dart';
import '../../widget/showPopup.dart';

class SingleScreen extends StatelessWidget {
  final RouteAllData? routemodel;

  const SingleScreen({Key? key, required this.routemodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 248, 250),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(const HomeScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 15, bottom: 21),
                      height: 40,
                      width: 28,
                      child: Image.asset(
                        "assets/images/backarrow.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            "Easy Travelling",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
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
            padding: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 241, 248, 250),
            child: Text(
              "${routemodel?.name}",
              style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          InkWell(
            onTap: () {
              showDialogFunc(context, "${routemodel?.image}");
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  // image: AssetImage("assets/images/sign_back.png"),
                  // fit: BoxFit.cover,

                  image: NetworkImage(
                    "${routemodel?.image}",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 95, 95, 95),
                    offset: Offset(
                      1.0,
                      1.0,
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
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Steden",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: 350,
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: routemodel!.city!.length,
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
                                          builder: (context) => DetailScreen(
                                              citydata:
                                                  routemodel?.city![index]),
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
                                          children: [
                                            Text(
                                              "${routemodel?.city![index].name}",
                                            ),
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
