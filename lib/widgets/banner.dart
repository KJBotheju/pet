// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeBanner extends StatelessWidget {
  HomeBanner({
    super.key,
    required this.size,
  });

  final Size size;

  List<Widget> slideshowItems = [
    Image.asset('assets/images/dog0.jpg'),
    Image.asset('assets/images/dog1.jpg'),
    Image.asset('assets/images/dog2.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300, // Customize the height of the slideshow
        autoPlay: true, // Enable auto play
        aspectRatio:
            16 / 9, // Customize the aspect ratio of the slideshow items
        enlargeCenterPage: true, // Increase the size of the center item
        autoPlayCurve: Curves.fastOutSlowIn, // Define the animation curve
        autoPlayAnimationDuration:
            Duration(milliseconds: 800), // Define the animation duration
      ),
      items: slideshowItems,
    );
    // Container(
    //   height: size.height * 0.3,
    //   // decoration: BoxDecoration(
    //   //   color: kPrimaryColor,
    //   //   borderRadius: BorderRadius.circular(30),
    //   // ),
    // );
  }
}
