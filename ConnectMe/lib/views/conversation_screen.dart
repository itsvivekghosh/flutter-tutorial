import 'package:ConnectMe/widgets/widget.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidgetMain(context),
        body: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: null,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Message...",
                        hintStyle: TextStyle(
                            color: Colors.white54
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
//                      initiateSearch();
                    },
                    child: Container(
                      height: 40, width: 40,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0x36FFFFFF),
                              const Color(0x0FFFFFFF),
                            ]
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset('assets/Images/search_white.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
    ),
    );
  }
}
