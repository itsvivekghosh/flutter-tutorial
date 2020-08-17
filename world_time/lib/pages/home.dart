import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);

    // set background
    String bgrImage = data['isDayTime'] ? 'day.png' : "night.png";
    Color bgrColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];
    Color color = data['isDayTime'] ? Colors.grey[900] : Colors.white;
    return Scaffold(
      backgroundColor: bgrColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'assets/$bgrImage',
            ),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: color,
                  ),
                  label: Text("Edit Location",
                      style: TextStyle(
                        color: color,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 34,
                        color: color,
                        letterSpacing: 2,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(data['time'],
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 70)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
