import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  final String hintText;
  final String error;
  final Function onUseridValueChange;
  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.error,
    required this.onUseridValueChange,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: TextFormField(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        controller: controller,
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value!.isEmpty) {
            return error;
          } else {
            return null;
          }
        },
        onChanged: (value) {
          onUseridValueChange(value);
        },
        decoration: InputDecoration(
            alignLabelWithHint: true,
            focusedBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
            fillColor: Colors.white54,
            hintText: hintText,
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 215, 214, 214)),
            contentPadding: const EdgeInsets.only(bottom: 15),
            focusColor: Colors.white60),
        autofocus: true,
        keyboardType: TextInputType.multiline,
      ),
    );
  }
}
