import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertripsapp/Place/model/place.dart';
import 'package:fluttertripsapp/Place/ui/widgets/card_image.dart';
import 'package:fluttertripsapp/Place/ui/widgets/tittle_input_location.dart';
import 'package:fluttertripsapp/User/bloc/bloc_user.dart';
import 'package:fluttertripsapp/User/model/user.dart';
import 'package:fluttertripsapp/widgets/button_purple.dart';
import 'package:fluttertripsapp/widgets/gradient_back.dart';
import 'package:fluttertripsapp/widgets/text_input.dart';
import 'package:fluttertripsapp/widgets/tittle_header.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class AddPlaceScreen extends StatefulWidget {

  File image;

  AddPlaceScreen({Key key, this.image});

  @override
  State createState() {
    return _addPlaceScreen();
  }
}

class _addPlaceScreen extends State<AddPlaceScreen>{
  final _controllerTitlePlace = TextEditingController();
  final _controllerDescriptionPlace = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidht = MediaQuery.of(context).size.width;
    UserBloc userBloc=BlocProvider.of<UserBloc>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: 300.0),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0,left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left, color: Colors.white,size: 45,),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Flexible(
                child:Container(
                  width: screenWidht,
                  padding: EdgeInsets.only(top: 45.0,left: 20.0, right: 10.0),
                  child: TitleHeader(title:"Agregar un nuevo lugar"),
                ),
              ),

            ],
          ),

          Container(
            margin: EdgeInsets.only(top: 100.0, bottom: 20.0),
            child: ListView(
              children: <Widget>[
                //foto
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    pathImage: widget.image.path,
                    iconData: Icons.camera_alt,
                    height: 250.0,
                    width: 350.0,
                    left: 0,
                  ),
                ),
                //titulo
                Container(
                  margin: EdgeInsets.only(top:20.0, bottom: 20.0),
                  child: TextInput(
                    hintText: 'Titulo',
                    inputType: null,
                    maxLines: 1,
                    controller: _controllerTitlePlace,
                  ),
                ),
                //descripcion
                TextInput(
                  hintText: "Descripción",
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: _controllerDescriptionPlace,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(hintText: 'Agregar ubicación',
                  iconData: Icons.location_on),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: 'Agregar lugar',
                    onPressed: (){
                      userBloc.currentUser.then((FirebaseUser user){
                        if(user != null){
                          //sube arvhivos a firebase storage
                          String uid=user.uid;
                          String path="$uid/${DateTime.now().toString()}.jpg";
                          userBloc.uploadFile(path, widget.image).then((storageUploadTask){
                            storageUploadTask.onComplete.then((snapshot) {
                              snapshot.ref.getDownloadURL().then((urlImage){
                                print("URL_IMAGE: $urlImage");
                                //agrega registro en firestore
                                userBloc.updatePlaceData(Place(
                                  name:_controllerTitlePlace.text,
                                  description: _controllerDescriptionPlace.text,
                                  likes: 0,
                                  urlImage: urlImage
                                )).whenComplete((){
                                  print("Agrego nuevo lugar con exito");
                                  Navigator.pop(context);
                                });

                              });
                            });
                          });
                        }
                      });

                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
