import 'package:easy_travel/views/screens/login.dart';
import 'package:easy_travel/widget/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var step = 0;
  // var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Traveling'),
        backgroundColor: const Color.fromARGB(230, 251, 190, 23),
      ),
      body: Column(
        children: [
          Header_Section(),
          Padding(
            padding: EdgeInsets.all(5),
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
                        padding: EdgeInsets.all(10),
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
                        padding: EdgeInsets.all(10),
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
                        padding: EdgeInsets.all(10),
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
    return Column(
      children: [
        const Text(
          "Ardales",
          style: TextStyle(
              fontFamily: "Poppins", fontSize: 18, fontWeight: FontWeight.w500),
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
        Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/sign_back.png",
            fit: BoxFit.cover,
          ),
        ),
        const Text(
          "Bezoekers centrum Caminito del Rey",
          style: TextStyle(
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
                setState(() {
                  step = 0;
                });
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
        )
      ],
    );
  }

  Widget Overnachten() {
    return Column(
      children: [
        const Text(
          "Ardales",
          style: TextStyle(
              fontFamily: "Poppins", fontSize: 18, fontWeight: FontWeight.w500),
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
        Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/sign_back.png",
            fit: BoxFit.cover,
          ),
        ),
        const Text(
          "Bezoekers centrum Caminito del Rey",
          style: TextStyle(
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
                setState(() {
                  step = 0;
                });
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
        )
      ],
    );
  }

  Widget Boodsch() {
    return Column(
      children: [
        const Text(
          "Ardales",
          style: TextStyle(
              fontFamily: "Poppins", fontSize: 18, fontWeight: FontWeight.w500),
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
        Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/sign_back.png",
            fit: BoxFit.cover,
          ),
        ),
        const Text(
          "Bezoekers centrum Caminito del Rey",
          style: TextStyle(
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
                setState(() {
                  step = 0;
                });
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
        )
      ],
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
