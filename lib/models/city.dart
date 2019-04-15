class City{
  int _id;
  String _name;
  String _country;
  Coordinate _coord;

  City.map(dynamic obj){
    this._id = obj["id"];
    this._name = obj["name"];
    this._country = obj["country"];
    this._coord = Coordinate.map(obj["coord"]);
    
  }

  int get id => _id;
  String get name => _name;
  String get country => _country;
  Coordinate get coord => _coord;

  Map<dynamic, dynamic> toMap() {
      var map = new Map<dynamic, dynamic>();
      map["id"] = id;
      map["name"] = _name;
      map["country"] = _country;
      map["coord"] = _coord;

      if (_id != null) {
         map["id"] = _id;
      }

      return map;
  }

}

class Coordinate {
  double _latitude;
  double _longitude;

  Coordinate.map(dynamic obj){
    this._latitude = obj["lat"];
    this._longitude = obj["lon"];
  }
}