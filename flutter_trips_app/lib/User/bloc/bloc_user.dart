import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertripsapp/Place/model/place.dart';
import 'package:fluttertripsapp/Place/repository/firebase_storage_repository.dart';
import 'package:fluttertripsapp/Place/ui/widgets/card_image.dart';
import 'package:fluttertripsapp/User/model/user.dart';
import 'package:fluttertripsapp/User/repository/cloud_firestore_api.dart';
import 'package:fluttertripsapp/User/repository/cloud_firestore_repository.dart';
import 'package:fluttertripsapp/User/ui/widgets/profile_place.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:fluttertripsapp/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();
  Stream<FirebaseUser> streamFirebase= FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();
  Stream<QuerySnapshot> placesListStream= Firestore.instance.collection(CloudFirestoreAPI().PLACES).snapshots();
  Stream<QuerySnapshot> get placesStream => placesListStream;
  List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot)=>_cloudFirestoreRepository.buildPlaces(placesListSnapshot);

  Stream<QuerySnapshot> myPlacesListStream(String uid) =>
      Firestore.instance.collection(CloudFirestoreAPI().PLACES)
      .where("userOwner", isEqualTo: Firestore.instance.document("${CloudFirestoreAPI().USERS}/${uid}"))
          .snapshots();
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot)=>_cloudFirestoreRepository.buildMyPlaces(placesListSnapshot);
  //casos de uso
  //1. loguearse con google
  Future<FirebaseUser> signIn(){
    return _auth_repository.signInFireBase();
  }

  //2. registrar usuario
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user){
    _cloudFirestoreRepository.updateUserDataFirestore(user);
  }

  Future <void> updatePlaceData(Place place){
    return _cloudFirestoreRepository.updatePlaceData(place);
  }

  signOut(){
  _auth_repository.signOut();
  }



  final _firebaseStorageRepository= FirebaseStoraRepository();
  Future<StorageUploadTask> uploadFile(String path, File image)=>
      _firebaseStorageRepository.uploadFile(path, image);



  @override
  void dispose() {
    
  }

}