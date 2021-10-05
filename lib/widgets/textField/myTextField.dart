import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  bool isPassword;
  TextInputType inputType;

  MyTextField({
    required this.hint,
    required this.controller,
    required this.inputType,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          focusColor: Color(0xff0eb6a3),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff0bc698)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintStyle: TextStyle(color: Colors.grey[600]),
          hintText: hint,
          fillColor: Colors.transparent,
        ),
        obscureText: isPassword,
        keyboardType: inputType,
      ),
    );
  }
}