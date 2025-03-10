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
      () => Navigator.pushReplacementNamed(context, '/home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/cholera.png',
                // width: 100,
                // height: 100,
                fit: BoxFit.cover,
              ),

              SizedBox(width: 5),
              Text(
                'Cholera',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(width: 2),
              Text(
                ' Detector',
                style: TextStyle(
                  color: Color(0xFF176C90),
                  fontSize: 28,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w900,
                ),
              ),

            ],
          ),
        ));
  }
}
