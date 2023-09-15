// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_label, dead_code

import 'package:flutter/material.dart';
import '../all_pages/page1.dart';
import '../all_pages/page2.dart';
import '../all_pages/page3.dart';
import '../all_pages/page4.dart';
import '../all_pages/page5.dart';
import '../all_pages/page6.dart';
import '../all_pages/page7.dart';
import '../all_pages/page8.dart';
import '../all_pages/page9.dart';
// import '../all_pages/page10.dart';
// import '../all_pages/page11.dart';
// import '../all_pages/page12.dart';
import 'banner.dart';
import '../screens/home_screen.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

final List<Widget> pages = [
  Page1(),
  page2(),
  Page3(),
  page4(),
  page5(),
  page6(),
  page7(),
  page8(),
  page9(),
  // page10(),
  // page11(),
  // page12(),
];

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          HomeBanner(size: size),
          SizedBox(
            height: 1,
          ),
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              children: List.generate(
                9,
                (index) {
                  List<String> itemNames = [
                    'E-Channel',
                    'Shop',
                    'tracking',
                    'Food',
                    'photograpy',
                    'veterinary',
                    'Timer',
                    'vaccine',
                    'Donation',
                  ];
                  return GestureDetector(
                    onTap: () {
                      if (index < 9) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => pages[index],
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 7,
                      ),
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/images/dog$index.jpg',
                              // Replace with your image asset path
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            itemNames[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            color: Color.fromRGBO(250, 190, 102, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.home,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.maps_home_work,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.alarm_on,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
