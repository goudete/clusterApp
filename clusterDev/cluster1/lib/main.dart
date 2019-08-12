import 'package:flutter/material.dart';
import 'screens/Home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Home(),
    );
  }
}