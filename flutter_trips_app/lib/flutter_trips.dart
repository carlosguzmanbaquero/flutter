import 'package:flutter/material.dart';
import 'home_trips.dart';
import 'search_trips.dart';
import 'profile_trips.dart';

class FluetterTrips extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FluetterTrips();
  }
}

class _FluetterTrips extends State<FluetterTrips>{

  int indexTab=0;
  final List<Widget> widgetsChildren = [
    HomeTrips(),
    SearchTrips(),
    ProfileTrips("Carlos Guzman", "xxxxxx@gmail.com")
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