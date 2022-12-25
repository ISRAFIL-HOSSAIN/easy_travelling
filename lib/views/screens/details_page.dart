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
                    // MaterialButton(
                    //   color: !isLogin.value ? Colors.white : Colors.amber,
                    //   onPressed: () {
                    //     isLogin.value = false;
                    //   },
                    //   child: Text('Register'),
                    // ),
                    // MaterialButton(
                    //   color: isLogin.value ? Colors.white : Colors.amber,
                    //   onPressed: () {
                    //     isLogin.value = true;
                    //   },
                    //   child: Text('Login'),
                    // ),
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
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.orange),
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
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.orange),
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
                            color: Color.fromARGB(255, 252, 252, 252),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.orange)),
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
                // (step==1)? Parkeren() : (step==2)?Overnachten() : (step == 3)? Boodsch()
                // :
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Parkeren() {
    return Column(
      children: [Text("Hello Parkeren")],
    );
  }

  Widget Overnachten() {
    return Column(
      children: [Text("Hello Overnachten")],
    );
  }

  Widget Boodsch() {
    return Column(
      children: [Text("Hello Boodsh")],
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
    );
  }
}
