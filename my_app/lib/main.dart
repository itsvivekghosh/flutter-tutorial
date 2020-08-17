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
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Ninja Bar"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.2,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 20, 40, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: CircleAvatar(
              backgroundImage: AssetImage('assets/default.jpg'),
              radius: 40.0,
            )),
            Divider(height: 100, color: Colors.grey[800]),
            Text(
              "NAME",
              style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Vivek Ghosh",
              style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Current Ninja Level",
              style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "8",
              style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber[200],
                  letterSpacing: 2.0),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text("soapmactevis1@gmail.com",
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18.0,
                        letterSpacing: 1.0)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
