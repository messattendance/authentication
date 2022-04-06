import 'package:authentication/homepage.dart';
import 'package:authentication/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:authentication/model/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String dropdownValue = 'Dinning Hall';
  List<String> location = [
    'Dinning Hall',
    'DH1',
    'DH2',
    'DH3',
    'DH4',
    'DH5',
    'DH6',
    'DH7',
    'DH8'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController idnumberController = TextEditingController();
    final _auth = FirebaseAuth.instance;
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
                    padding: const EdgeInsets.all(10),
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
                    padding: const EdgeInsets.all(10),
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: idnumberController,
                      decoration: const InputDecoration(
                        labelText: "Enter Id Number",
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
                    child: DropdownButton(
                      hint: const Text('Please choose a location'),
                      value: dropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: location.map((String location) {
                        return DropdownMenuItem(
                          value: location,
                          child: Text(location),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          signup(emailController.text, passwordController.text,
                              idnumberController.text);
                        },
                        child: Text("Register")),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text("Login")),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void signup(String email, String password, String idnumber) async {
    final _auth = FirebaseAuth.instance;

    postdetails() async {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;

      UserModel userModel = UserModel();

      // writing all the values
      userModel.email = user!.email;
      userModel.uid = user.uid;
      userModel.idnumber = idnumber;
      print(user.uid);
      print(user);
      await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .set({'idnumber': idnumber});
      Fluttertoast.showToast(msg: "Account created successfully :) ");

      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }

    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postdetails()})
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}
