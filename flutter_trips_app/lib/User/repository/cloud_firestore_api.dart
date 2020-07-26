import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertripsapp/User/model/user.dart';

class CloudFirestoreAPI{
  final String USERS="users";
  final String PLACE="places";

  final Firestore _db = Firestore.instance;

  void updateUserData(User user) async{
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return ref.setData({
      'uid':user.uid,
      'name':user.name,
      'email':user.email,
      'photo':user.photo,
      'myPlaces':user.myPlaces,
      'myFavoritePlaces':user.myFavoritePlaces,
      'lastSignIn':DateTime.now()
    }, merge:true );
  }

}