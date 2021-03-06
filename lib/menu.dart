import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:intl/intl.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final _auth = FirebaseAuth.instance;
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
        appBar: AppBar(
          title: Text('Check Menu'),
          backgroundColor: Color.fromRGBO(48, 21, 81, 1),
        ),
        body: ListView(
          children: [
            Padding(
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
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(62, 60, 60, 0.5)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "$breakfast",
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 73, 43, 124)),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              left: BorderSide(
                                  color: Color.fromRGBO(255, 193, 112, 1),
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
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(62, 60, 60, 0.5)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "$lunch",
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 73, 43, 124)),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              left: BorderSide(
                                  color: Color.fromRGBO(255, 193, 112, 1),
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
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(62, 60, 60, 0.5)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "$snacks",
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 73, 43, 124)),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              left: BorderSide(
                                  color: Color.fromRGBO(255, 193, 112, 1),
                                  width: 15))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      height: 50,
                      width: 350,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "Dinner",
                                  style: TextStyle(
                                      fontFamily: "poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(62, 60, 60, 0.5)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "$dinner",
                                  style: TextStyle(
                                      fontFamily: "poppins",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 73, 43, 124)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              left: BorderSide(
                                  color: Color.fromRGBO(255, 193, 112, 1),
                                  width: 15))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      height: 70,
                      width: 350,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "Interested ?",
                                  style: TextStyle(
                                      fontFamily: "poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(62, 60, 60, 0.5)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: ToggleSwitch(
                                  customWidths: [50.0, 50.0],
                                  cornerRadius: 20.0,
                                  activeBgColors: [
                                    [Colors.cyan],
                                    [Colors.redAccent]
                                  ],
                                  activeFgColor: Colors.white,
                                  inactiveBgColor: Colors.grey,
                                  inactiveFgColor: Colors.white,
                                  totalSwitches: 2,
                                  labels: ['YES', 'NO'],
                                  onToggle: (index) {
                                    getleave(index);
                                    onChanged:
                                    null;
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              left: BorderSide(
                                  color: Color.fromRGBO(255, 193, 112, 1),
                                  width: 15))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
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
      print(breakfast + lunch + snacks + dinner);
    });
  }

  void getleave(int? index) async {
    try {
      if (index == 1) {
        String? idnumber = _auth.currentUser?.email?.substring(0, 7);

        var now = new DateTime.now();
        var formatter = new DateFormat('dd-MM-yyyy');
        String todaydate = formatter.format(now);
        print(idnumber);
        await FirebaseFirestore.instance
            .collection('leavemeal')
            .doc(todaydate + ' ' + idnumber.toString())
            .set({'idnumber': idnumber});
      }
    } catch (err) {
      print(err);
    }
  }
}
