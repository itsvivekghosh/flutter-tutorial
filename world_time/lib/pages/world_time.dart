// import "package:flutter/material.dart";
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; // location of the UI
  String time; // time in that location
  String flag; // url-asset of any country flag icon
  String url; // location URL for api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    // Making a request
    Response r = await get("http://worldtimeapi.org/api/timezone/$url");
    Map data = jsonDecode(r.body);

    // get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    // create a datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    // set time property
    time = now.toString();
  }
}
