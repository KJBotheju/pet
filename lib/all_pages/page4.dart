import 'package:flutter/material.dart';
import 'package:pet/widgets/constant.dart';

class page4 extends StatefulWidget {
  @override
  State<page4> createState() => _page4State();
}

class _page4State extends State<page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
        title: Text('Photograpy'),
      ),
    );
  }
}
