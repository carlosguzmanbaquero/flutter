import 'package:flutter/material.dart';
import 'package:fluttertripsapp/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfilePlacesList extends StatelessWidget {

  //Place place = new Place(name: 'El gato foto 1', description: 'El Gato del Río es una obra del pintor y escultor Hernando Tejada la cual donó a la ciudad de Cali, Colombia, y que fue instalada en la ribera del río tutelar de la ciudad, en el sector noroeste de la ciudad, conocido como Normandía. Con el paso del tiempo se ha convertido en uno de los monumentos más emblemáticos de la ciudad,1​ junto con la estatua de Sebastián de Belalcázar y el Cerro de Cristo Rey.', urlImage: 'https://upload.wikimedia.org/wikipedia/commons/b/b2/Gato_de_Tejada_Cali.JPG', userOwner: null, likes: 5);
  //Place place2 = new Place(name: 'El gato foto 2', description: 'El Gato del Río es una obra del pintor y escultor Hernando Tejada la cual donó a la ciudad de Cali, Colombia, y que fue instalada en la ribera del río tutelar de la ciudad, en el sector noroeste de la ciudad, conocido como Normandía. Con el paso del tiempo se ha convertido en uno de los monumentos más emblemáticos de la ciudad,1​ junto con la estatua de Sebastián de Belalcázar y el Cerro de Cristo Rey.', urlImage: 'https://www.viviendocali.com/wp-content/uploads/2016/07/gato-de-tejada-cali.jpg', userOwner: null, likes: 3);
  UserBloc userBloc;
  AsyncSnapshot snapshotUsuario;

  ProfilePlacesList(@required this.snapshotUsuario){}

  @override
  Widget build(BuildContext context) {
    userBloc=BlocProvider.of<UserBloc>(context);
    return Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child: StreamBuilder(
        stream: userBloc.myPlacesListStream(snapshotUsuario.data.uid),
        builder: (context, AsyncSnapshot snapshot){
         switch(snapshot.connectionState){
           case ConnectionState.active:
             return Column(
                 children: userBloc.buildMyPlaces(snapshot.data.documents)
             );
           case ConnectionState.waiting:
            return CircularProgressIndicator();
           case ConnectionState.none:
             return CircularProgressIndicator();
           case ConnectionState.done:
             return Column(
               children: userBloc.buildMyPlaces(snapshot.data.documents)
             );
           default:
         }
        }
      ),
    );
  }

  /*
  Column(
        children: <Widget>[
          ProfilePlace(place),
          ProfilePlace(place2),
        ],
      )
   */
}