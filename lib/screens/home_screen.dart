// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../widgets/constant.dart';
import '../widgets/body.dart';
import '../widgets/menuList.dart';
import '../widgets/appDrawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBgColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          // elevation: 0,
          title: Text(
            'Home Page',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          // actions: [
          //   CircleAvatar(
          //     backgroundColor: kPrimaryColor,
          //   ),
          // ],
        ),
        body: Body(),
        drawer: Drawer(
          child: Container(
            color: Colors.black,
            child: AppDrawer(),
          ),
        ));
  }
}
