import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertripsapp/User/repository/Firebase_auth_api.dart';

class AuthRepository{
  final _firebaseAuthAPI = FirebaseAuthAPI();
  Future <FirebaseUser> signInFireBase() => _firebaseAuthAPI.signIn();
  
  signOut(){
    _firebaseAuthAPI.signOut();
  }

}