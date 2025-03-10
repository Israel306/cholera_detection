import 'package:flutter/material.dart';

import '../navigation/nav.dart';

class Result3 extends StatefulWidget {

  const Result3({super.key});

  @override
  _Result3State createState() => _Result3State();
}

class _Result3State extends State<Result3> {

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
                      'assets/low.png',
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Your Cholera Risk: Low Risk',
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
                  'Your responses indicate a low risk of cholera. While you don’t show strong signs of infection, staying cautious is essential. Keep drinking clean water, maintain good hygiene, and avoid unsafe food sources. If you develop new or worsening symptoms, don’t hesitate to consult a doctor.',
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