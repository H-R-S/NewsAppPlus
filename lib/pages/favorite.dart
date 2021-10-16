import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app_plus/api/newsApi.dart';
import 'package:news_app_plus/models/favoriteNewsQuery.dart';

class FavoriteNewsPage extends StatefulWidget {
  @override
  _FavoriteNewsPageState createState() => _FavoriteNewsPageState();
}

class _FavoriteNewsPageState extends State<FavoriteNewsPage> {
  List<FavoriteNewsQueryModel> favoriteNewsModelList =
      <FavoriteNewsQueryModel>[];

  bool isLoading = true;

  String placeHolderImage =
      "http://mapandan.gov.ph/wp-content/uploads/2018/03/no_image.jpg";

  final String url = NewsApi.customApiUrl;

  getFavoriteNews() async {
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["data"].forEach((element) {
        FavoriteNewsQueryModel favoriteNewsQueryModel =
            new FavoriteNewsQueryModel();
        favoriteNewsQueryModel = FavoriteNewsQueryModel.fromMap(element);
        favoriteNewsModelList.add(favoriteNewsQueryModel);
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
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
                          "",
                          // widget.Query,
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
                        itemCount: favoriteNewsModelList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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
                                          favoriteNewsModelList[index]
                                                      .newsImg ==
                                                  null
                                              ? placeHolderImage
                                              : favoriteNewsModelList[index]
                                                  .newsImg,
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
                                                    end: Alignment
                                                        .bottomCenter)),
                                            padding: EdgeInsets.fromLTRB(
                                                15, 15, 10, 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  favoriteNewsModelList[index]
                                                              .newsHead ==
                                                          null
                                                      ? ""
                                                      : favoriteNewsModelList[
                                                              index]
                                                          .newsHead,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  favoriteNewsModelList[index]
                                                              .newsDes
                                                              .length >
                                                          50
                                                      ? "${favoriteNewsModelList[index].newsDes.substring(0, 55)}...."
                                                      : favoriteNewsModelList[
                                                                      index]
                                                                  .newsDes ==
                                                              null
                                                          ? ""
                                                          : favoriteNewsModelList[
                                                                          index]
                                                                      .newsDes
                                                                      .length >
                                                                  50
                                                              ? "${favoriteNewsModelList[index].newsDes.substring(0, 55)}...."
                                                              : favoriteNewsModelList[
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
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                        child: favoriteNewsModelList[
                                                                        index]
                                                                    .newsFav ==
                                                                true
                                                            ? Icon(
                                                                Icons.favorite,
                                                                color: Colors
                                                                    .redAccent)
                                                            : Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: Colors
                                                                    .redAccent),
                                                        onTap: () async {}),
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
