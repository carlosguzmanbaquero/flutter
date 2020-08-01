import 'package:flutter/material.dart';
import 'package:fluttertripsapp/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'Place/ui/screens/home_trips.dart';
import 'Place/ui/screens/search_trips.dart';
import 'User/ui/screens/profile_trips.dart';

class FlutterTrips extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FlutterTrips();
  }
}

class _FlutterTrips extends State<FlutterTrips>{

  int indexTab=0;
  final List<Widget> widgetsChildren = [
    BlocProvider <UserBloc>(child: HomeTrips(), bloc: UserBloc()),
    SearchTrips(),
    BlocProvider <UserBloc>(child: ProfileTrips(), bloc: UserBloc())
  ];

  void onTapTapped(int index){
    setState(() {
      indexTab=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: widgetsChildren[indexTab],

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.purple
        ),
        child: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: indexTab,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(""),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text(""),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(""),
            )

          ],
        ),
      ),
    );
  }

}