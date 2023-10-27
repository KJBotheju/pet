// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pet/widgets/constant.dart';
import '../screens/neckbelt.dart';
import 'package:permission_handler/permission_handler.dart';

class Page3 extends StatefulWidget {
  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  TextEditingController recipientController = TextEditingController();
  bool showParagraph = false;
  String buttonText = "How To Track My Pet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        // Wrap the content in a SingleChildScrollView
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _openMessagingApp();
                },
                child: Text(
                  "Pet Location",
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
              TextField(
                controller: recipientController,
                decoration: InputDecoration(labelText: 'Enter Phone Number'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showParagraph = !showParagraph;
                    buttonText =
                        showParagraph ? "Close" : "How To Track My Pet";
                  });
                },
                child: Text(
                  buttonText,
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
              Visibility(
                visible: showParagraph,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Steps\n\n(1). Enter the phone number you want to track.\n\n(2). Click on the 'Pet Location' button.\n\n(3). Type '000' and send an SMS (ensure it's bound with the SIM card).\n\n(4). After successful binding, you will receive a message.\n\n(5). Type '777' and send a message; you will receive a link shortly.\n\n(6). Open the link to view your pet's exact location.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                // New button
                onPressed: () {
                  // Navigate to the 'neckbelt.dart' file
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            NeckBeltPage()), // Assuming NeckbeltScreen is the widget for 'neckbelt.dart'
                  );
                },
                child: Text(
                  "How To buy Neckbelt",
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
            ],
          ),
        ),
      ),
    );
  }

  void _openMessagingApp() async {
    final recipient = recipientController.text;

    // Request SMS permission
    var status = await Permission.sms.request();

    if (status.isGranted) {
      final url = "sms:$recipient";

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      // Handle the case when permission is not granted
      // You can show a message to the user here
    }
  }

  @override
  void dispose() {
    recipientController.dispose();
    super.dispose();
  }
}
