class Place{
  String location;
  String icon;
  String name;
  String vicinity;
  String place_id;

  //Location is nested. Take this into account to extract lat & lng.

  Place(this.location, this.icon, this.name, this.vicinity, this.place_id);
}