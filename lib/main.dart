// ignore_for_file: avoid_unnecessary_containers, avoid_print, library_private_types_in_public_api

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:ui_hut/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("Widgets initialized");
  await Firebase.initializeApp();
  print("firebase initialized");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  final appTitle = 'UI HUT';

  ThemeMode? _themeMode;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI HUT',
      themeMode: _themeMode,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              toolbarTextStyle: TextStyle(color: Colors.black),
              titleTextStyle: TextStyle(color: Colors.black)),
              
              ),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const Mainpage1(),
    );
  }
}
