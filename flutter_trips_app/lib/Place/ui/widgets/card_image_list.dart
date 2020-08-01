import 'package:flutter/material.dart';
import 'package:fluttertripsapp/Place/ui/widgets/card_image.dart';
import 'package:fluttertripsapp/User/bloc/bloc_user.dart';
import 'package:fluttertripsapp/User/model/user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class CardImageList extends StatelessWidget {

  double height=350.0;
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc= BlocProvider.of<UserBloc>(context);

    return Container(
      height: height,
      child: StreamBuilder(
        stream: userBloc.placesStream,
        builder: (context, AsyncSnapshot snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.active:
              return showCardImage(userBloc.buildPlaces(snapshot.data.documents));
            case ConnectionState.done:
              return showCardImage(userBloc.buildPlaces(snapshot.data.documents));
          }
        }
      )

    );
  }

  Widget showCardImage(List<CardImageWithFabIcon> placesCard){
    return ListView(
      padding: EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: placesCard,
    );
  }

}