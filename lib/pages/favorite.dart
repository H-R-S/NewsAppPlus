import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 40),
            Center(
              child: Container(
                  height: 80,
                  child: Image.asset("assets/logos/newsAppLogo.png")),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
