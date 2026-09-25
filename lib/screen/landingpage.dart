import 'package:flutter/material.dart';
import 'package:runrun/screen/BMI_page.dart';
import 'package:runrun/screen/daily_Activity.dart';
import 'history_page.dart';
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
    historyPage(),
    dailyActivity(),
    bmi_check(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      //bottom nevigationbar index
      body: _pages[_selectedIndex],


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
            BottomNavigationBarItem(icon: Icon(Icons.access_time_outlined), label: "History"),
            BottomNavigationBarItem(icon: Icon(Icons.directions_run), label: "Daily Activity"),
            BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined), label: "BMI"),

          ]
      ),

      
    );
  }
}
