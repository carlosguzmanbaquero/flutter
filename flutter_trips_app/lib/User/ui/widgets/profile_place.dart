import 'package:flutter/material.dart';
import 'package:fluttertripsapp/Place/model/place.dart';
import 'package:fluttertripsapp/User/ui/widgets/profile_place_info.dart';
import 'package:fluttertripsapp/User/ui/widgets/profile_place.dart';

class ProfilePlace extends StatelessWidget {

  String image;
  Place place;

  ProfilePlace(this.image, this.place);

  @override
  Widget build(BuildContext context) {

    final cardImage = Container(
      height: 330.0,

      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(this.image),
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
                  this.place.where,
                  style: TextStyle(
                      color: Colors.black45
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Steps ${place.steps}',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromRGBO(232, 166, 90, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          FloatingActionButton(
              onPressed: null,
              mini: true,
              child: Icon(Icons.favorite),
              backgroundColor: Color.fromRGBO(102, 216, 105, 1)
          )
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