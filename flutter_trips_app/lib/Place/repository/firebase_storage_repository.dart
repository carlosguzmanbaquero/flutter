import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertripsapp/Place/repository/firebase_storage_api.dart';

class FirebaseStoraRepository{

  final _firebaseStorageApi=FirebaseStorageApi();
  Future<StorageUploadTask> uploadFile(String path, File image)=>
      _firebaseStorageApi.uploadFile(path, image);
}