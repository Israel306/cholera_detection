import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the signup page after 5 seconds
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacementNamed(context, '/signup'),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity, // Take full width
          height: double.infinity, // Take full height
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/splash.gif'), // Ensure it's added in pubspec.yaml
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),
        ));
  }
}
