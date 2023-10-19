// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pet/widgets/constant.dart';

class NeckBeltPage extends StatefulWidget {
  @override
  _NeckBeltPageState createState() => _NeckBeltPageState();
}

class _NeckBeltPageState extends State<NeckBeltPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NeckBelt'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'NeckBelt Tracker',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'The NeckBelt Tracker is a stylish collar for your beloved pet, equipped with a cutting-edge tracker. If your furry friend ever goes missing, this smart collar and app combo will help you quickly locate and reunite with your four-legged family member.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'How to Buy:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'You can purchase the NeckBelt Tracker by contacting us.\n\nEmail: Petcare@gmail.com\nPhone: 0771569872',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Price: Rs. 2500',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Images:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two columns
            ),
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/traking1.jpeg',
                    width: 200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/traking2.jpeg',
                    width: 200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/traking3.jpeg',
                    width: 200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/traking4.jpeg',
                    width: 200,
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
