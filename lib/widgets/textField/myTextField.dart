import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  bool isPassword;
  TextInputType inputType;
  FormFieldValidator validator;

  MyTextField({
    required this.hint,
    required this.controller,
    required this.inputType,
    required this.isPassword,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          focusColor: Colors.pinkAccent,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pinkAccent),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
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