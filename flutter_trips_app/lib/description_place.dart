import 'package:flutter/material.dart';
import 'button_purple.dart';

class DescriptionPlace extends StatelessWidget{

  String namePlace;
  String descripPlace;
  int stars;

  DescriptionPlace(this.namePlace, this.descripPlace, this.stars);

  @override
  Widget build(BuildContext context) {
    final descriptionPlace= Container(
      //height: 250.0,
      margin: EdgeInsets.only(
          top: 15.0,
          left: 20.0,
          right: 20.0,
      ),

      child: Text(
        descripPlace,
        style: TextStyle(
          fontFamily: "Anton-Regular",
          fontSize: 20.0,
        ),
        textAlign: TextAlign.justify,
      ),
    );

    final star= Container(
      margin: EdgeInsets.only(
          top: 333.0,
          right: 3.0
      ),

      child: Icon(
        Icons.star,
        color: Color(0xFFf2C611),
      ),

    );

    final starBad= Container(
      margin: EdgeInsets.only(
          top: 333.0,
          right: 3.0
      ),

      child: Icon(
        Icons.star_border,
        //color: Colors.grey,
          color: Color(0xFFf2C611),

      ),

    );

    final starHalf= Container(
      margin: EdgeInsets.only(
          top: 333.0,
          right: 3.0
      ),

      child: Icon(
        Icons.star_half,
        //color: Colors.grey,
        color: Color(0xFFf2C611),

      ),

    );

    final title_stars=Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 330.0,
            left: 20.0,
            right: 20.0
          ),

          child: Text(
            namePlace,
            style: TextStyle(
              fontFamily: "Anton-Regular",
              fontSize: 30.0,
              fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,
          ),

        ),

        Row(
          children: <Widget>[
            star,
            star,
            star,
            star,
            starBad
          ],
        ),

      ],
    );

    final content_place = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title_stars,
        descriptionPlace,
        ButtonPurple("Navigate")
      ]
    );

    final scrollView = SingleChildScrollView(
      child: content_place,
      scrollDirection: Axis.vertical,
    );


    return scrollView;
  }
  
}