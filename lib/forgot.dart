import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Forgot extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Reset Password",
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                forgot(emailController.text);
              },
              child: Text("Reset"))
        ],
      ),
    );
  }

  void forgot(String email) async {
    final _auth = FirebaseAuth.instance;
    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) => Fluttertoast.showToast(msg: "Please Check Your Email"))
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}
