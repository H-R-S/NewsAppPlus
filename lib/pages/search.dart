import 'package:flutter/material.dart';
import 'package:news_app_plus/category.dart';
import 'package:news_app_plus/widgets/searchBar.dart';

class SearchPage extends StatelessWidget {
  TextEditingController searchController = new TextEditingController();
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
      body: Column(
        children: [
          SizedBox(height: 40),
          Center(
                child: Container(
                    height: 80,
                    child: Image.asset("assets/logos/newsAppLogo.png")),
              ),
          SizedBox(height: 40),
          Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if ((searchController.text).replaceAll(" ", "") == "") {
                              print("Blank search");
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Category(Query: searchController.text)));
                            }
                          },
                          child: Container(
                            child: Icon(
                              Icons.search,
                              color: Colors.blueAccent,
                            ),
                            margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value) {
                              if (value == "") {
                                print("BLANK SEARCH");
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Category(Query: value)));
                              }
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search Latest News"),
                          ),
                        )
                      ],
                    ),
                  ),
        ],
      ),
    );
  }
}
