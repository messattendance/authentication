import 'package:authentication/bottomnav.dart';
import 'package:authentication/forgot.dart';
import 'package:authentication/homepage.dart';
import 'package:authentication/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:authentication/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/v1.png"),
          Positioned(
            top: 100,
            left: 92,
            child: Text(
              "MESS ATTENDANCE SYSTEM",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  decoration: TextDecoration.none,
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 48, 21, 81)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    "assets/images/v3.png",
                    width: size.width * 0.6,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Enter Email",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 62, 82, 196),
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 62, 82, 196),
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Enter Password",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 62, 82, 196),
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 62, 82, 196),
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 73, 43, 124),
                        ),
                        onPressed: () async {
                          signin(emailController.text, passwordController.text);
                          final SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();

                          sharedPreferences.setString(
                              "email", emailController.text);
                        },
                        child: Text("Login")),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Color.fromARGB(255, 121, 89, 178),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text("Register")),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Color.fromARGB(255, 121, 89, 178),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Forgot()));
                        },
                        child: Text("Forgot")),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void signin(String email, String password) async {
    final _auth = FirebaseAuth.instance;
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNav())))
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}
