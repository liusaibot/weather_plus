import 'package:flutter/material.dart';
import 'package:weather_plus/models/forecast.dart';
import 'dart:convert';
import 'package:weather_plus/services/weather_service.dart';

import 'search_page.dart';
import 'settings_page.dart';
import 'locations_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  bool showData = false;
  dynamic weather;
  String message = 'Please Add a City or Location \u00b0';
  Map<String, dynamic> result;
  Forecast forecast;

  @override
  void initState() {
    _getcurrentWeather();
    super.initState();
  }

  void _getcurrentWeather() async {
    var response = await WeatherService.getData();
    if (response == '0') {
      setState(() {
        showData = false;
        message = 'Could Not Connect to Weather Service';
      });
    } else {
      //Map<String, dynamic> data = json.decode(response);
      dynamic data = json.decode(response);
      // var weather = data as Forecast;
      // print("Location is ${weather.name}");
      var res = Forecast.map(data);
      setState(() {
        showData = true;
        result = data;
        forecast = res;
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      showData = true;
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Plus'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LocationsPage()));
          },
          icon: Icon(Icons.location_on),
        ),
        actions: <Widget>[
          Padding(
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SearchPage()));
                  },
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SettingsPage()));
                  },
                  icon: Icon(Icons.more_vert),
                ),
              ],
            ),
            padding: EdgeInsets.only(right: 1.0),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: showData == false
              ? <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(message),
                    ],
                  ),
                ]
              : <Widget>[
                  Text("${forecast.name},${forecast.sys.country}"),
                  // Text(
                  //   'Location Added',
                  // ),
                  //Text(forecast.weather.description),
                ],
        ),
      ),
      floatingActionButton: showData == false
          ? FloatingActionButton.extended(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              icon: Icon(Icons.location_on),
              label: Text("Add Location"),
            )
          : null,
    );
  }
}
