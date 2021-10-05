import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  IconData icon;
  String hintText;
  Function() onTap;
  TextEditingController searchController;

  SearchBar(
      {required this.hintText,
      required this.icon,
      required this.onTap,
      required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                child: Icon(icon),
              ),
            ),
            Expanded(
                child: TextField(
              controller: searchController,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ))
          ],
        ));
  }
}
