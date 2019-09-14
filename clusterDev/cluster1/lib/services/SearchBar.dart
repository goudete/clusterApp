import 'package:cluster1/models/Query.dart';
import 'package:flutter/material.dart';

class SearchBar extends SearchDelegate<String>{

  Query userQuery = new Query(query);

  final coffeeshops = [
  "Kumquat",
  "Proud Mary",
  "Local 3",
  "Buna"
  ];

  final recentCoffeeShops = [
    "Local 3",
    "Buna"
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
    IconButton(
      icon: Icon(Icons.clear), 
      onPressed: (){
        query = "";
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      });
  }

  @override
  Widget buildResults(BuildContext context) {
    //take you to google place information
    print(query);
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recentCoffeeShops
    : coffeeshops.where((p) => p.startsWith(query)).toList();
   
    return ListView.builder(
      itemBuilder: (context, index)=>ListTile(
        leading: Icon(Icons.location_on),
        title: Text(suggestionList[index]),
        ),
      itemCount: suggestionList.length,
    );
  }
}