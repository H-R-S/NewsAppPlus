import 'package:flutter/material.dart';
import 'package:news_app_plus/home.dart';
import 'package:news_app_plus/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsAPP+',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

