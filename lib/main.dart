import 'package:flutter/material.dart';
import 'package:pet/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'screens/auth_screen.dart';
import './providers/auth.dart';
import 'screens/splash_screen.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp()); // Entry point
}

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final status = await Permission.sms.request();
  if (status.isGranted) {
    runApp(MyApp());
  } else {
    // Handle the case when permission is not granted
  }
}*/

class MyApp extends StatelessWidget {
  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // MultiProvider allows you to provide multiple providers to the widget tree
        ChangeNotifierProvider.value(
          value:
              Auth(), // Provides an instance of the custom Auth class as a ChangeNotifier
        ),
      ],
      child: Consumer<Auth>(
        // Consumer listens for changes in the Auth provider
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Baww', // Title of the app
          theme: ThemeData(
            // Define the app's theme, including colors and fonts
            primarySwatch: Colors.purple, // Primary color
            accentColor: Colors.deepOrange, // Accent color
            fontFamily: 'Lato', // Font family
          ),
          home: auth.isAuth
              ? HomeScreen() // If the user is authenticated, show the HomeScreen
              : FutureBuilder(
                  future: auth
                      .tryAutoLogin(), // Asynchronous operation to auto-login
                  builder: (ctx, authResultSnapshot) => authResultSnapshot
                              .connectionState ==
                          ConnectionState.waiting
                      ? SplashScreen() // Show a loading screen if waiting for authentication
                      : AuthScreen(), // Show the authentication screen once the result is available
                ),
          routes: {},
        ),
      ),
    );
  }
}
