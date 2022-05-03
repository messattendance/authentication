import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Fedback extends StatefulWidget {
  const Fedback({Key? key}) : super(key: key);

  // const Feedback({Key? key}) : super(key: key);

  @override
  State<Fedback> createState() => _FedbackState();
}

class _FedbackState extends State<Fedback> {
  late File _imageFile;
  late String _imageUrl;
  final TextEditingController complaintController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  double q1 = 0;
  double q2 = 0;
  double q3 = 0;
  double q4 = 0;
  String complaint = "";

  Future uploadImageToFirebase() async {
    String fileName = basename(_imageFile.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('images/$fileName  ');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    final snapshot = await uploadTask.whenComplete(() => {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      _imageUrl = urlDownload;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback',
            style: TextStyle(
              fontFamily: "poppins",
              fontSize: 18,
              fontWeight: FontWeight.w400,
            )),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(48, 21, 81, 1),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            alignment: Alignment.center,
            height: 180,
            width: 377,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    " Snacks, Tea, Coffee and Breakfast",
                    style: TextStyle(
                        fontFamily: "poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 73, 43, 124)),
                  ),
                ),
                RatingBar.builder(
                  initialRating: q1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    q1 = rating;
                    setState(() {});
                  },
                ),
              ],
            ),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(73, 43, 124, 0.08),
                border: Border(
                    left: BorderSide(
                        color: Color.fromRGBO(255, 193, 112, 1), width: 15))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            alignment: Alignment.center,
            height: 180,
            width: 377,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    " Snacks, Tea, Coffee and Breakfast",
                    style: TextStyle(
                        fontFamily: "poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 73, 43, 124)),
                  ),
                ),
                RatingBar.builder(
                  initialRating: q2,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating1) {
                    q2 = rating1;
                    setState(() {});
                  },
                ),
              ],
            ),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(73, 43, 124, 0.08),
                border: Border(
                    left: BorderSide(
                        color: Color.fromRGBO(255, 193, 112, 1), width: 15))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            alignment: Alignment.center,
            height: 180,
            width: 377,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Quantity of food as per menu i.e., no. of grams/ actual consumption whichever is higher? ",
                    style: TextStyle(
                        fontFamily: "poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 73, 43, 124)),
                  ),
                ),
                RatingBar.builder(
                  initialRating: q3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating2) {
                    q3 = rating2;
                    setState(() {});
                  },
                ),
              ],
            ),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(73, 43, 124, 0.08),
                border: Border(
                    left: BorderSide(
                        color: Color.fromRGBO(255, 193, 112, 1), width: 15))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            alignment: Alignment.center,
            height: 180,
            width: 377,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    " Snacks, Tea, Coffee and Breakfast",
                    style: TextStyle(
                        fontFamily: "poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 73, 43, 124)),
                  ),
                ),
                RatingBar.builder(
                  initialRating: q4,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating3) {
                    q4 = rating3;
                    setState(() {});
                  },
                ),
              ],
            ),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(73, 43, 124, 0.08),
                border: Border(
                    left: BorderSide(
                        color: Color.fromRGBO(255, 193, 112, 1), width: 15))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            width: 50,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  pushfeedback();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(30, 15),
                  primary: const Color.fromARGB(255, 73, 43, 124),
                ),
                child: const Text("Submit")),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            " Complaints Block",
            style: TextStyle(
                fontFamily: "poppins",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 73, 43, 124)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: complaintController,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: "Write your Complaint",
              border: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(8),
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
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20,
          ),
          child: SizedBox(
            width: 40,
            height: 40,
            child: TextButton.icon(
                onPressed: () async {
                  final imageFile = await ImagePicker()
                      .pickImage(source: ImageSource.camera, maxWidth: 600);
                  setState(() {
                    _imageFile = File(imageFile!.path);
                  });
                },
                icon: const Icon(Icons.camera),
                label: const Text('Take a picture')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            width: 50,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                pushComplaint(complaintController.text);
                complaintController.text = "";
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(30, 15),
                primary: const Color.fromARGB(255, 73, 43, 124),
              ),
              child: const Text("Submit Complaint"),
            ),
          ),
        ),
      ]),
    );
  }

  void pushfeedback() async {
    if (q1 == 0 || q2 == 0 || q3 == 0 || q4 == 0) {
      Fluttertoast.showToast(msg: "Required Feedback for every Question");
    } else {
      var now = DateTime.now();
      var formatter = DateFormat('dd-MM-yyyy');
      String? idnumber = _auth.currentUser?.email?.substring(0, 7);
      String todaydate = formatter.format(now);
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;
      await firebaseFirestore
          .collection("feedback")
          .doc(todaydate + ' ' + idnumber.toString())
          .set({'idnumber': idnumber, 'q1': q1, 'q2': q2, 'q3': q3, 'q4': q4});
    }
  }

  void pushComplaint(complaint) async {
    print(complaint);
    if (complaint.length == 0) {
      Fluttertoast.showToast(msg: "Write Complaint");
    } else {
      var now = DateTime.now();
      var formatter = DateFormat('dd-MM-yyyy');
      String? idnumber = _auth.currentUser?.email?.substring(0, 7);
      String todaydate = formatter.format(now);
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;
      await uploadImageToFirebase();

      await firebaseFirestore
          .collection("complaints")
          .doc(todaydate + ' ' + idnumber.toString())
          .set({
        'idnumber': idnumber,
        'complaint': complaint,
        'status': "initiated",
        'imgUrl': _imageUrl
      });
    }
  }
}
