import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text("My First App"),
      centerTitle: true,
      backgroundColor: Colors.redAccent,
    ),
    body: Center(
      child: Text(
          "Hello From Vivek!",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.grey[400],
            fontFamily: "Roboto-Monot"
      )),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        child: Text("Click"),
        backgroundColor: Colors.redAccent[400],
      ),
  ),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}