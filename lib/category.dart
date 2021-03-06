import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app_plus/api/newsApi.dart';
import 'package:news_app_plus/models/newsQuery.dart';

class Category extends StatefulWidget {
  String Query;
  Category({required this.Query});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  final userId = FirebaseAuth.instance.currentUser!.uid.toString();
  
  List<NewsQueryModel> newsModelList = <NewsQueryModel>[];
  bool isLoading = true;
  bool isFavorite = false;
  String placeHolderImage =
      "http://mapandan.gov.ph/wp-content/uploads/2018/03/no_image.jpg";

  getNewsByQuery(String query) async {
    String url = "";
    if (query == "Top News" || query == "us") {
      url = NewsApi.topHeadLinesNewsApiUrl;
    } else {
      url =
          "https://newsapi.org/v2/everything?q=$query&from=2021-10-03&to=2021-10-03&sortBy=popularity&apiKey=3bba92f4994941f2a1c4c802fb70c0c2";
    }

    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element) {
        NewsQueryModel newsQueryModel = new NewsQueryModel();
        newsQueryModel = NewsQueryModel.fromMap(element);
        newsModelList.add(newsQueryModel);
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  final String customApiUrl = NewsApi.customApiUrl;

  @override
  void initState() {
    super.initState();
    getNewsByQuery(widget.Query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Center(
                  child: Container(
                      height: 80,
                      child: Image.asset("assets/logos/newsAppLogo.png")),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 25, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          widget.Query,
                          style: TextStyle(
                              fontSize: 39,
                              fontWeight: FontWeight.bold,
                              fontFamily: ""),
                        ),
                      ),
                    ],
                  ),
                ),
                isLoading
                    ? Container(
                        height: MediaQuery.of(context).size.height - 500,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: newsModelList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 1.0,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          // ignore: unnecessary_null_comparison
                                          newsModelList[index].newsImg == null
                                              ? placeHolderImage
                                              : newsModelList[index].newsImg,
                                          fit: BoxFit.contain,
                                        )),
                                    Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Colors.black12
                                                          .withOpacity(0),
                                                      Colors.black
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter)),
                                            padding: EdgeInsets.fromLTRB(
                                                15, 15, 10, 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  newsModelList[index].newsHead ==
                                                          null
                                                      ? ""
                                                      : newsModelList[index]
                                                          .newsHead,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  newsModelList[index]
                                                              .newsDes
                                                              .length >
                                                          50
                                                      ? "${newsModelList[index].newsDes.substring(0, 55)}...."
                                                      : newsModelList[index]
                                                                  .newsDes ==
                                                              null
                                                          ? ""
                                                          : newsModelList[index]
                                                                      .newsDes
                                                                      .length >
                                                                  50
                                                              ? "${newsModelList[index].newsDes.substring(0, 55)}...."
                                                              : newsModelList[
                                                                      index]
                                                                  .newsDes,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              InkWell(
                                                                child: newsModelList[
                                                                                index]
                                                                            .newsFav ==
                                                                        true
                                                                    ? Icon(
                                                                        Icons
                                                                            .favorite,
                                                                        color: Colors
                                                                            .redAccent)
                                                                    : Icon(
                                                                        Icons
                                                                            .favorite_border,
                                                                        color: Colors
                                                                            .redAccent),
                                                                onTap: () async {
                                                                  setState(() {
                                                                    newsModelList[
                                                                            index]
                                                                        .newsFav = true;
                                                                  });
                                                                  await http.post(
                                                                      Uri.parse(
                                                                          customApiUrl),
                                                                      body: {
                                                                        "userUid":
                                                                            "$userId",
                                                                        "newsHead":
                                                                            "${newsModelList[index]
                                                                                .newsHead}",
                                                                        "newsDes":
                                                                            "${newsModelList[index]
                                                                                .newsDes}",
                                                                        "newsImg":
                                                                            "${newsModelList[index]
                                                                                .newsImg}",
                                                                        "newsUrl":
                                                                            "${newsModelList[index]
                                                                                .newsUrl}",
                                                                        "newsFav":
                                                                            "${newsModelList[index]
                                                                                .newsFav}"
                                                                      });
                                                                  // print(body);
                                                                },
                      
                                                              ),
                                                            ],
                                                          )
                                              ],
                                            )))
                                  ],
                                )),
                          );
                        }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
