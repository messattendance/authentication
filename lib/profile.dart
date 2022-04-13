import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:authentication/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          ),
          Container(
            width: 160,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.blue],
              ),
            ),
            height: 40.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 73, 43, 124),
              ),
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                await sharedPreferences.remove('email');
                logout(context);
              },
              child: Text(
                "Logout",
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(255, 241, 241, 241)),
              ),
            ),
          ),
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

void logout(BuildContext context) async {
  final _auth = FirebaseAuth.instance;
  await _auth
      .signOut()
      .then((value) => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login())))
      .catchError((e) {
    Fluttertoast.showToast(msg: e!.message);
  });
}
