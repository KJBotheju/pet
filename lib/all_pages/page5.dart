// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class page5 extends StatefulWidget {
  @override
  State<page5> createState() => _page5State();
}

class _page5State extends State<page5> {
  List<String> items = [
    'photographer 1',
    'photographer 2',
    'photographer 3',
    'photographer 4',
    'photographer 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photography'),
      ),
      body: Container(
        color: Colors.grey[200], // Set the background color
        padding: EdgeInsets.all(16.0), // Set the padding
        child: ListView.separated(
          itemCount: items.length,
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 10.0), // Add a gap between ListTiles
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 100,
              color: Color.fromARGB(
                  255, 119, 187, 243), // Set the background color for ListTile
              child: ListTile(
                title: Text(
                  items[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black, // Set the text color for ListTile
                  ),
                ),
                onTap: () {
                  // onTap code here
                  print(items[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
