import 'package:flutter/material.dart';
import 'package:fluttertripsapp/User/ui/screens/profile_header.dart';
import 'package:fluttertripsapp/User/ui/widgets/profile_places_list.dart';
import 'package:fluttertripsapp/User/ui/widgets/profile_background.dart';
import 'package:fluttertripsapp/widgets/gradient_back.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*return Container(
      color: Colors.indigo,
    );*/
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
  }

}