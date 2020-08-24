import 'package:ConnectMe/services/database.dart';
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

  initiateSearch() {
    databaseMethods.getUsersByUsername(searchTextEditingController.text)
        .then((val) {
          print(val);
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
}

class SearchTile extends StatelessWidget {

  final String userName, userEmail;
  SearchTile({this.userName, this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(userName, style: simpleTextStyle(Colors.white54, 14)),
              Text(userEmail, style: simpleTextStyle(Colors.white10, 10)),
            ],
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text("Message", style: TextStyle(),),
          ),
        ],
      ),
    );
  }
}
