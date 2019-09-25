import 'package:cluster1/services/placeService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:cluster1/credentials.dart';
import 'package:google_maps_webservice/places.dart';


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
      body: Container( 
        alignment: Alignment.center,
      )
    );
  }
}

