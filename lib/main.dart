import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/splash_screen.dart';
import 'layouts/navigation/nav.dart';

void main() {
  runApp(const CholeraDetection());
}

class CholeraDetection extends StatelessWidget {
  const CholeraDetection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CholeraDetection',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        fontFamily: "Inter",
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => const NavBottom()),
    ]

    );
  }
}
