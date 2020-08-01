import 'package:flutter/material.dart';
import 'package:fluttertripsapp/User/model/user.dart';

class Place {
  String id;
  final String name;
  final String description;
  final String urlImage;
  int likes;
  bool liked;
  //final User userOwner;

  Place({
    Key key,
    //@required this.id,
    @required this.name,
    @required this.description,
    @required this.urlImage,
    this.likes,
    this.liked,
    this.id
    /*@required this.userOwner*/});
}