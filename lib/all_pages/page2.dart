// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pet/widgets/constant.dart';

class page2 extends StatefulWidget {
  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  List<String> items = [
    'Visit Shop',
  ];

  List<String> shop_link = [
    'https://petmart.lk/',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
        title: Text('Pet Shop'),
      ),
      body: Container(
        color: Colors.grey[200], // Set the background color
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: 2), // Set the padding
        child: SingleChildScrollView(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Set the number of columns
                mainAxisSpacing: 10.0,
                childAspectRatio:
                    0.6 // Set the vertical spacing between grid items
                ),
            shrinkWrap:
                true, // Allow the GridView to be scrollable within the SingleChildScrollView
            physics:
                NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/petshop.jpeg'),
                      fit: BoxFit.cover),
                ),
                // color: Color.fromARGB(255, 119, 187,
                //     243), // Set the background color for grid item
                child: InkWell(
                  onTap: () {
                    launch(shop_link[index]);
                    // onTap code here
                    //print(items[index]);
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        items[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,

                          // Set the text color for grid item
                          fontSize: 30.0, // Set the font size for grid item
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
