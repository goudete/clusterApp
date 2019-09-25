import 'dart:async';
import 'package:cluster1/credentials.dart';
import 'package:cluster1/models/placeModel.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';

GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: PLACES_API_KEY);
//PlaceStorage allPlaces = new PlaceStorage();
List<Place> userPlaces = new List<Place>();

class PlacesService{
  static final _service = new PlacesService();

  static PlacesService get(){
    return _service;
  }  

  Future<Null> displayPrediction(Prediction p) async{
    if(p != null){
      PlacesDetailsResponse detail =
      await _places.getDetailsByPlaceId(p.placeId);

      String name = detail.result.name;
      String placeId = p.placeId;
      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;

      Place location = new Place(name, placeId, lat, lng);
      userPlaces.add(location);
      print("paceId: " + placeId);
      print("lat: " + lat.toString());
      print("lng: " + lng.toString());
      print("userPlaces length: " + userPlaces.length.toString());
    }
  }
}