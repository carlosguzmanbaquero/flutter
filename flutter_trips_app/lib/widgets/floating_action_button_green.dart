import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {

  final IconData iconData;
  final VoidCallback onPressed;

  FloatingActionButtonGreen({
    Key key,
    @required this.iconData,
    @required this.onPressed
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }

}


class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen>{

  bool toogle = false;

  void onPressedFav(){

    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(!toogle?"Sitio agregado a favoritos":"Sitio eliminado de favoritos"),
        )
    );

    setState(() {
      toogle=!toogle;
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: widget.onPressed,
      child:
      Icon(widget.iconData)
      /*Icon(!toogle?
      Icons.favorite_border:Icons.favorite
      )*/,
      heroTag: null,
    );
  }

}