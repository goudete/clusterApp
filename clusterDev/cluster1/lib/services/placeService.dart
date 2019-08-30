import 'package:cluster1/models/placeModel.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cluster1/credentials.dart';

class PlacesService{
  static final _service = new PlacesService();

  static PlacesService get(){
    return _service;
  }  

  //Currently using Nearby Search API
  //Need to change to Place Search API, store Place details using Place class and use lat and lng to Map and then display other details in ListView
  //To use Place Search, need to create SearchBar to store input and run through API.

  final String searchUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=34.087586,-118.206514&radius=500&fields=formatted_address,geometry,icon,name&key=$PLACES_API_KEY";

  Future<List<Place>> getNearbyPlaces() async{
    
    var response = await http.get(searchUrl, headers:{"Accept":"application/json"});
    var places = <Place>[];
    
    List data = json.decode(response.body)["results"];

    data.forEach((f) => places.add(new Place(f["location"],f["icon"], f["name"], f["vicinity"], f["place_id"])));
  }
}

