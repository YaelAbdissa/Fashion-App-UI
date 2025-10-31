import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({super.key});

  @override
  State<HomeNavScreen> createState() => _HomeNavScreenState();
}

class _HomeNavScreenState extends State<HomeNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> widgetOptions = [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/icon_home.png"),
            activeIcon: Image.asset("assets/icons/icon_home_active.png"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/icon_cart.png"),
            activeIcon: Image.asset("assets/icons/icon_cart_active.png"),
            label: "cart",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/icon_profile.png"),
            activeIcon: Image.asset("assets/icons/icon_profile_active.png"),
            label: "profile",
          ),
        ],
      ),
    );
  }
}
