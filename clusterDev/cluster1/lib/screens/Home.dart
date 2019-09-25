import 'package:cluster1/screens/listScreen.dart';
import 'package:flutter/material.dart';
import 'mapScreen.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:cluster1/credentials.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:cluster1/services/placeService.dart';
import 'package:cluster1/models/placeModel.dart';


class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  int _currentIndex = 0;
  final List<Widget> _children = [
    MapScreen(),
    ListScreen()
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('cluster'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () async {
            Prediction p = await PlacesAutocomplete.show(
              context: context, apiKey: PLACES_API_KEY, mode: Mode.overlay);
            await PlacesService.get().displayPrediction(p);
          },)
        ],
        backgroundColor: Colors.lightBlue,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text('Map'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('List')
            ),
          ],
      ),
    );
  }

  
  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}
