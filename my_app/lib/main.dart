import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ninja Bar"),
        centerTitle: true,
      ),
    );
  }
}
