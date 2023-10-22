// This line suppresses a linting warning regarding the use of const constructors.
// This is often a matter of coding style and does not affect the functionality.
import 'package:flutter/material.dart'; // Import for Flutter's material design widgets
import 'package:pet/screens/home_screen.dart'; // Import for the HomeScreen widget
import 'package:provider/provider.dart'; // Import for the Provider package
import 'screens/auth_screen.dart'; // Import for the AuthScreen widget
import './providers/auth.dart'; // Import for the custom Auth provider class
import 'screens/splash_screen.dart'; // Import for the SplashScreen widget

void main() {
  runApp(MyApp()); // Entry point
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
