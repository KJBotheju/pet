import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(), // Circular Progress Indicator
            SizedBox(height: 16), // Add some spacing
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}
