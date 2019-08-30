import 'package:cluster1/models/PlaceModel.dart';
import 'package:cluster1/models/placeModel.dart';
import 'package:cluster1/services/placeService.dart';
import 'package:flutter/material.dart';


class ListScreen extends StatefulWidget{
@override
State<StatefulWidget> createState() {
    return new ListScreenState();
  }
}

class ListScreenState extends State<ListScreen>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: _createContent(),
    );
  }

  Widget _createContent(){
    if(_places == null){
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }

    else{
      return new ListView(
        children: _places.map((f){
          return new Card( child:
            new ListTile(
            title: new Text(f.location),
            leading: new Image.network(f.icon),
            subtitle: new Text(f.vicinity),
          ));
        }).toList(),
      );
    }
  }

List _places;
  @override void initState(){
    super.initState();

    PlacesService.get().getNearbyPlaces().then((data) async {
      
      this.setState((){
        _places = data;
      });
    });
  }
}