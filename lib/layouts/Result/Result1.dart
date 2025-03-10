import 'package:flutter/material.dart';

import '../navigation/nav.dart';

class Result1 extends StatefulWidget {

  const Result1({super.key});

  @override
  _Result1State createState() => _Result1State();
}

class _Result1State extends State<Result1> {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/high.png',
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Your Cholera Risk: High Risk',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 24,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  textAlign: TextAlign.justify,
                  'Your responses indicate a high risk of cholera infection. Severe symptoms like frequent watery diarrhea, dehydration, and vomiting require urgent medical attention. Please visit a healthcare facility immediately. In the meantime, drink oral re-hydration solution (ORS) and avoid contaminated food or water. Cholera can worsen quickly, so act fast to protect your health.',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 18,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF176C90),
                        padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) =>
                            const NavBottom(initialIndex: 2),
                          ),
                        );
                      },
                      child: const Text(
                        "Prevention",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}