import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  dynamic user = '';

  @override
  void initState() {
    showmail();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              height: 60,
              width: 362,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Username : $user",
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
                          width: 20, color: Color.fromRGBO(255, 193, 112, 1)))),
            ),
          )
        ],
      ),
    );
  }

  void showmail() async {
    final _auth = FirebaseAuth.instance;
    setState(() {
      user = _auth.currentUser?.email;
    });
  }
}
