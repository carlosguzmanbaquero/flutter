import 'card_image_detail.dart';
import 'gradient_back.dart';
import 'package:flutter/material.dart';

class ProfileTrips extends StatelessWidget {

  String nombre="Carlos Guzman";
  String email="xxxxxx@gmail.com";

  ProfileTrips(this.nombre, this.email);

  @override
  Widget build(BuildContext context) {
    final detailProfile = Padding(
      padding: const EdgeInsets.only(left: 12, top: 85, right: 12),
      child: Row(
        children: <Widget>[
          Container(
            height: 85,
            width: 85,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/img/kartman.jpeg")),
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: nombre+"\n",
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: "Lato")),
              TextSpan(
                  text: email,
                  style: TextStyle(
                      color: Colors.white24, fontSize: 16, fontFamily: "Lato"))
            ])),
          )
        ],
      ),
    );

    final widgetMenu = Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: <Widget>[
          createIconButton(Icons.bookmark_border, mini: true, active: true),
          createIconButton(Icons.card_giftcard, mini: true),
          createIconButton(Icons.add, active: true),
          createIconButton(Icons.mail_outline, mini: true),
          createIconButton(Icons.person, mini: true)
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        GradientBack(
          "Profile"
        ),
        Positioned(
          child: Icon(
            Icons.settings,
            size: 15,
            color: Colors.white38,
          ),
          right: 20,
          top: 45,
        ),
        Column(
          children: <Widget>[detailProfile, widgetMenu],
        ),
        Container(
          margin: EdgeInsets.only(
              top: 250.0,
              left: 20.0
          ),
        child:ListView(
          padding: EdgeInsets.all(25.0),
              children: <Widget>[
                CardImageDetail(
                    "El gato foto 1",
                    "El Gato del Río es una obra del pintor y escultor Hernando Tejada la cual donó a la ciudad de Cali, Colombia, y que fue instalada en la ribera del río tutelar de la ciudad, en el sector noroeste de la ciudad, conocido como Normandía. Con el paso del tiempo se ha convertido en uno de los monumentos más emblemáticos de la ciudad,1​ junto con la estatua de Sebastián de Belalcázar y el Cerro de Cristo Rey.",
                    "assets/img/elgato1.jpg",
                    13000),
                CardImageDetail(
                    "El gato foto 2",
                    "El Gato del Río es una obra del pintor y escultor Hernando Tejada la cual donó a la ciudad de Cali, Colombia, y que fue instalada en la ribera del río tutelar de la ciudad, en el sector noroeste de la ciudad, conocido como Normandía. Con el paso del tiempo se ha convertido en uno de los monumentos más emblemáticos de la ciudad,1​ junto con la estatua de Sebastián de Belalcázar y el Cerro de Cristo Rey.",
                    "assets/img/elgato2.jpg",
                    13000),
              ],
            ),

        ),
      ],
    );
  }

  Widget createIconButton(IconData iconData,
      {bool mini = false, bool active = false}) {
    return Expanded(
      flex: 1,
      child: Container(
        height: mini ? 35 : 60,
        width: mini ? 35 : 60,
        child: Center(
          child: Icon(
            iconData,
            color: Color(0xFF584CD1),
            size: mini ? 20 : 50,
          ),
        ),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active ? Colors.white : Colors.white54),
      ),
    );
  }
}