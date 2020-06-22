import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 328.0,
        child: ListView(
          padding: EdgeInsets.all(25.0),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            CardImage("assets/img/elgato1.jpg"),
            CardImage("assets/img/elgato2.jpg"),
            CardImage("assets/img/elgato3.jpeg"),
          ],
        ),
    );
  }

}