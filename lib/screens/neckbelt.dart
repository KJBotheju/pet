import 'package:flutter/material.dart';

class NeckBeltPage extends StatefulWidget {
  @override
  _NeckBeltPageState createState() => _NeckBeltPageState();
}

class _NeckBeltPageState extends State<NeckBeltPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NeckBelt Tracker'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'NeckBelt Tracker',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'The NeckBelt Tracker is an advanced wearable device designed to track your daily activities and monitor your health.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'How to Buy:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'You can purchase the NeckBelt Tracker from our official website or visit our nearest store.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Price: \$99.99',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Images:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/images/dog0.jpg', // Replace with the actual image file path
              width: 200,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/images/dog1.jpg', // Replace with the actual image file path
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
