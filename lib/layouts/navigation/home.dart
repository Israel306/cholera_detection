import 'package:flutter/material.dart';
import '../../components/CustomerCard.dart';
import 'nav.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
          SizedBox(height: 40),// Horizontal line after AppBar
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomCard(
                  text: 'Check Symptoms',
                  svgPath: 'assets/symptoms.svg', // Correct usage
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                        const NavBottom(initialIndex: 1),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 40), // Spacing
                CustomCard(
                  text: 'Prevention Tips',
                  svgPath: 'assets/prevention.svg', // Correct usage
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                        const NavBottom(initialIndex: 2),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40), // Spacing
                CustomCard(
                  text: 'Emergency Help',
                  svgPath: 'assets/help.svg', // Correct usage
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                        const NavBottom(initialIndex: 3),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



