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
  void initState() {
    showmenu();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 100,
                width: 350,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Breakfast",
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 43, 124)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "hi $breakfast",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        left: BorderSide(
                            color: Color.fromARGB(31, 73, 43, 124),
                            width: 15))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 100,
                width: 350,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Lunch",
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 43, 124)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "hi $breakfast",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        left: BorderSide(
                            color: Color.fromARGB(31, 73, 43, 124),
                            width: 15))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 100,
                width: 350,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Snacks",
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 43, 124)),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        left: BorderSide(
                            color: Color.fromARGB(31, 73, 43, 124),
                            width: 15))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 100,
                width: 350,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Dinner",
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 43, 124)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "hi $breakfast",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        left: BorderSide(
                            color: Color.fromARGB(31, 73, 43, 124),
                            width: 15))),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showmenu() async {
    print("hi");
    DocumentSnapshot<Map<String, dynamic>> v = await FirebaseFirestore.instance
        .collection('menu')
        .doc('avs7rYGkSNUXRCH6latE')
        .get();
    setState(() {
      breakfast = v['breakfast'];
      lunch = v['lunch'];
      snacks = v['snacks'];
      dinner = v['dinner'];
      print(lunch);
    });
  }
}
