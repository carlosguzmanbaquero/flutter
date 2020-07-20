import 'package:flutter/material.dart';
import 'package:fluttertripsapp/Place/ui/widgets/review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Review("assets/img/kartman.jpeg", "Carlos Guzman", "1 review 5 fotos", "Buen sitio para pasar en familia"),
        new Review("assets/img/kartman.jpeg", "Alberto Baquero", "2 review 2 fotos", "Buen lugar para pasear mi perro"),

      ],
    );
  }

}