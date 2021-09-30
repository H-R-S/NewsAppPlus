import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      leading: InkWell(
        onTap: () {},
        child: Icon(
          Icons.dashboard_customize_outlined,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: InkWell(
            onTap: () {},
          child: Icon(
            Icons.account_circle_rounded,
            color: Colors.black,
          ),
      ),
        ),
      ],
      title: Text("NewsAPP+",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
    ));
  }
}
