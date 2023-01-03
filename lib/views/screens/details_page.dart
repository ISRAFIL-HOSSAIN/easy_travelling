import 'package:easy_travel/service/city_Service.dart';
import 'package:easy_travel/widget/AppColors.dart';
import 'package:easy_travel/widget/googlemap.dart';
import 'package:easy_travel/widget/openurl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/City_model.dart';
import '../../model/Route_model.dart';

class DetailScreen extends StatefulWidget {
  final int? cid;

  const DetailScreen({
    Key? key,
    required this.cid,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<CityModel>? fetchcity;
  var step = 0;
  // var isLogin = false.obs;
  @override
  void initState() {
    super.initState();
    var id = widget.cid;
    fetchcity = CityService.fetchCityData(id!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 0,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            const Header_Section(),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              step = 0;
                            });
                          },
                          child: Container(
                            width: 90,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color:
                                  step == 0 ? AppColors.mcolor : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.bcolor),
                            ),
                            child: const Text(
                              "Parkeren",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              step = 1;
                            });
                          },
                          child: Container(
                            width: 110,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color:
                                  step == 1 ? AppColors.mcolor : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.bcolor),
                            ),
                            child: const Text(
                              "Overnachten",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              step = 2;
                            });
                          },
                          child: Container(
                            width: 130,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color:
                                    step == 2 ? AppColors.mcolor : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColors.bcolor)),
                            child: const Text(
                              "Boodschappen",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (step == 0) parkeren(),
                  if (step == 1) overnachten(),
                  if (step == 2) boodsch(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget parkeren() {
    return FutureBuilder<CityModel>(
      future: fetchcity,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) {
                    return SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: snapshot.data?.data2?[0].parking?.length,
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Text(
                                    "${snapshot.data?.data![0].name!}",
                                    style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "${snapshot.data?.data![0].description!}",
                                      // "op weg naar de Caminito Del Rey, kom je door het Ardales National Park.Overweldigende natuur, met moie doorkijkjes, vergezichten en leuke plekken voor een stop",
                                      style: const TextStyle(
                                        fontFamily: 'Poppins_normal',
                                      ),
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: {
                                                snapshot.data!.data2![0]
                                                    .parking![index].image
                                              }.isEmpty ==
                                              true
                                          ? Image.asset(
                                              "assets/images/image.png",
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              "${snapshot.data!.data2![0].parking![index].image}",
                                              fit: BoxFit.cover,
                                            )),
                                  Text(
                                    "${snapshot.data!.data2![0].parking![index].name}",
                                    style: const TextStyle(
                                      fontFamily: 'Poppins_normal',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "${snapshot.data!.data2![0].parking![index].description}",
                                      style: const TextStyle(
                                        fontFamily: 'Poppins_normal',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            step = 0;
                                          });
                                        },
                                        child: InkWell(
                                          onTap: () {
                                            MapUtils.openMap(
                                                double.parse(
                                                    "${snapshot.data!.data2![0].parking![index].latitude}"),
                                                double.parse(
                                                    "${snapshot.data!.data2![0].parking![index].longitude}"));
                                          },
                                          child: Container(
                                            width: 130,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: AppColors.mcolor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: AppColors.mcolor),
                                            ),
                                            child: const Text(
                                              "Navigeer naar",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          OpenUrl.openUrl(
                                              "${snapshot.data!.data2![0].parking![index].website}");
                                        },
                                        child: Container(
                                          width: 130,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: AppColors.mcolor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColors.mcolor),
                                          ),
                                          child: const Text(
                                            "Meer Info",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }),
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
      },
    );
  }

  Widget overnachten() {
    return FutureBuilder<CityModel>(
      future: fetchcity,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) {
                    return SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: snapshot.data?.data2?[1].overview?.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Text(
                                    "${snapshot.data?.data![0].name!}",
                                    style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "${snapshot.data?.data![0].description!}",
                                      // "op weg naar de Caminito Del Rey, kom je door het Ardales National Park.Overweldigende natuur, met moie doorkijkjes, vergezichten en leuke plekken voor een stop",
                                      style: const TextStyle(
                                        fontFamily: 'Poppins_normal',
                                      ),
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: {
                                                snapshot.data!.data2?[1]
                                                    .overview?[0].image
                                              }.isEmpty ==
                                              true
                                          ? Image.asset(
                                              "assets/images/image.png",
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              "${snapshot.data!.data2?[1].overview?[0].image}",
                                              fit: BoxFit.cover,
                                            )),
                                  Text(
                                    "${snapshot.data!.data2?[1].overview?[0].name}",
                                    style: const TextStyle(
                                      fontFamily: 'Poppins_normal',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "${snapshot.data!.data2?[1].overview?[0].description}",
                                      style: const TextStyle(
                                        fontFamily: 'Poppins_normal',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            step = 0;
                                          });
                                        },
                                        child: InkWell(
                                          onTap: () {
                                            MapUtils.openMap(
                                                double.parse(
                                                    "${snapshot.data!.data2?[1].overview?[0].latitude}"),
                                                double.parse(
                                                    "${snapshot.data!.data2?[1].overview?[0].longitude}"));
                                          },
                                          child: Container(
                                            width: 130,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: AppColors.mcolor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: AppColors.mcolor),
                                            ),
                                            child: const Text(
                                              "Navigeer naar",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          OpenUrl.openUrl(
                                              "${snapshot.data!.data2?[1].overview?[0].website}");
                                        },
                                        child: Container(
                                          width: 130,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: AppColors.mcolor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColors.mcolor),
                                          ),
                                          child: const Text(
                                            "Meer Info",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }),
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
      },
    );
  }

  Widget boodsch() {
    return FutureBuilder<CityModel>(
      future: fetchcity,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: snapshot.data?.data2?[2].bood?.length,
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Text(
                                    "${snapshot.data?.data![0].name!}",
                                    style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "${snapshot.data?.data![0].description!}",
                                      // "op weg naar de Caminito Del Rey, kom je door het Ardales National Park.Overweldigende natuur, met moie doorkijkjes, vergezichten en leuke plekken voor een stop",
                                      style: const TextStyle(
                                        fontFamily: 'Poppins_normal',
                                      ),
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: {
                                                snapshot.data!.data2![2]
                                                    .bood![index].image
                                              }.isEmpty ==
                                              true
                                          ? Image.asset(
                                              "assets/images/image.png",
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              "${snapshot.data!.data2![2].bood![index].image}",
                                              fit: BoxFit.cover,
                                            )),
                                  Text(
                                    "${snapshot.data!.data2![2].bood![index].name}",
                                    style: const TextStyle(
                                      fontFamily: 'Poppins_normal',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "${snapshot.data!.data2![2].bood![index].description}",
                                      style: const TextStyle(
                                        fontFamily: 'Poppins_normal',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            step = 0;
                                          });
                                        },
                                        child: InkWell(
                                          onTap: () {
                                            MapUtils.openMap(
                                                double.parse(
                                                    "${snapshot.data!.data2![2].bood![index].latitude}"),
                                                double.parse(
                                                    "${snapshot.data!.data2![2].bood![index].longitude}"));
                                          },
                                          child: Container(
                                            width: 130,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: AppColors.mcolor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: AppColors.mcolor),
                                            ),
                                            child: const Text(
                                              "Navigeer naar",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          OpenUrl.openUrl(
                                              "${snapshot.data!.data2![2].bood![index].website}");
                                        },
                                        child: Container(
                                          width: 130,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: AppColors.mcolor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColors.mcolor),
                                          ),
                                          child: const Text(
                                            "Meer Info",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }),
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
      },
    );
  }

  // Widget overnachten() {
  //   return FutureBuilder<CityModel>(
  //     future: fetchcity,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return SingleChildScrollView(
  //           child: Container(
  //             height: MediaQuery.of(context).size.height * 0.70,
  //             width: MediaQuery.of(context).size.width * 0.98,
  //             child: ListView.builder(
  //               physics: const AlwaysScrollableScrollPhysics(),
  //               shrinkWrap: true,
  //               itemCount: snapshot.data?.data2?.length,
  //               scrollDirection: Axis.vertical,
  //               itemBuilder: (context, index) {
  //                 return Container(
  //                   width: MediaQuery.of(context).size.width,
  //                   child: Column(
  //                     children: [
  //                       Text(
  //                         "${snapshot.data?.data![index].name!}",
  //                         style: const TextStyle(
  //                             fontFamily: "Poppins",
  //                             fontSize: 18,
  //                             fontWeight: FontWeight.w500),
  //                       ),
  //                       Container(
  //                         padding: const EdgeInsets.all(10),
  //                         child: Text(
  //                           "${snapshot.data?.data![index].description!}",
  //                           // "op weg naar de Caminito Del Rey, kom je door het Ardales National Park.Overweldigende natuur, met moie doorkijkjes, vergezichten en leuke plekken voor een stop",
  //                           style: const TextStyle(
  //                             fontFamily: 'Poppins_normal',
  //                           ),
  //                         ),
  //                       ),
  //                       Container(
  //                           padding: const EdgeInsets.all(10),
  //                           height: 200,
  //                           width: MediaQuery.of(context).size.width,
  //                           child: {
  //                                     snapshot.data!.data2![index]
  //                                         .parking![index].image
  //                                   }.isEmpty ==
  //                                   true
  //                               ? Image.asset(
  //                                   "assets/images/image.png",
  //                                   fit: BoxFit.cover,
  //                                 )
  //                               : Image.network(
  //                                   "${snapshot.data!.data2![index].parking![index].image}",
  //                                   fit: BoxFit.cover,
  //                                 )),
  //                       Text(
  //                         "${snapshot.data!.data2![index].parking![index].name}",
  //                         style: const TextStyle(
  //                           fontFamily: 'Poppins_normal',
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 16,
  //                         ),
  //                       ),
  //                       Container(
  //                         padding: const EdgeInsets.all(10),
  //                         child: Text(
  //                           "${snapshot.data!.data2![index].parking![index].description}",
  //                           style: const TextStyle(
  //                             fontFamily: 'Poppins_normal',
  //                           ),
  //                         ),
  //                       ),
  //                       const SizedBox(
  //                         height: 10,
  //                       ),
  //                       Row(
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                         children: [
  //                           InkWell(
  //                             onTap: () {
  //                               setState(() {
  //                                 step = 0;
  //                               });
  //                             },
  //                             child: InkWell(
  //                               onTap: () {
  //                                 MapUtils.openMap(
  //                                     double.parse(
  //                                         "${snapshot.data!.data2![index].parking![index].latitude}"),
  //                                     double.parse(
  //                                         "${snapshot.data!.data2![index].parking![index].longitude}"));
  //                               },
  //                               child: Container(
  //                                 width: 130,
  //                                 padding: const EdgeInsets.all(10),
  //                                 decoration: BoxDecoration(
  //                                   color: AppColors.mcolor,
  //                                   borderRadius: BorderRadius.circular(10),
  //                                   border: Border.all(color: AppColors.mcolor),
  //                                 ),
  //                                 child: const Text(
  //                                   "Navigeer naar",
  //                                   textAlign: TextAlign.center,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           InkWell(
  //                             onTap: () {
  //                               OpenUrl.openUrl(
  //                                   "${snapshot.data!.data2![index].parking![index].website}");
  //                             },
  //                             child: Container(
  //                               width: 130,
  //                               padding: EdgeInsets.all(10),
  //                               decoration: BoxDecoration(
  //                                 color: AppColors.mcolor,
  //                                 borderRadius: BorderRadius.circular(10),
  //                                 border: Border.all(color: AppColors.mcolor),
  //                               ),
  //                               child: const Text(
  //                                 "Meer Info",
  //                                 textAlign: TextAlign.center,
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 60,
  //                       ),
  //                     ],
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         );
  //       } else {
  //         return Column(
  //           children: const [
  //             SizedBox(
  //               height: 50,
  //             ),
  //             Center(
  //                 child: CircularProgressIndicator(
  //               color: AppColors.mcolor,
  //             )),
  //             Text(
  //               "No Data Found !",
  //               style: TextStyle(
  //                   fontFamily: "Poppins",
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w500),
  //             ),
  //           ],
  //         );
  //       }
  //     },
  //   );
  // }

  // // Widget overnachten() {
  // //   return SingleChildScrollView(
  // //     child: Container(
  // //       height: MediaQuery.of(context).size.height * 0.70,
  // //       // width: MediaQuery.of(context).size.width,
  // //       // width: 300,
  // //       child: ListView.builder(
  // //           physics: const AlwaysScrollableScrollPhysics(),
  // //           shrinkWrap: true,
  // //           itemCount: 1,
  // //           scrollDirection: Axis.vertical,
  // //           itemBuilder: (context, index) {
  // //             return SingleChildScrollView(
  // //               child: SizedBox(
  // //                 height: 600,
  // //                 width: MediaQuery.of(context).size.width,
  // //                 child: ListView.builder(
  // //                   physics: const AlwaysScrollableScrollPhysics(),
  // //                   itemCount: 2,
  // //                   shrinkWrap: true,
  // //                   scrollDirection: Axis.horizontal,
  // //                   itemBuilder: (context, index) {
  // //                     return Container(
  // //                       width: MediaQuery.of(context).size.width,
  // //                       child: Column(
  // //                         children: [
  // //                           Text(
  // //                             "${widget.citydata?.name}",
  // //                             style: const TextStyle(
  // //                                 fontFamily: "Poppins",
  // //                                 fontSize: 18,
  // //                                 fontWeight: FontWeight.w500),
  // //                           ),
  // //                           Container(
  // //                             padding: const EdgeInsets.all(10),
  // //                             child: Text(
  // //                               "${widget.citydata?.description}",
  // //                               // "op weg naar de Caminito Del Rey, kom je door het Ardales National Park.Overweldigende natuur, met moie doorkijkjes, vergezichten en leuke plekken voor een stop",
  // //                               style: const TextStyle(
  // //                                 fontFamily: 'Poppins_normal',
  // //                               ),
  // //                             ),
  // //                           ),
  // //                           Container(
  // //                               padding: const EdgeInsets.all(10),
  // //                               height: 200,
  // //                               width: MediaQuery.of(context).size.width,
  // //                               child: {widget.citydata?.image}.isEmpty == true
  // //                                   ? Image.asset(
  // //                                       "assets/images/image.png",
  // //                                       fit: BoxFit.cover,
  // //                                     )
  // //                                   : Image.network(
  // //                                       "${widget.citydata?.image}",
  // //                                       fit: BoxFit.cover,
  // //                                     )),
  // //                           Text(
  // //                             "${widget.citydata?.address}",
  // //                             style: const TextStyle(
  // //                               fontFamily: 'Poppins_normal',
  // //                               fontWeight: FontWeight.w500,
  // //                               fontSize: 16,
  // //                             ),
  // //                           ),
  // //                           Container(
  // //                             padding: const EdgeInsets.all(10),
  // //                             child: const Text(
  // //                               "op weg naar de Caminito Del Rey, kom je door het Ardales National Park.Overweldigende natuur, met moie doorkijkjes, vergezichten en leuke plekken voor een stop",
  // //                               style: TextStyle(
  // //                                 fontFamily: 'Poppins_normal',
  // //                               ),
  // //                             ),
  // //                           ),
  // //                           const SizedBox(
  // //                             height: 10,
  // //                           ),
  // //                           Row(
  // //                             crossAxisAlignment: CrossAxisAlignment.center,
  // //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  // //                             children: [
  // //                               InkWell(
  // //                                 onTap: () {
  // //                                   setState(() {
  // //                                     step = 0;
  // //                                   });
  // //                                 },
  // //                                 child: InkWell(
  // //                                   onTap: () {
  // //                                     MapUtils.openMap(
  // //                                         double.parse(
  // //                                             "${widget.citydata?.latitude}"),
  // //                                         double.parse(
  // //                                             "${widget.citydata?.longitude}"));
  // //                                   },
  // //                                   child: Container(
  // //                                     width: 130,
  // //                                     padding: const EdgeInsets.all(10),
  // //                                     decoration: BoxDecoration(
  // //                                       color: AppColors.mcolor,
  // //                                       borderRadius: BorderRadius.circular(10),
  // //                                       border:
  // //                                           Border.all(color: AppColors.mcolor),
  // //                                     ),
  // //                                     child: const Text(
  // //                                       "Navigeer naar",
  // //                                       textAlign: TextAlign.center,
  // //                                     ),
  // //                                   ),
  // //                                 ),
  // //                               ),
  // //                               InkWell(
  // //                                 onTap: () {
  // //                                   OpenUrl.openUrl();
  // //                                 },
  // //                                 child: Container(
  // //                                   width: 130,
  // //                                   padding: EdgeInsets.all(10),
  // //                                   decoration: BoxDecoration(
  // //                                     color: AppColors.mcolor,
  // //                                     borderRadius: BorderRadius.circular(10),
  // //                                     border:
  // //                                         Border.all(color: AppColors.mcolor),
  // //                                   ),
  // //                                   child: const Text(
  // //                                     "Meer Info",
  // //                                     textAlign: TextAlign.center,
  // //                                   ),
  // //                                 ),
  // //                               ),
  // //                             ],
  // //                           ),
  // //                           const SizedBox(
  // //                             height: 60,
  // //                           ),
  // //                         ],
  // //                       ),
  // //                     );
  // //                   },
  // //                 ),
  // //               ),
  // //             );
  // //           }),
  // //     ),
  // //   );
  // // }

  // Widget boodsch() {
  //   return FutureBuilder<CityModel>(
  //       future: fetchcity,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           return SingleChildScrollView(
  //             child: Container(
  //               height: MediaQuery.of(context).size.height * 0.70,
  //               // width: MediaQuery.of(context).size.width,
  //               // width: 300,
  //               child: ListView.builder(
  //                   physics: const AlwaysScrollableScrollPhysics(),
  //                   shrinkWrap: true,
  //                   itemCount: 1,
  //                   scrollDirection: Axis.vertical,
  //                   itemBuilder: (context, index) {
  //                     return SingleChildScrollView(
  //                       child: SizedBox(
  //                         height: MediaQuery.of(context).size.height,
  //                         width: MediaQuery.of(context).size.width,
  //                         child: ListView.builder(
  //                           physics: const AlwaysScrollableScrollPhysics(),
  //                           itemCount: snapshot.data?.data2?[2].bood?.length,
  //                           shrinkWrap: true,
  //                           scrollDirection: Axis.horizontal,
  //                           itemBuilder: (context, index) {
  //                             return Container(
  //                               height:
  //                                   MediaQuery.of(context).size.height * 0.65,
  //                               width: MediaQuery.of(context).size.width,
  //                               child: Column(
  //                                 children: [
  //                                   Text(
  //                                     "${snapshot.data?.data![0].name!}",
  //                                     style: const TextStyle(
  //                                         fontFamily: "Poppins",
  //                                         fontSize: 18,
  //                                         fontWeight: FontWeight.w500),
  //                                   ),
  //                                   Container(
  //                                     height:
  //                                         MediaQuery.of(context).size.height *
  //                                             0.70,
  //                                     padding: const EdgeInsets.all(10),
  //                                     child: Text(
  //                                       "${snapshot.data?.data![0].description!}",
  //                                       // "op weg naar de Caminito Del Rey, kom je door het Ardales National Park.Overweldigende natuur, met moie doorkijkjes, vergezichten en leuke plekken voor een stop",
  //                                       style: const TextStyle(
  //                                         fontFamily: 'Poppins_normal',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                   Container(
  //                                       padding: const EdgeInsets.all(10),
  //                                       height: 200,
  //                                       width:
  //                                           MediaQuery.of(context).size.width,
  //                                       child: {
  //                                                 snapshot.data!.data2![2]
  //                                                     .bood![index].image
  //                                               }.isEmpty ==
  //                                               true
  //                                           ? Image.asset(
  //                                               "assets/images/image.png",
  //                                               fit: BoxFit.cover,
  //                                             )
  //                                           : Image.network(
  //                                               "${snapshot.data!.data2![2].bood![index].image}",
  //                                               fit: BoxFit.cover,
  //                                             )),
  //                                   Text(
  //                                     "${snapshot.data!.data2![2].bood![index].name}",
  //                                     style: const TextStyle(
  //                                       fontFamily: 'Poppins_normal',
  //                                       fontWeight: FontWeight.w500,
  //                                       fontSize: 16,
  //                                     ),
  //                                   ),
  //                                   Container(
  //                                     padding: const EdgeInsets.all(10),
  //                                     child: Text(
  //                                       "${snapshot.data!.data2![2].bood![index].description}",
  //                                       style: const TextStyle(
  //                                         fontFamily: 'Poppins_normal',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                   const SizedBox(
  //                                     height: 10,
  //                                   ),
  //                                   Row(
  //                                     crossAxisAlignment:
  //                                         CrossAxisAlignment.center,
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.spaceEvenly,
  //                                     children: [
  //                                       InkWell(
  //                                         onTap: () {
  //                                           setState(() {
  //                                             step = 0;
  //                                           });
  //                                         },
  //                                         child: InkWell(
  //                                           onTap: () {
  //                                             MapUtils.openMap(
  //                                                 double.parse(
  //                                                   "${snapshot.data!.data2![2].bood![index].latitude}",
  //                                                 ),
  //                                                 double.parse(
  //                                                   "${snapshot.data!.data2![2].bood![index].longitude}",
  //                                                 ));
  //                                           },
  //                                           child: Container(
  //                                             width: 130,
  //                                             padding: const EdgeInsets.all(10),
  //                                             decoration: BoxDecoration(
  //                                               color: AppColors.mcolor,
  //                                               borderRadius:
  //                                                   BorderRadius.circular(10),
  //                                               border: Border.all(
  //                                                   color: AppColors.mcolor),
  //                                             ),
  //                                             child: const Text(
  //                                               "Navigeer naar",
  //                                               textAlign: TextAlign.center,
  //                                             ),
  //                                           ),
  //                                         ),
  //                                       ),
  //                                       InkWell(
  //                                         onTap: () {
  //                                           OpenUrl.openUrl(
  //                                               "${snapshot.data!.data2![2].bood![index].website}");
  //                                         },
  //                                         child: Container(
  //                                           width: 130,
  //                                           padding: EdgeInsets.all(10),
  //                                           decoration: BoxDecoration(
  //                                             color: AppColors.mcolor,
  //                                             borderRadius:
  //                                                 BorderRadius.circular(10),
  //                                             border: Border.all(
  //                                                 color: AppColors.mcolor),
  //                                           ),
  //                                           child: const Text(
  //                                             "Meer Info",
  //                                             textAlign: TextAlign.center,
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                   const SizedBox(
  //                                     height: 60,
  //                                   ),
  //                                 ],
  //                               ),
  //                             );
  //                           },
  //                         ),
  //                       ),
  //                     );
  //                   }),
  //             ),
  //           );
  //         } else {
  //           return Column(
  //             children: const [
  //               SizedBox(
  //                 height: 50,
  //               ),
  //               Center(
  //                   child: CircularProgressIndicator(
  //                 color: AppColors.mcolor,
  //               )),
  //               Text(
  //                 "No Data Found !",
  //                 style: TextStyle(
  //                     fontFamily: "Poppins",
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w500),
  //               ),
  //             ],
  //           );
  //         }
  //       });
  // }

}

class Header_Section extends StatelessWidget {
  const Header_Section({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Center(
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.only(left: 15, bottom: 21),
                height: 40,
                width: 32,
                child: Image.asset(
                  "assets/images/backarrow.png",
                  width: 60,
                  height: 50,
                  fit: BoxFit.fill,
                ),
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
                      "Easy Traveling",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
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
    );
  }
}
