import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String breakfast = '';
  String lunch = '';
  String snacks = '';
  String dinner = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                showmenu();
              },
              child: Text("click here for menu")),
          Text("Breakfast : $breakfast"),
          Text("Lunch : $lunch"),
          Text("Snacks : $snacks"),
          Text("Dinner :$dinner"),
        ],
      ),
    );
  }

  void showmenu() async {
    DocumentSnapshot<Map<String, dynamic>> v = await FirebaseFirestore.instance
        .collection('menu')
        .doc('avs7rYGkSNUXRCH6latE')
        .get();
    setState(() {
      breakfast = v['breakfast'];
      lunch = v['lunch'];
      snacks = v['snacks'];
      dinner = v['dinner'];
    });
  }
}
