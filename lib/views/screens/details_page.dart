import 'package:easy_travel/widget/AppColors.dart';
import 'package:easy_travel/widget/googlemap.dart';
import 'package:easy_travel/widget/openurl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/Route_model.dart';
import '../../service/api_service.dart';

class DetailScreen extends StatefulWidget {
  final RouteAllData? citydata;

  const DetailScreen({
    Key? key,
    required this.citydata,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var step = 0;
  // var isLogin = false.obs;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Traveling'),
        backgroundColor: const Color.fromARGB(230, 251, 190, 23),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Header_Section(),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
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
                          color: step == 0 ? AppColors.mcolor : Colors.white,
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
                          color: step == 1 ? AppColors.mcolor : Colors.white,
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
                            color: step == 2 ? AppColors.mcolor : Colors.white,
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
                const SizedBox(
                  height: 20,
                ),
                if (step == 0) Parkeren(),
                if (step == 1) Overnachten(),
                if (step == 2) Boodsch(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Parkeren() {
    return SingleChildScrollView(
      child: Container(
        height: 550,
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Text(
                      "${widget.citydata?.name}",
                      style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "${widget.citydata?.description}",
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
                        child: {widget.citydata?.image}.isEmpty == true
                            ? Image.asset(
                                "assets/images/image.png",
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                "${widget.citydata?.image}",
                                fit: BoxFit.cover,
                              )),
                    Text(
                      "${widget.citydata?.address}",
                      style: const TextStyle(
                        fontFamily: 'Poppins_normal',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "op weg naar de Caminito Del Rey, kom je door het Ardales National Park.Overweldigende natuur, met moie doorkijkjes, vergezichten en leuke plekken voor een stop",
                        style: TextStyle(
                          fontFamily: 'Poppins_normal',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  double.parse("${widget.citydata?.latitude}"),
                                  double.parse(
                                      "${widget.citydata?.longitude}"));
                            },
                            child: Container(
                              width: 130,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.mcolor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.mcolor),
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
                            OpenUrl.openUrl();
                          },
                          child: Container(
                            width: 130,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.mcolor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.mcolor),
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
            }),
      ),
    );
  }

  Widget Overnachten() {
    return SingleChildScrollView(
      child: Container(
        height: 550,
        child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Text(
                      "${widget.citydata?.name}",
                      style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "${widget.citydata?.description}",
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
                        child: {widget.citydata?.image} != null
                            ? Image.network(
                                "${widget.citydata?.image}",
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                "assets/images/image.png",
                                fit: BoxFit.cover,
                              )),
                    Text(
                      "${widget.citydata?.address}",
                      style: const TextStyle(
                        fontFamily: 'Poppins_normal',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "op weg naar de Caminito Del Rey, kom je door het Ardales National Park.Overweldigende natuur, met moie doorkijkjes, vergezichten en leuke plekken voor een stop",
                        style: TextStyle(
                          fontFamily: 'Poppins_normal',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            MapUtils.openMap(
                                double.parse("${widget.citydata?.latitude}"),
                                double.parse("${widget.citydata?.longitude}"));
                          },
                          child: Container(
                            width: 130,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.mcolor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.mcolor),
                            ),
                            child: const Text(
                              "Navigeer naar",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            OpenUrl.openUrl();
                          },
                          child: Container(
                            width: 130,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.mcolor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.mcolor),
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
            }),
      ),
    );
  }

  Widget Boodsch() {
    return SingleChildScrollView(
      child: Container(
        height: 550,
        child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Text(
                      "${widget.citydata?.name}",
                      style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "${widget.citydata?.description}",
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
                        child: {widget.citydata?.image} != null
                            ? Image.network(
                                "${widget.citydata?.image}",
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                "assets/images/image.png",
                                fit: BoxFit.cover,
                              )),
                    Text(
                      "${widget.citydata?.address}",
                      style: const TextStyle(
                        fontFamily: 'Poppins_normal',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "op weg naar de Caminito Del Rey, kom je door het Ardales National Park.Overweldigende natuur, met moie doorkijkjes, vergezichten en leuke plekken voor een stop",
                        style: TextStyle(
                          fontFamily: 'Poppins_normal',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            MapUtils.openMap(
                                double.parse("${widget.citydata?.latitude}"),
                                double.parse("${widget.citydata?.longitude}"));
                          },
                          child: Container(
                            width: 130,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.mcolor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.mcolor),
                            ),
                            child: const Text(
                              "Navigeer naar",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            OpenUrl.openUrl();
                          },
                          child: Container(
                            width: 130,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.mcolor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.mcolor),
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
            }),
      ),
    );
  }
}

class Header_Section extends StatelessWidget {
  const Header_Section({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
