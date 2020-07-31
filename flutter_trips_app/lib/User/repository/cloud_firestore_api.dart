import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertripsapp/Place/model/place.dart';
import 'package:fluttertripsapp/User/model/user.dart';

class CloudFirestoreAPI{
  final String USERS="users";
  final String PLACES="places";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async{
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return await ref.setData({
      'uid':user.uid,
      'name':user.name,
      'email':user.email,
      'photo':user.photo,
      'myPlaces':user.myPlaces,
      'myFavoritePlaces':user.myFavoritePlaces,
      'lastSignIn':DateTime.now()
    }, merge:true );
  }

  Future <void> updatePlaceData(Place place) async{
    CollectionReference refPlaces = _db.collection(PLACES);
    FirebaseUser user  = await _auth.currentUser();
    DocumentReference _userRef = _db.collection(this.USERS).document(user.uid);

    await _auth.currentUser().then((FirebaseUser user){
      refPlaces.add({
          'name': place.name,
          'description': place.description,
          'likes': place.likes,
          'userOwner': _userRef//"${USERS}/${user.uid}"
      });
    });


  }

}