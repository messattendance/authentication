import 'package:flutter/material.dart';

class mycomplaints extends StatefulWidget {
  const mycomplaints({Key? key}) : super(key: key);

  @override
  State<mycomplaints> createState() => _mycomplaintsState();
}

class _mycomplaintsState extends State<mycomplaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Complaints'),
          backgroundColor: Color.fromRGBO(48, 21, 81, 1),
        ),
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    height: 130,
                    width: 350,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Water Leakage",
                            style: TextStyle(
                                fontFamily: "poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 73, 43, 124)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Text(
                                "Status : ",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(62, 60, 60, 0.5)),
                              ),
                              Text(
                                "Initiated",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(218, 34, 124, 61)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            left: BorderSide(
                                color: Color.fromRGBO(255, 193, 112, 1),
                                width: 15))),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
