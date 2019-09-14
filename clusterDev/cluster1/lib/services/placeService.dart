import 'package:cluster1/models/placeModel.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cluster1/credentials.dart';
import 'SearchBar.dart';

class PlacesService{
  static final _service = new PlacesService();

  static PlacesService get(){
    return _service;
  }  

  //Pass query from SearchBar here
  //Call Place Search API with query
  //Create Place object with JSON response
  //use lat and lng to Map and then display other details in ListView

  final String searchUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=19.4326,99.1332&key=$PLACES_API_KEY";

  Future<List<Place>> getNearbyPlaces() async{
    
    var response = await http.get(searchUrl, headers:{"Accept":"application/json"});
    var places = <Place>[];
    
    List data = json.decode(response.body)["results"];

    data.forEach((f) => places.add(new Place(f["icon"],f["name"], f["location"], f["rating"], f["vicinity"], f["place_id"])));
  }
}

