import 'package:flutter/material.dart';
import 'description_place.dart';
import 'review_list.dart';
import 'header_appbar.dart';

class HomeTrips extends StatelessWidget{

  String namePlace="El gato";
  String descriptionPlace="El Gato del Río es una obra del pintor y escultor Hernando Tejada la cual donó a la ciudad de Cali, Colombia, y que fue instalada en la ribera del río tutelar de la ciudad, en el sector noroeste de la ciudad, conocido como Normandía. Con el paso del tiempo se ha convertido en uno de los monumentos más emblemáticos de la ciudad,1​ junto con la estatua de Sebastián de Belalcázar y el Cerro de Cristo Rey.";
  int stars=4;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            new DescriptionPlace(namePlace, descriptionPlace, stars),
            new ReviewList(),
          ],
        ),
        HeaderAppbar(),
      ],
    );
  }

}