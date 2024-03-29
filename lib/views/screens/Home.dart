import 'package:easy_travel/model/Route_model.dart';
import 'package:easy_travel/views/screens/login.dart';
import 'package:easy_travel/views/screens/routes_single.dart';
import 'package:easy_travel/widget/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/api_service.dart';
import '../../widget/showPopup.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<RouteModel> fetchdata;
  // final RouteMapController routecontroller = Get.put(RouteMapController());

  @override
  void initState() {
    super.initState();
    fetchdata = ApiService.fetchRouteData();
    print("Fetch Data is : ");
    print(fetchdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 248, 250),
      appBar: AppBar(
        // title: const Text('Easy Traveling'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
      ),
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
                    InkWell(
                      onTap: () {
                        Get.to(const LoginScreen());
                      },
                      child: Container(
                        child: Image.asset(
                          "assets/images/accountlogo.png",
                          height: 40,
                          width: 40,
                        ),
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
            padding: const EdgeInsets.only(right: 250),
            child: const Text(
              "Routes",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          FutureBuilder<RouteModel>(
              future: fetchdata,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data?.data!.length,
                            itemBuilder: (_, index) {
                              return Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    children: [
                                      Column(children: [
                                        GestureDetector(
                                          onTap: () {
                                            showDialogFunc(context,
                                                "${snapshot.data?.data![index].image}");
                                          },
                                          child: Container(
                                            height: 250.0,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            child: (snapshot.data?.data![index]
                                                        .image) !=
                                                    null
                                                ? Image.network(
                                                    // routecontroller.routeList,
                                                    "${snapshot.data?.data![index].image}",
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.asset(
                                                    "assets/images/image.png",
                                                    fit: BoxFit.cover),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SingleScreen(
                                                        routemodel: snapshot
                                                            .data
                                                            ?.data![index]),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(12.0),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10)),
                                              color: AppColors.mcolor,
                                            ),
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${snapshot.data?.data![index].name}",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Icon(Icons.arrow_forward_ios)
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                      ]),
                                    ],
                                  ));
                            }),
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: const [
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                          child: CircularProgressIndicator(
                        color: AppColors.mcolor,
                      )),
                      Text(
                        "No Data Found !",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  );
                }
              }),

          // }
          // }),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
