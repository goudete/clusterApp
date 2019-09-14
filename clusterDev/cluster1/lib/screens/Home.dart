import 'package:cluster1/screens/listScreen.dart';
import 'package:cluster1/services/SearchBar.dart';
import 'package:flutter/material.dart';
import 'mapScreen.dart';

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
          IconButton(icon: Icon(Icons.search), onPressed: () {
            showSearch(context: context, delegate: SearchBar());
          },)
        ],
        backgroundColor: Colors.orange,
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
