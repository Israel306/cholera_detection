import 'package:flutter/material.dart';

class Prevention extends StatefulWidget {
  const Prevention({super.key});

  @override
  State<Prevention> createState() => _PreventionState();
}

class _PreventionState extends State<Prevention> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> preventionTips = const [
    "Drink only clean, treated, or boiled water.",
    "Wash hands regularly with soap and clean water.",
    "Store water in clean, covered containers.",
    "Cook food thoroughly before eating.",
    "Avoid raw or under-cooked seafood.",
    "Eat food that is fresh and hot.",
    "Wash fruits and vegetables with safe water.",
    "Use proper sanitation—dispose of waste safely.",
    "Avoid open defecation; use clean toilets.",
    "Maintain good personal hygiene daily.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cholera.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 5),
            const Text(
              'Cholera Detector',
              style: TextStyle(
                color: Color(0xFF176C90),
                fontSize: 24,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],

        ),


      ),
      body: Column(
        children: [
          const Divider(color: Colors.grey, thickness: 2,),
          SizedBox(height: 10),// Horizontal line after AppBar
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Prevention Tips",
                    style: TextStyle(
                      color: Color(0xFF176C90),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "How To Stay Safe from Cholera!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: preventionTips.length,
                      itemBuilder: (context, index) {
                        return PreventionItem(
                          number: index + 1,
                          text: preventionTips[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class PreventionItem extends StatelessWidget {
  final int number;
  final String text;
  const PreventionItem({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        "$number. $text",
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }
}


