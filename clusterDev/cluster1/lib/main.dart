import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;

    void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final LatLng _center = const LatLng(19.4326, -99.1332);
  List<Marker> allMarkers = [];
  int _selectedIndex = 0;
  static const TextStyle optionStyle = 
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Map',
      style: optionStyle,
    ),
    Text(
      'Index 1: List',
      style: optionStyle,
    )
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex;
    });
  }

  @override
  void initState(){
    super.initState();
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

  // Widget _dialogueBuilder(BuildContext context, Marker marker){
  //   return SimpleDialog(children: [Container(width: 80.0, height: 80.0)]);
  // }

  // Widget _listItemBuilder(BuildContext context, int index){
  //   return new GestureDetector(
  //     onTap: () => showDialog(
  //       context: context,
  //       builder: (context) => _dialogueBuilder(context, allMarkers[index])),
  //     child: Container(
  //       padding: const EdgeInsets.only(left: 16.0),
  //       alignment: Alignment.centerLeft,
  //       child: Text(allMarkers[index].markerId.value,
  //         style: Theme.of(context).textTheme.headline),
  //       ),
  //     );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('cluster'),
          backgroundColor: Colors.green[700],
        ),
        // body: ListView.builder(
        //   itemCount: allMarkers.length,
        //   itemExtent: 60.0,
        //   itemBuilder: _listItemBuilder
        // ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: Set.from(allMarkers)
        ),
        bottomNavigationBar: BottomNavigationBar(
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
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
          ),
      ),
    );
  }
}