// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({
    super.key,
    required this.title,
    required this.press,
    required this.icon,
  });

  final String title;
  final Function()? press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Icon(
          icon,
          color: Colors.blue,
        ),
      ),
    );
  }
}
