import 'package:eventra/screens/calender.dart';
import 'package:eventra/screens/home_normal_user.dart';
import 'package:eventra/screens/profile.dart';
import 'package:eventra/screens/timetable.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex = 0;
  List<String> appbarText = ['Home', 'Calender', 'TimeTable', 'Profile'];
  List<Widget> displayWidget = [
    HomeNormalUser(),
    Calendar(),
    Timetable(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appbarText[_currentIndex],
          style: TextStyle(fontSize: 25.0),
        ),
      ),
      body: displayWidget[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.teal,
        selectedIconTheme: IconThemeData(size: 30.0),
        unselectedIconTheme: IconThemeData(size: 20.0),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'TimeTable',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
