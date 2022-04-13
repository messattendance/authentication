import 'package:flutter/material.dart';
import "package:flutter_clean_calendar/flutter_clean_calendar.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class CalenderApp extends StatefulWidget {
  const CalenderApp({Key? key}) : super(key: key);

  @override
  State<CalenderApp> createState() => _CalenderAppState();
}

class _CalenderAppState extends State<CalenderApp> {
  String status = '';
  String status1 = '';
  String status2 = '';

  DateTime selectedDay = DateTime.now();
  late List<CleanCalendarEvent> selectedEvent;
  final Map<DateTime, List<CleanCalendarEvent>> events = {};

  void initState() {
    show(selectedDay);
    selectedEvent = events[selectedDay] ?? [];
    super.initState();
  }

  Future<void> show(date) async {
    status = "";
    status1 = "";
    status2 = "";
    final _auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final uid = _auth.currentUser?.uid;
    final user = firebaseFirestore.collection('users').doc(uid).get();
    var now = date;
    var formatter = new DateFormat('dd-MM-yyyy');
    String breakfast = formatter.format(now) + ' ' + "Breakfast";
    String Lunch = formatter.format(now) + ' ' + "Lunch";
    String Dinner = formatter.format(now) + ' ' + "Dinner";

    final db = FirebaseDatabase.instance.reference().child(breakfast);
    db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, values) {
        if (key == _auth.currentUser?.email?.substring(0, 7)) {
          setState(() {
            status = values["exit_time"];
          });
        }
      });
      if (status.length != 0) {
        print("first" + status);
      } else {
        status = "Not Attended";
      }
    });
    final db1 = FirebaseDatabase.instance.reference().child(Lunch);
    db1.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, values) {
        if (key == _auth.currentUser?.email?.substring(0, 7)) {
          setState(() {
            status1 = values["exit_time"];
          });
        }
      });
      if (status1.length != 0) {
        print(status1);
      } else {
        status1 = "Not Attended";
      }
    });

    final db2 = FirebaseDatabase.instance.reference().child(Dinner);
    db2.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, values) {
        if (key == _auth.currentUser?.email?.substring(0, 7)) {
          setState(() {
            status2 = values["exit_time"];
          });
        }
      });
      if (status2.length != 0) {
        print(status2);
      } else {
        status2 = "Not Attended";
      }
    });
    if (status2.length == 0) {
      setState(() {
        status2 = "Not attended";
      });
    }
    if (status1.length == 0) {
      setState(() {
        status1 = "Not attended";
      });
    }
    if (status.length == 0) {
      setState(() {
        status = "Not attended";
      });
    }

    // Map<DateTime, List<CleanCalendarEvent>> events={
    //   date: [
    //   CleanCalendarEvent('Event',
    //       startTime: DateTime(date.year, date.month,
    //           date.day, 12, 0),
    //       endTime: DateTime(date.year, date.month,
    //           date.day, 12, 0),
    //       description: status,
    //       color: Colors.blue),
    // ],
    // };
  }

  void _handleData(date) async {
    await show(date);
    setState(() {
      print("main" + status);
      print("main" + status1);
      print("main" + status2);
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Attendance',
            style: TextStyle(
              fontFamily: "poppins",
              fontSize: 18,
              fontWeight: FontWeight.w400,
            )),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(48, 21, 81, 1),
      ),
      body: SafeArea(
        child: Container(
          child: Column(children: [
            Expanded(
              child: Calendar(
                startOnMonday: true,
                selectedColor: Color.fromARGB(255, 73, 43, 124),
                todayColor: Color.fromRGBO(255, 193, 112, 1),
                eventColor: Colors.green,
                eventDoneColor: Colors.amber,
                bottomBarColor: Color.fromRGBO(255, 193, 112, 1),
                onRangeSelected: (range) {
                  print('selected Day ${range.from}, ${range.to}');
                },
                onDateSelected: (date) {
                  return _handleData(date);
                },
                events: events,
                isExpanded: true,
                isExpandable: true,
                dayOfWeekStyle: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(62, 60, 60, 0.5),
                  fontWeight: FontWeight.w500,
                ),
                bottomBarTextStyle:
                    TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                hideBottomBar: false,
                hideArrows: false,
                weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      height: 180,
                      width: 362,
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Breakfast : $status",
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 16,
                                  color: Color.fromRGBO(73, 43, 124, 1)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Lunch : $status1",
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 16,
                                  color: Color.fromRGBO(73, 43, 124, 1)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Dinner : $status2",
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 16,
                                  color: Color.fromRGBO(73, 43, 124, 1)),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(73, 43, 124, 0.04),
                          border: Border(
                              left: BorderSide(
                                  width: 20,
                                  color: Color.fromRGBO(255, 193, 112, 1)))),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
