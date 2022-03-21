import 'package:authentication/menu.dart';
import 'package:authentication/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:authentication/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:authentication/feedback.dart';
import 'package:authentication/homepage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.blue],
                  ),
                ),
                height: 80.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Menu(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0.0,
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    "Show Menu",
                    style: TextStyle(fontSize: 20.0, color: Colors.red),
                  ),
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("Give Feedback"))),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Homepage(),
                      ),
                    );
                  },
                  child: Text("Check Attendance"),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Text("Profile")),
              ElevatedButton(
                  onPressed: () {
                    logout();
                  },
                  child: Text("Logout")),
            ],
          ),
        ),
      ),
    );
  }

  void logout() async {
    final _auth = FirebaseAuth.instance;
    await _auth
        .signOut()
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login())))
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}