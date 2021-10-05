import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImageSlider extends StatelessWidget {
  List items;
  Widget image;
  String title;

  CarouselImageSlider({required this.items, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: CarouselSlider(
        options: CarouselOptions(
            height: 200, autoPlay: true, enlargeCenterPage: true),
        items: items.map((item) {
          return Builder(builder: (BuildContext context) {
            return Container(
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: image),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.black12.withOpacity(0),
                                      Colors.black
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                child: Text(
                                  title,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          )),
                    ])));
          });
        }).toList(),
      ),
    );
  }
}
