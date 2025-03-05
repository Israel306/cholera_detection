import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Image.asset(
               'assets/cholera.png',
               // width: 100,
               // height: 100,
               fit: BoxFit.cover,
             ),

             SizedBox(height: 10),
             Text(
               'Cholera Detector',
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 16,
                 fontFamily: "Inter",
               ),
             ),

          ],
        ),
      ),
    );
  }
}
