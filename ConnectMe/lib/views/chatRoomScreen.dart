import 'package:ConnectMe/helper/authentication.dart';
import 'package:ConnectMe/services/auth.dart';
import 'package:ConnectMe/views/search.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  AuthService authService = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConnectMe', style: TextStyle(
          fontSize: 16
        )),
        actions: [
          GestureDetector(
            onTap: () {
              authService.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => Authentication()
              ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => SearchScreen()
          ));
        },
      ),
    );
  }
}
