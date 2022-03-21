import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:authentication/Data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String status = '';
  String status1 = '';
  String status2 = '';

  @override
  void initstate() {
    super.initState();
    show();
  }

  show() async {
    final _auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final uid = _auth.currentUser?.uid;
    final user = firebaseFirestore.collection('users').doc(uid).get();
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String breakfast = formatter.format(now) + ' ' + "Breakfast";
    String Lunch = formatter.format(now) + ' ' + "Lunch";
    String Dinner = formatter.format(now) + ' ' + "Dinner";
    print(breakfast);
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
      print(_auth.currentUser?.email?.substring(0, 7));
      if (status.length != 0) {
        print(status);
      } else {
        status = "Not yet attended";
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
      print(_auth.currentUser?.email?.substring(0, 7));
      if (status1.length != 0) {
        print(status1);
      } else {
        status1 = "Not yet attended";
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
      print(_auth.currentUser?.email?.substring(0, 7));
      if (status2.length != 0) {
        print(status1);
      } else {
        status2 = "Not yet attended";
      }
    });
    if (status2.length == 0) {
      setState(() {
        status2 = "not yet attended";
      });
    }
    if (status1.length == 0) {
      setState(() {
        status1 = "not yet attended";
      });
    }
    if (status.length == 0) {
      setState(() {
        status = "not yet attended";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                show();
              },
              child: Text("show attendance")),
          Text("Breakfast : $status"),
          Text("Lunch : $status1"),
          Text("Dinner :$status2")
        ],
      ),
    );
  }
}