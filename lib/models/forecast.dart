class Forecast {
  _Coordinate _coord;
  List<_Weather> _weather;
  String _base;
  _Main _main;
  int _visibility;
  _Wind _wind;
  _Clouds _clouds;
  int _dt;
  _Sys _sys;
  int _id;
  String _name;
  int _cod;

  Forecast.map(dynamic obj) {
    this._coord = _Coordinate.map(obj['coord']);
    this._weather = (obj['weather'] as List).map((i){
      return _Weather.map(i);
    }).toList();
    this._base = obj['base'];
    this._main = _Main.map(obj['main']);
    this._visibility = obj['visibility'];
    this._wind = _Wind.map(obj['wind']);
    this._clouds = _Clouds.map(obj['clouds']);
    this._dt = obj['dt'];
    this._sys = _Sys.map(obj['sys']);
    this._id = obj['id'];
    this._name = obj['name'];
    this._cod = obj['cod'];
  }




  _Coordinate get coord => _coord;
  List<_Weather> get weather => _weather;
  String get base => _base;
  _Main get main => _main;
  int get visibility => _visibility;
  _Wind get wind => _wind;
  _Clouds get clouds => _clouds;
  int get dt => _dt;
  _Sys get sys => _sys;
  int get id => _id;
  String get name => _name;
  int get cod => _cod;
}

class _Coordinate {
  double _latitude;
  double _longitude;

  _Coordinate.map(dynamic obj) {
    this._latitude = obj['lat'];
    this._longitude = obj['lon'];
  }
}

class _Weather {
  int _id;
  String _main;
  String _description;
  String _icon;

  _Weather.map(dynamic obj) {
    this._id = obj['id'];
    this._main = obj['main'];
    this._description = obj['description'];
    this._icon = obj['icon'];
  }

  int get id => _id;
  String get description => _description;
  String get main => _main;
  String get icon => _icon;
}

class _Main {
  double temp;
  int pressure;
  int humidity;
  double temp_min;
  double temp_max;

  _Main.map(dynamic obj) {
    this.temp = obj['temp'];
    this.pressure = obj['pressure'];
    this.humidity = obj['humidity'];
    this.temp_min = obj['temp_min'];
    this.temp_max = obj['temp_max'];
  }
}

class _Wind {
  double speed;

  _Wind.map(dynamic obj) {
    this.speed = obj['speed'];
  }
}

class _Clouds {
  int all;

  _Clouds.map(dynamic obj) {
    this.all = obj['dt'];
  }
}

class _Sys {
  int _type;
  int _id;
  double _message;
  String _country;
  int _sunrise;
  int _sunset;

  _Sys.map(dynamic obj){
    this._type = obj['type'];
    this._id = obj['id'];
    this._message = obj['message'];
    this._country = obj['country'];
    this._sunrise = obj['sunrise'];
    this._sunset = obj['sunset'];
  }

  String get country => _country;
}
