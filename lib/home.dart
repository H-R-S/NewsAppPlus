import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_app_plus/pages/home.dart';
import 'package:news_app_plus/pages/profile.dart';
import 'package:news_app_plus/pages/search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  List listOfPages = [
    HomePage(),
    SearchPage(),
    SearchPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfPages[currentIndex],
      bottomNavigationBar: BottomNavyBar(
          selectedIndex: currentIndex,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Text("Home"),
                icon: Icon(Icons.home),
                activeColor: Colors.black87,
                inactiveColor: Colors.black38),
            BottomNavyBarItem(
                title: Text("Favourite"),
                icon: Icon(Icons.favorite_border),
                activeColor: Colors.black87,
                inactiveColor: Colors.black38),
            BottomNavyBarItem(
                title: Text("Search"),
                icon: Icon(Icons.search),
                activeColor: Colors.black87,
                inactiveColor: Colors.black38),
            BottomNavyBarItem(
                title: Text("Profile"),
                icon: Icon(Icons.account_circle_outlined),
                activeColor: Colors.black87,
                inactiveColor: Colors.black38),
          ],
          onItemSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}
