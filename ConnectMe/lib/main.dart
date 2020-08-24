import 'package:ConnectMe/helper/authentication.dart';
import 'package:ConnectMe/helper/helperFunctions.dart';
import 'package:ConnectMe/views/chatRoomScreen.dart';
import 'package:ConnectMe/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:ConnectMe/views/signup.dart';
import 'package:firebase_core/firebase_core.dart';

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

void main() {
  runApp(MyApp());
}

class _MyAppState extends State<MyApp> {

  bool userIsLoggedIn;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn  = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[900],
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        accentColor: Colors.green[900],
        fontFamily: "OverpassRegular",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: userIsLoggedIn != null ?  userIsLoggedIn ? ChatRoom() : Authentication()
          : Container(
        child: Center(
          child: Authentication(),
        ),
      ),
    );
  }
}