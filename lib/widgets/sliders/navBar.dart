import 'package:flutter/material.dart';

class NavBarSlider extends StatelessWidget {
  List itemCount;
  Function() onTap;
  List<String> navBarItem;

  NavBarSlider({required this.navBarItem, required this.itemCount, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          height: 40,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: itemCount.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        navBarItem[index],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
