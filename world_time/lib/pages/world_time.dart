// import "package:flutter/material.dart";
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location of the UI
  String time; // time in that location
  String flag; // url-asset of any country flag icon
  String url; // location URL for api endpoint
  bool isDayTime; // true if daytime and false, if not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // Making a request
      Response r = await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(r.body);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create a datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      if (data['utc_offset'].substring(4, 6) != '00') {
        offset = data['utc_offset'].substring(4, 6);
        now = now.add(Duration(minutes: int.parse(offset)));
      }
      // set time property
      time = DateFormat.jm().format(now);
      dynamic cond = now.hour > 6 && now.hour < 20;
      isDayTime = cond ? true : false;
    } catch (e) {
      time = 'Could not fetch Time.. Please try to update the correct URL';
    }
  }
}
