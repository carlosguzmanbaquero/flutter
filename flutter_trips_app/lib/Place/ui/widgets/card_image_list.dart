import 'package:flutter/material.dart';
import 'package:fluttertripsapp/Place/ui/widgets/card_image.dart';

class CardImageList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(pathImage:"assets/img/elgato1.jpg", iconData: Icons.favorite_border,height: 350.0, width: 350.0),
          CardImageWithFabIcon(pathImage:"assets/img/elgato2.jpg", iconData: Icons.favorite_border,height: 350.0, width: 350.0),
          CardImageWithFabIcon(pathImage:"assets/img/elgato3.jpeg", iconData: Icons.favorite_border,height: 350.0, width: 350.0)
        ],
      ),
    );
  }

}