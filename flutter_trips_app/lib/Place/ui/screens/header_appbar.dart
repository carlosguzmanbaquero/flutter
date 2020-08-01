import 'package:flutter/material.dart';
import 'package:fluttertripsapp/User/bloc/bloc_user.dart';
import 'package:fluttertripsapp/User/model/user.dart';
import 'package:fluttertripsapp/widgets/gradient_back.dart';
import 'package:fluttertripsapp/Place/ui/widgets/card_image_list.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    UserBloc userBloc;
    userBloc = BlocProvider.of(context);
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator(),);
          case ConnectionState.none:
            return Center(child: CircularProgressIndicator(),);
          case ConnectionState.active:
            return showPlacesData(snapshot);
          case ConnectionState.done:
            return showPlacesData(snapshot);
          default:
            return showPlacesData(snapshot);
        }
      },
    );

      /*Stack(
      children: <Widget>[
        GradientBack(height:250.0),
        CardImageList()
      ],
    );*/
  }

  Widget showPlacesData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      return Stack(
        children: [
          GradientBack(height: 250.0),
          Text("Usuario no logeado. Haz Login")
        ],
      );
    } else {
      User user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photo: snapshot.data.photoUrl
      );

      return Stack(
        children: [
          GradientBack(height: 250.0),
          CardImageList(user)
        ],
      );
    }
  }

}