import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertripsapp/widgets/floating_action_button_green.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class  CardImageWithFabIcon extends StatelessWidget {

  final double height;
  final double width;
  double left;
  final String pathImage;
  final VoidCallback onPressedFabIcon;
  final IconData iconData;
  bool internet = true;

  CardImageWithFabIcon({
    Key key,
    @required this.height,
    @required this.width,
    @required this.pathImage,
    @required this.iconData,
    @required this.onPressedFabIcon,
    this.left,
    this.internet
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        left: left

      ),

      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
            //image: AssetImage(pathImage)
            image: pathImage.contains('assets')?
            AssetImage(pathImage):pathImage.contains('http')?
            NetworkImage(pathImage): new FileImage(new File(pathImage))
            //image: internet?CachedNetworkImageProvider(pathImage):AssetImage(pathImage)
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow (
            color:  Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]

      ),
    );

    return Stack(
      alignment: Alignment(0.9,1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(iconData: iconData, onPressed: onPressedFabIcon)
      ],
    );
  }

}