import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget{
  final String title;

  TitleHeader({Key key, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontFamily: 'Anton-Regular',
        fontWeight: FontWeight.bold,
      ),
    );

  }
}