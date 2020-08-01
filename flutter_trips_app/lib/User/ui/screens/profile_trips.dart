import 'package:flutter/material.dart';
import 'package:fluttertripsapp/User/bloc/bloc_user.dart';
import 'package:fluttertripsapp/User/model/user.dart';
import 'package:fluttertripsapp/User/ui/screens/profile_header.dart';
import 'package:fluttertripsapp/User/ui/widgets/profile_places_list.dart';
import 'package:fluttertripsapp/User/ui/widgets/profile_background.dart';
import 'package:fluttertripsapp/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfileTrips extends StatelessWidget {

  UserBloc userBloc;
  User user;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
        }
      },
    );
/*
    return Stack(
      children: <Widget>[
        //ProfileBackground(),
        GradientBack(height:250.0),
        ListView(
          children: <Widget>[
            ProfileHeader(),
            ProfilePlacesList()

          ],
        ),
      ],
    );

 */
  }

  Widget showProfileData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      print("No logueado");
      return Container(
        margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 50.0
        ),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("Por favor loguearse")
          ],
        ),
      );
    }else {
      print("No logueado");
      return Stack(
        children: <Widget>[
          //ProfileBackground(),
          GradientBack(height: 250.0),
          ListView(
            children: <Widget>[
              ProfileHeader(snapshot),
              ProfilePlacesList(snapshot)
            ],
          ),
        ],
      );
    }
  }

}