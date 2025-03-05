// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/splash_screen.dart';
import 'layouts/navigation/nav.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const CholeraDetection());
}

class CholeraDetection extends StatelessWidget {
  const CholeraDetection({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CholeraDetection',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const NavBottom(),
      },
    );
  }
}
