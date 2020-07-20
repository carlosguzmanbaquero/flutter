import 'package:flutter/material.dart';

class Review extends StatelessWidget {

  String pathImage="asset/img/kartman.jpeg";
  String name="Carlos Guzman";
  String details= "1 review 5 fotos";
  String comment="Buen sitio para pasar en familia";

  Review(this.pathImage, this.name, this.details, this.comment);

  @override
  Widget build(BuildContext context) {

    final star= Container(
      margin: EdgeInsets.only(
          right: 2.0
      ),

      child: Icon(
        Icons.star,
        color: Color(0xFFf2C611),
      ),

    );

    final starBad= Container(
      margin: EdgeInsets.only(
          right: 2.0
      ),

      child: Icon(
        Icons.star_border,
        //color: Colors.grey,
        color: Color(0xFFf2C611),

      ),

    );

    final starHalf= Container(
      margin: EdgeInsets.only(
          right: 2.0
      ),

      child: Icon(
        Icons.star_half,
        //color: Colors.grey,
        color: Color(0xFFf2C611),

      ),

    );

    final photo=Container(
      margin: EdgeInsets.only(
          top: 20.0,
          left: 20.0
      ),

      width: 80.0,
      height: 80.0,

      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image:AssetImage(pathImage)
          )
      ),
    );

    final userName=Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Anton-Regular",
            fontSize: 13.0
        ),
      ),
    );

    final userInfo=Container(
      margin: EdgeInsets.only(
          left: 20.0,
          right: 8.0
      ),
      child: Text(
        details,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Anton-Regular",
            fontSize: 13.0,
            color: Color(0xFFa3a5a7)
        ),
      ),
    );

    final userComment=Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Anton-Regular",
            fontSize: 13.0,
            fontWeight:  FontWeight.w900
        ),
      ),
    );

    final userInfoComplete= Row(
      children: <Widget>[
        userInfo,
        star,
        star,
        star,
        star,
        starBad
      ],
    );


    final userDetails=Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userInfoComplete,
        userComment

      ],
    );

    return Row(
      children: <Widget>[
        photo,
        userDetails
      ],
    );
  }

}