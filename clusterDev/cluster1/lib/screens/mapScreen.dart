import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cluster1/main.dart';
import 'listScreen.dart';


class mapScreen extends StatelessWidget{
  
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final LatLng _center = const LatLng(19.4326, -99.1332);

  List<Marker> allMarkers = [];
  
  @override
  void initState(){
    // super.initState();
    allMarkers.add(Marker(
      markerId: MarkerId('GlorietaCibeles'),
      draggable: false,
      onTap: (){
        print('Glorieta');
      },
      position: LatLng(19.423697, -99.163113)
      ));
    allMarkers.add(Marker(
      markerId: MarkerId('Buna'),
      draggable: false,
      onTap: (){
        print('Buna');
      },
      position: LatLng(19.422177, -99.160513)
      ));
    allMarkers.add(Marker(
      markerId: MarkerId('Blom'),
      draggable: false,
      onTap: (){
        print('Blom');
      },
      position: LatLng(19.42847, -99.12766)
      ));
    allMarkers.add(Marker(
      markerId: MarkerId('Almanegra'),
      draggable: false,
      onTap: (){
        print('Almanegra');
      },
      position: LatLng(19.385197, -99.155231)
      ));
    allMarkers.add(Marker(
      markerId: MarkerId('local3'),
      draggable: false,
      onTap: (){
        print('local3');
      },
      position: LatLng(19.358267, -99.269344)
      ));
  }
  
  @override
  Widget build(BuildContext context){
   return Scaffold(
        appBar: AppBar(
          title: const Text('cluster'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: Set.from(allMarkers)
        ),
    );
  }
}