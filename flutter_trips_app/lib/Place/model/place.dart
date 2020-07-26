import 'package:flutter/material.dart';
import 'package:fluttertripsapp/User/model/user.dart';

class Place {
  String id;
  final String name;
  final String description;
  final String urlImage;
  final int likes;
  final User userOwner;

  Place({
    Key key,
    //@required this.id,
    @required this.name,
    @required this.description,
    @required this.urlImage,
    this.likes,
    @required this.userOwner});
}