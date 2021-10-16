import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_plus/NewsView.dart';
import 'package:news_app_plus/api/newsApi.dart';
import 'package:news_app_plus/category.dart';
import 'package:news_app_plus/models/newsQuery.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = new TextEditingController();
  List<NewsQueryModel> newsModelList = <NewsQueryModel>[];
  List<NewsQueryModel> newsModelListCarousel = <NewsQueryModel>[];
  List<String> navBarItem = [
    "Top News",
    "Covid-19",
    "World",
    "Football",
    "Health"
  ];

  final userId = FirebaseAuth.instance.currentUser!.uid.toString();

  String placeHolderImage =
      "http://mapandan.gov.ph/wp-content/uploads/2018/03/no_image.jpg";

  bool isLoading = true;

  getNewsByQuery(String query) async {
    Map element;
    int i = 0;
    String url =
        "https://newsapi.org/v2/everything?q=$query&from=2021-10-16&to=2021-10-16&sortBy=popularity&apiKey=3bba92f4994941f2a1c4c802fb70c0c2";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      for (element in data["articles"]) {
        try {
          i++;

          NewsQueryModel newsQueryModel = new NewsQueryModel();
          newsQueryModel = NewsQueryModel.fromMap(element);
          newsModelList.add(newsQueryModel);
          setState(() {
            isLoading = false;
          });

          if (i == 8) {
            break;
          }
        } catch (e) {
          print(e);
        }
      }
    });
  }

  getNewsofUS() async {
    String url = NewsApi.topHeadLinesNewsApiUrl;
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element) {
        NewsQueryModel newsQueryModel = new NewsQueryModel();
        newsQueryModel = NewsQueryModel.fromMap(element);
        newsModelListCarousel.add(newsQueryModel);
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
    getNewsByQuery("corona");
    getNewsofUS();
  }

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
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                      height: 80,
                      child: Image.asset("assets/logos/newsAppLogo.png")),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Hot Topics",
                    style: TextStyle(
                        fontFamily: "",
                        fontSize: 29,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: navBarItem.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Category(Query: navBarItem[index])));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                child: Text(navBarItem[index],
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          );
                        })),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: isLoading
                      ? Container(
                          height: 200,
                          child: Center(child: CircularProgressIndicator()))
                      : CarouselSlider(
                          options: CarouselOptions(
                              height: 200,
                              autoPlay: true,
                              enlargeCenterPage: true),
                          items: newsModelListCarousel.map((instance) {
                            return Builder(builder: (BuildContext context) {
                              try {
                                return Container(
                                    child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NewsView(instance.newsUrl)));
                                  },
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Stack(children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              instance.newsImg == null
                                                  ? placeHolderImage
                                                  : instance.newsImg,
                                              fit: BoxFit.contain,
                                              width: double.infinity,
                                            )),
                                        Positioned(
                                            left: 0,
                                            right: 0,
                                            bottom: 0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Colors.black12
                                                            .withOpacity(0),
                                                        Colors.black
                                                      ],
                                                      begin: Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter)),
                                              child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 10),
                                                  child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      child: Text(
                                                        instance.newsHead == null
                                                            ? ""
                                                            : instance.newsHead,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ))),
                                            )),
                                      ])),
                                ));
                              } catch (e) {
                                print(e);
                                return Container();
                              }
                            });
                          }).toList(),
                        ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 25, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "LATEST NEWS ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 28),
                            ),
                          ],
                        ),
                      ),
                      isLoading
                          ? Container(
                              height: MediaQuery.of(context).size.height - 450,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: newsModelList.length,
                              itemBuilder: (context, index) {
                                try {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => NewsView(
                                                    newsModelList[index]
                                                        .newsUrl)));
                                      },
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          elevation: 1.0,
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Image.network(
                                                    newsModelList[index]
                                                                .newsImg ==
                                                            null
                                                        ? placeHolderImage
                                                        : newsModelList[index]
                                                            .newsImg,
                                                    fit: BoxFit.fitHeight,
                                                    height: 230,
                                                    width: double.infinity,
                                                  )),
                                              Positioned(
                                                  left: 0,
                                                  right: 0,
                                                  bottom: 0,
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          gradient: LinearGradient(
                                                              colors: [
                                                                Colors.black12
                                                                    .withOpacity(
                                                                        0),
                                                                Colors.black
                                                              ],
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter)),
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              15, 15, 10, 8),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            newsModelList[index]
                                                                .newsHead,
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
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
                                                                color:
                                                                    Colors.white,
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
                                                                  child: newsModelList[index]
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
                                                                          setState(
                                                                              () {
                                                                            newsModelList[index].newsFav =
                                                                                true;
                                                                          });
                                                                          await http.post(
                                                                              Uri.parse(customApiUrl),
                                                                              body: {
                                                                                "userUid": "$userId",
                                                                                "newsHead": "${newsModelList[index].newsHead}",
                                                                                "newsDes": "${newsModelList[index].newsDes}",
                                                                                "newsImg": "${newsModelList[index].newsImg}",
                                                                                "newsUrl": "${newsModelList[index].newsUrl}",
                                                                                "newsFav": "${newsModelList[index].newsFav}"
                                                                              });
                                                                          // print(body);
                                                                        }),
                                                            ],
                                                          )
                                                        ],
                                                      )))
                                            ],
                                          )),
                                    ),
                                  );
                                } catch (e) {
                                  print(e);
                                  return Container();
                                }
                              }),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Category(Query: "Hot News")));
                                },
                                child: Text("SHOW MORE")),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
