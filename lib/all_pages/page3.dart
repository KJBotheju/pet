// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pet/widgets/constant.dart';

class Page3 extends StatefulWidget {
  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  TextEditingController recipientController = TextEditingController();
  final String defaultTrackingMessage = "777"; // Default trackinglink message
  final String defaultBindMessage = "000"; // Default bind message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _openMessagingAppToBind();
              },
              child: Text(
                "Bind with pet tracker",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _openMessagingApp();
              },
              child: Text(
                "Pet Location",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: recipientController,
              decoration: InputDecoration(labelText: 'Enter Phone Number'),
            ),
          ],
        ),
      ),
    );
  }

  void _openMessagingApp() async {
    final recipient = recipientController.text;
    final message = defaultTrackingMessage;

    final url = "sms:$recipient?body=$message";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openMessagingAppToBind() async {
    final recipient = recipientController.text;
    final message = defaultBindMessage;

    final url = "sms:$recipient?body=$message";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    recipientController.dispose();
    super.dispose();
  }
}
