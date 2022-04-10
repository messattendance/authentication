import 'dart:async';

import 'package:authentication/CalenderApp.dart';
import 'package:authentication/feedback.dart';
import 'package:authentication/homepage.dart';
import 'package:authentication/login.dart';
import 'package:authentication/menu.dart';
import 'package:authentication/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  String finalemail = "";

  final tabs = [
    Center(child: CalenderApp()),
    Center(child: Menu()),
    Center(child: Fedback()),
    Center(child: Profile()),
  ];

  void initState() {
    getValidate().whenComplete(() async {
      Timer(Duration(seconds: 2),
          () => Get.to(finalemail == null ? Login() : BottomNav()));
    });
    super.initState();
  }

  Future getValidate() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? obtainedemail = sharedPreferences.getString('email');
    setState(() {
      finalemail = obtainedemail!;
    });
    print(finalemail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(48, 21, 81, 1),
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Color.fromARGB(255, 132, 118, 168),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Attendance',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Today Menu ',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Feedback',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.white,
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
