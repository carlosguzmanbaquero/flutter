import 'package:flutter/material.dart';
import 'package:fluttertripsapp/Place/ui/widgets/card_image.dart';

class CardImageList extends StatelessWidget {

  double width=300.0;
  double height=350.0;
  double left=20.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(pathImage:"assets/img/elgato1.jpg", iconData: Icons.favorite_border,height: height, width: width, left:left),
          CardImageWithFabIcon(pathImage:"assets/img/elgato2.jpg", iconData: Icons.favorite_border,height: height, width: width, left:left),
          CardImageWithFabIcon(pathImage:"assets/img/elgato3.jpeg", iconData: Icons.favorite_border,height: height, width: width, left:left)
        ],
      ),
    );
  }

}