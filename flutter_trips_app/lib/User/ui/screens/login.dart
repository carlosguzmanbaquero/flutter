import 'package:flutter/material.dart';
import 'package:fluttertripsapp/User/model/user.dart';
import 'package:fluttertripsapp/widgets/button_green.dart';
import 'package:fluttertripsapp/widgets/gradient_back.dart';
import 'package:fluttertripsapp/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:fluttertripsapp/flutter_trips.dart';
import 'package:fluttertripsapp/flutter_trips_cupertino.dart';

class Login extends StatefulWidget {
  
  @override
  State createState(){
    return _Login();
  }
}

class _Login extends State<Login> {

  UserBloc userBloc;
  double screenWidht;

  @override
  Widget build(BuildContext context) {
    screenWidht = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession(){
   return StreamBuilder(
     stream: userBloc.authStatus,
     builder: (BuildContext context, AsyncSnapshot snapshot){
       if(!snapshot.hasData || snapshot.hasError){
         return signInGoogleUI();
       }else{
         //return FlutterTrips();
          return FlutterTripsCupertino();
       }
     },
   ); 
  }
  

  Widget signInGoogleUI(){

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(height:null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                  ),
                  width: screenWidht,
                  child: Text("Bienvenido a tu aplicación turistica",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: "Anton-Regular",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              ButtonGreen(text: "Login con Gmail", 
                onPressed: (){
                  userBloc.signOut();
                  userBloc.signIn().then((value) {
                    print("usuario logueado ${value.displayName}");
                    userBloc.updateUserData(User(
                        uid:value.uid,
                        name:value.displayName,
                        email:value.email,
                        photo:value.photoUrl
                    ));
                  });
                },
                width: 300.0,
                height: 50.0,
              )

            ],
          )
        ],
      ),
    );
  }
} 