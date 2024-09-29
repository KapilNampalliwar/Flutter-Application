import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_hut/home_page.dart';
import 'package:ui_hut/login_page.dart';
import 'package:ui_hut/main.dart';

import 'package:ui_hut/splash.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Page1();
          } else {
            return const Loginpage();
          }
        },
      ),
    );
  }
}

class Mainpage1 extends StatefulWidget {
  const Mainpage1({super.key});

  @override
  State<Mainpage1> createState() => _Mainpage1State();
}

class _Mainpage1State extends State<Mainpage1> {
  final user = FirebaseAuth.instance.currentUser!;

  UserData curruser = UserData();

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("usersdata")
        .doc(user.uid)
        .get()
        .then((value) {
      curruser = UserData.fromMap(value.data());
      setState(() {
        if (curruser.dark_mode!) {
          MyApp.of(context)!.changeTheme(ThemeMode.dark);
          CircularProgressIndicator;
        } else {
          MyApp.of(context)!.changeTheme(ThemeMode.light);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Page1();
          } else {
            return const Splash();
          }
        },
      ),
    );
  }
}
