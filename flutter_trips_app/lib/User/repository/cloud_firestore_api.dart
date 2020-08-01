import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertripsapp/Place/model/place.dart';
import 'package:fluttertripsapp/Place/ui/widgets/card_image.dart';
import 'package:fluttertripsapp/User/model/user.dart';
import 'package:fluttertripsapp/User/ui/widgets/profile_place.dart';

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
    //referencia del usuario
    //_db.document("${USERS}/${user.uid}");
    await _auth.currentUser().then((FirebaseUser user){
      refPlaces.add({
          'name': place.name,
          'description': place.description,
          'likes': place.likes,
          'userOwner': _userRef,//"${USERS}/${user.uid}"
          'urlImage': place.urlImage
      }).then((documentReference) {
        documentReference.get().then((snapshot){
          //id del lugar que se acaba de guardar
          // snapshot.documentID
          _userRef.updateData({
            'myPlaces': FieldValue.arrayUnion([_db.document("${PLACES}/${snapshot.documentID}")])
          });
        });
      });
    });
  }

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot){
    List<ProfilePlace> profilePlaces = List<ProfilePlace>();
    placesListSnapshot.forEach((element) {
      profilePlaces.add(ProfilePlace(
        Place(
          name: element.data['name'],
          description: element.data['description'],
          urlImage: element.data['urlImage'],
          likes: element.data['likes'])
      ));
    });

    return profilePlaces;
  }

  List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot){
    List<CardImageWithFabIcon> cardImageWithFabIcon = List<CardImageWithFabIcon>();
    double width=300.0;
    double height=350.0;
    double left=20.0;
    placesListSnapshot.forEach((element) {
      cardImageWithFabIcon.add(CardImageWithFabIcon(
          pathImage:element.data["urlImage"],
          iconData: Icons.favorite_border,
          height: height,
          width: width,
          left:left,
          onPressedFabIcon:(){
            likePlace(element.documentID);
          }),
      );
    });
    return cardImageWithFabIcon;
  }

  Future likePlace(String idPlace) async{
    await _db.collection(PLACES).document(idPlace).get()
        .then((value){
       int likes= value.data["likes"];
       _db.collection(PLACES).document(idPlace)
        .updateData({
         'likes':likes+1
       });
    });
  }

}