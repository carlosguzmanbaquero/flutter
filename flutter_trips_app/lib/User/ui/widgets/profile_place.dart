import 'package:flutter/material.dart';
import 'package:fluttertripsapp/Place/model/place.dart';
import 'package:fluttertripsapp/User/ui/widgets/profile_place_info.dart';
import 'package:fluttertripsapp/User/ui/widgets/profile_place.dart';
import 'package:fluttertripsapp/widgets/floating_action_button_green.dart';

class ProfilePlace extends StatelessWidget {

  Place place;

  ProfilePlace(this.place);

  @override
  Widget build(BuildContext context) {

    final cardImage = Container(
      height: 330.0,

      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(this.place.urlImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                blurRadius: 16,
                color: Colors.black26,
                offset: Offset(0, 10)
            )
          ]
      ),
    );

    final cardDetail =  Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 45, right: 45, top: 170, bottom: 30),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                blurRadius: 16,
                color: Colors.black26,
                offset: Offset(0, 10)
            )
          ],
          color: Colors.white
      ),
      child: Stack(
        alignment: Alignment(0.9,1.1) ,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.place.name,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  this.place.description,
                  style: TextStyle(
                      color: Colors.black45
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Likes ${place.likes}',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromRGBO(232, 166, 90, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          FloatingActionButtonGreen(iconData: Icons.favorite_border, onPressed: (){

          }),
        ],
      ),
    );

    return Container(
      child: Stack(
        children: <Widget>[
          cardImage,
          cardDetail
        ],
      ),
    );
  }

}
