import 'package:flutter/material.dart';

class TextFieldTag extends StatelessWidget {
  String text;

  TextFieldTag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Color(0xff0bc698),
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}