import 'package:flutter/material.dart';
import 'package:cholera_detection/layouts/navigation/help.dart';
import 'package:cholera_detection/layouts/navigation/home.dart';
import 'package:cholera_detection/layouts/navigation/prevention.dart';
import 'package:cholera_detection/layouts/navigation/symptoms.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class NavBottom extends StatefulWidget {
  const NavBottom({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<NavBottom> createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  late List<Widget> _screens;
  int _selectedIndex = 0;

  @override
  void initState() {
    _screens = <Widget>[
      const Home(),
      const Symptoms(),
      const Prevention(),
      const Help(),
    ];
    _selectedIndex = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Transform.scale(
              scale: 0.75,
              child: SvgPicture.asset(width: 30, height: 30, 'assets/home.svg'),
            ),
            label: 'Home',
            activeIcon: Transform.scale(
              scale: 0.75,
              child: SvgPicture.asset(
                width: 30,
                height: 30,
                'assets/home.svg',
                colorFilter: const ColorFilter.mode(
                  Color(0xFF176C90),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Transform.scale(
              scale: 0.75,
              child: SvgPicture.asset(
                  width: 30, height: 30, 'assets/symptoms.svg'),
            ),
            label: 'Symptoms',
            activeIcon: Transform.scale(
              scale: 0.75,
              child: SvgPicture.asset(
                width: 40,
                height: 40,
                'assets/symptoms.svg',
                colorFilter: const ColorFilter.mode(
                  Color(0xFF176C90),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Transform.scale(
              scale: 0.75,
              child: SvgPicture.asset(
                  width: 30, height: 30, 'assets/prevention.svg'),
            ),
            label: 'Prevention',
            activeIcon: Transform.scale(
              scale: 0.75,
              child: SvgPicture.asset(
                width: 30,
                height: 30,
                'assets/prevention.svg',
                colorFilter: const ColorFilter.mode(
                  Color(0xFF176C90),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Transform.scale(
              scale: 0.75,
              child:
              SvgPicture.asset(width: 30, height: 30, 'assets/help.svg'),
            ),
            label: 'Help',
            activeIcon: Transform.scale(
              scale: 0.75,
              child: SvgPicture.asset(
                width: 30,
                height: 30,
                'assets/help.svg',
                colorFilter: const ColorFilter.mode(
                  Color(0xFF176C90),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF176C90),
        selectedLabelStyle: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Inter',
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12.0,
          color: Color(0xFF979797),
          fontWeight: FontWeight.w700,
          fontFamily: 'Inter',
        ),
        unselectedItemColor: const Color(0xFF979797),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
