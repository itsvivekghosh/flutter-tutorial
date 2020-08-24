import 'package:ConnectMe/helper/authentication.dart';
import 'package:ConnectMe/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:ConnectMe/views/signup.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConnectMe',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Authentication(),
    );
  }
}
