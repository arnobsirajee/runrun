import 'package:flutter/material.dart';
import 'package:runrun/screen/profile_page.dart';
import 'package:runrun/screen/walking_page.dart';

import 'dailyActivities_page.dart';
import 'home_page.dart';

class landingPage extends StatefulWidget {
  const landingPage({super.key});

  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {

  int _selectedIndex =0;

  void _navigateBottomBar (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  final List<Widget> _pages = [
    homepage(),
    dailyActivities(),
    walking(),
    userProfile(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottom nevigationbar index
      body: _pages[_selectedIndex],

      appBar: AppBar(title: Text('RunRun'),),

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,

          selectedItemColor: Colors.red,
          selectedIconTheme: const IconThemeData(size: 28),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),

          unselectedItemColor: Colors.grey,
          unselectedIconTheme: const IconThemeData(size: 24),

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.access_time_outlined), label: "Daily Activity"),
            BottomNavigationBarItem(icon: Icon(Icons.directions_run), label: "Walking"),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: "Profile"),

          ]
      ),

      
    );
  }
}
