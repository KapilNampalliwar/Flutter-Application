// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_hut/home_page.dart';
import 'package:ui_hut/main.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool switch1 = false;
  bool switch2 = false;
  bool switch3 = false;
  bool switch4 = false;
  bool switch5 = false;
  bool switch6 = false;

  final user = FirebaseAuth.instance.currentUser!;
  UserData curruser = UserData();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("usersdata")
        .doc(user.uid)
        .get()
        .then((value) {
      curruser = UserData.fromMap(value.data());
      setState(() {});
    });
  }

  void init() {
    FirebaseFirestore.instance
        .collection("usersdata")
        .doc(user.uid)
        .get()
        .then((value) {
      curruser = UserData.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Page1();
              }),
            );
          },
        ),
        title: Text(
          'Notification Setting',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: (() {
          FocusManager.instance.primaryFocus?.unfocus();
        }),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 5),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New Post',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          ),
                          Text(
                            'If any new post update',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                          )
                        ],
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlutterSwitch(
                              activeColor: Color.fromRGBO(76, 166, 168, 1),
                              width: 65,
                              value: switch1,
                              onToggle: (value) {
                                setState(() {
                                  switch1 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Got Hired',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          ),
                          Text(
                            'If you get hired any company',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                          )
                        ],
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlutterSwitch(
                              activeColor: Color.fromRGBO(76, 166, 168, 1),
                              width: 65,
                              value: switch2,
                              onToggle: (value) {
                                setState(() {
                                  switch2 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get Rejected',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          ),
                          Text(
                            'If you rejected by any company',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                          )
                        ],
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlutterSwitch(
                              activeColor: Color.fromRGBO(76, 166, 168, 1),
                              width: 65,
                              value: switch3,
                              onToggle: (value) {
                                setState(() {
                                  switch3 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Message',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          ),
                          Text(
                            'Got any new massage',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                          )
                        ],
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlutterSwitch(
                              activeColor: Color.fromRGBO(76, 166, 168, 1),
                              width: 65,
                              value: switch4,
                              onToggle: (value) {
                                setState(() {
                                  switch4 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Call',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          ),
                          Text(
                            'Have a call',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                          )
                        ],
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlutterSwitch(
                              activeColor: Color.fromRGBO(76, 166, 168, 1),
                              width: 65,
                              value: switch5,
                              onToggle: (value) {
                                setState(() {
                                  switch5 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dark Mode',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          ),
                          Text(
                            'Enable dark theme',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                          )
                        ],
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlutterSwitch(
                              activeColor: Color.fromARGB(255, 88, 86, 214),
                              width: 65,
                              activeIcon: Icon(
                                Icons.dark_mode,
                                size: 100,
                                color: Color.fromARGB(255, 88, 86, 214),
                              ),
                              inactiveColor: Color.fromRGBO(254, 177, 37, 1),
                              inactiveIcon: Icon(
                                Icons.sunny,
                                size: 100,
                                color: Color.fromRGBO(254, 177, 37, 1),
                              ),
                              value: curruser.dark_mode == null
                                  ? switch6
                                  : curruser.dark_mode!,
                              onToggle: (value) {
                                setState(() {
                                  init();
                                  FirebaseFirestore.instance
                                      .collection('usersdata')
                                      .doc(user.uid)
                                      .update({'dark_mode': value});
                                  print(value);
                                  switch6 = value;
                                  if (switch6) {
                                    MyApp.of(context)!
                                        .changeTheme(ThemeMode.dark);
                                  } else {
                                    MyApp.of(context)!
                                        .changeTheme(ThemeMode.light);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
