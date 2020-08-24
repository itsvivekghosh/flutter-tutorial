import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUsersByUsername(String username) async {
    return await Firestore.instance.collection('users')
        .where('name', isEqualTo: username)
        .getDocuments();
  }

  uploadUserInfo(userMap) {
    Firestore.instance.collection('users')
        .add(userMap).catchError((onError) {
          print(onError.toString());
        },
      );
  }
}