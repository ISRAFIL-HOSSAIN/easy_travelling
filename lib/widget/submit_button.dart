import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback handleButtonClick;
  // final Function handleButtonClick;
  final String title;
  const SubmitButton(
      {Key? key, required this.handleButtonClick, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 50,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: Colors.white.withOpacity(0.25),
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 1)
      ]),
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide.none)),
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 241, 241, 241),
              )),
          onPressed: handleButtonClick,
          child: Text(title,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 19, 13, 51),
                fontWeight: FontWeight.w600,
              ))),
    );
  }
}
