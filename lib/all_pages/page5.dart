// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class page5 extends StatefulWidget {
  @override
  State<page5> createState() => _page5State();
}

class _page5State extends State<page5> {
  List<String> items = [
    'kavinda photography',
    'rakshitha photography',
    'tharushi photography',
    'malki photography',
    'durandi photography',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photography'),
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
                    2.5 // Set the vertical spacing between grid items
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
                      image:
                          AssetImage('assets/photograpy/photograpy$index.jpg'),
                      fit: BoxFit.cover),
                ),
                // color: Color.fromARGB(255, 119, 187,
                //     243), // Set the background color for grid item
                child: InkWell(
                  onTap: () {
                    launch('https://www.google.com');
                    // onTap code here
                    print(items[index]);
                  },
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        items[index],
                        style: TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.black.withOpacity(0.5),
                          // Set the text color for grid item
                          fontSize: 18.0, // Set the font size for grid item
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