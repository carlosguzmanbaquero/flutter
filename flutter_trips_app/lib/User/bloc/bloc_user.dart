import 'package:fluttertripsapp/User/model/user.dart';
import 'package:fluttertripsapp/User/repository/cloud_firestore_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:fluttertripsapp/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();
  Stream<FirebaseUser> streamFirebase= FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

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

  signOut(){
  _auth_repository.signOut();
  }

  @override
  void dispose() {
    
  }

}