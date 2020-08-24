import 'package:ConnectMe/helper/constants.dart';
import 'package:ConnectMe/helper/helperFunctions.dart';
import 'package:ConnectMe/services/database.dart';
import 'package:ConnectMe/views/conversation_screen.dart';
import 'package:ConnectMe/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController = new TextEditingController();
  QuerySnapshot searchSnapshot;

  initiateSearch() async {
    await databaseMethods.getUsersByUsername(searchTextEditingController.text)
        .then((val) {
          setState(() {
            searchSnapshot = val;
          });
    });
  }

  Widget searchList() {
    return searchSnapshot != null ? ListView.builder(
      itemCount: searchSnapshot.documents.length,
        shrinkWrap: true,
      itemBuilder: (context, index) {
        return SearchTile(
          userName: searchSnapshot.documents[index].data['name'],
          userEmail: searchSnapshot.documents[index].data['email'],
        );
      }
    ) : Container();
  }

  createChatRoomAndStartConversation({ String userName }) {
    if (userName != Constants.myName && Constants.myName != null) {
      String chatRoomId = getChatRoomId(userName, Constants.myName);
      List<String> users = [userName, Constants.myName];

      Map<String, dynamic> chatRoomMap = {
        "users" : users,
        "chatRoomId": chatRoomId,
      };

      databaseMethods.createChatRoom(chatRoomId, chatRoomMap);
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
        ConversationScreen()
      ));
    } else {
      print('You Cannot Send Message to Yourself');
    }
  }

  Widget SearchTile({String userName, String userEmail}) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: simpleTextStyle(Colors.white60, 18)),
              Text(userEmail, style: simpleTextStyle(Colors.white38, 16)),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              createChatRoomAndStartConversation(userName: userName);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Message", style: TextStyle(
                  color: Colors.white
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidgetMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: searchTextEditingController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Search Username...",
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
                      initiateSearch();
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
            searchList(),
          ],
        ),
      ),
    );
  }
  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }
}
