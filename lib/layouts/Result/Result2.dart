import 'package:flutter/material.dart';

import '../navigation/nav.dart';

class Result2 extends StatefulWidget {

  const Result2({super.key});

  @override
  _Result2State createState() => _Result2State();
}

class _Result2State extends State<Result2> {

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
                      'assets/medium.png',
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Your Cholera Risk: Medium Risk',
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
                  'Your responses suggest a moderate risk of cholera. While your symptoms and history don’t confirm an infection, you should monitor your health closely. Stay hydrated with clean, boiled, or bottled water. If symptoms worsen, such as persistent diarrhea or dehydration, seek medical help. Maintain proper hygiene and avoid risky foods or water sources.',
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