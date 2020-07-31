import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertripsapp/Place/model/place.dart';
import 'package:fluttertripsapp/User/model/user.dart';
import 'package:fluttertripsapp/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository{
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user){
    _cloudFirestoreAPI.updateUserData(user);
  }

  Future <void> updatePlaceData(Place place) => _cloudFirestoreAPI.updatePlaceData(place);
}