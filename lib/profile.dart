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
          Text('Username : $user'),
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
