import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  TextEditingController controller;
  final String hintText;
  final String error;
  bool passwordvisible;
  final Function onUseridValueChange;

  PasswordField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.error,
    required this.onUseridValueChange,
    required this.passwordvisible,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: TextFormField(
        style: const TextStyle(
            decoration: TextDecoration.none,
            color: Color.fromARGB(255, 235, 235, 235),
            fontFamily: "Poppins_normal",
            fontSize: 14,
            fontWeight: FontWeight.w500),
        controller: widget.controller,
        obscureText: widget.passwordvisible,
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value!.isEmpty) {
            return widget.error;
          } else {
            return null;
          }
        },
        onChanged: (value) {
          widget.onUseridValueChange(value);
        },
        decoration: InputDecoration(
            alignLabelWithHint: true,
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white54,
            )),
            focusedBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
            fillColor: Colors.white54,
            hintText: widget.hintText,
            suffixIcon: IconButton(
              icon: Icon(
                widget.passwordvisible
                    ? Icons.visibility_off
                    :  Icons.visibility,
                color: Colors.white54,
              ),
              onPressed: () {
                setState(
                  () {
                    widget.passwordvisible = !widget.passwordvisible;
                  },
                );
              },
            ),
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 215, 214, 214)),
            contentPadding: const EdgeInsets.only(bottom: 15),
            focusColor: Colors.white54),
        autofocus: true,
        keyboardType: TextInputType.multiline,
      ),
    );
  }
}
