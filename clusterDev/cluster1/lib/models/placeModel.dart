class Place{
  String icon;
  String name;
  String location;
  String rating;
  String vicinity;
  String place_id;

  //Location is nested. Take this into account to extract lat & lng.

  Place(this.icon, this.name, this.location, this.rating, this.vicinity, this.place_id);
}