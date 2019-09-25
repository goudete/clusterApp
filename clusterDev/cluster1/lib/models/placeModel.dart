class Place{
  String name;
  String place_id;
  double lat;
  double lng;
  
 Place(this.name, this.place_id, this.lat, this.lng);

}

class PlaceStorage{
  PlaceStorage({this.places});

  List<Place> places = new List<Place>();
  
  List<Place> getplaces(){
    return this.places;
  }

  Future addPlace(Place p){
    this.places.add(p);
  }
}