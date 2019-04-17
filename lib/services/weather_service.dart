import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_plus/models/weather_api.dart';

class WeatherService {
  
  static Future<String> getData() async {
    try{
var weather_api = WeatherAPI();
    var city = 'Ruislip';
    http.Response response = await http.get(
        Uri.encodeFull(weather_api.generateRequest(city)),
        headers: {"Accept": "application/json"});
    //print("Url is ${Uri.encodeFull(weather_api.generateRequest(city))}");
    print(response.body);
    
    //print("Data is ${data['name']}");
    
    return response.body;
    //var response = await http.get(url);
    }
    catch(e){
      return '0';
    }
  }
}
