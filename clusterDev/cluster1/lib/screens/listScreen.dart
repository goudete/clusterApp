import 'package:flutter/material.dart';
import 'mapScreen.dart';

class listScreen extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('ListScreen'),
        ),
      body: Center(
        child: RaisedButton(
          child: Text('Back to Map'),
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
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
}