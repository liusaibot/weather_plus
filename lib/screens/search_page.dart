import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:weather_plus/models/city.dart';
import 'package:weather_plus/models/weather_api.dart';
import 'package:weather_plus/services/weather_service.dart';

final FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<City> _cityList = <City>[];
  String cityName = '';
  String foundCity = 'NotFound';
  WeatherAPI weatherAPI = WeatherAPI();

  @override
  void initState() {
    // firebaseDatabase.reference()
    //               .child('cities')
    //               //.orderByChild('id')
    //               //.equalTo(707860)
    //               .limitToLast(10)
    //               .once()
    //               .then((DataSnapshot dataSnapshot){
    //                 Map<dynamic, dynamic> cities = dataSnapshot.value;
    //                 //List cities = data.value;
    //                 //print('value is: $cities');
    //                 cities.forEach((key, city){
    //                   print(city["name"]);
    //                   setState(() {
    //                    _cityList.add(City.map(city));
    //                   });
    //                 });

    //                 //print("Records: ${list.toString()}");
    //               });

    //print(_cityList[1].name);
    var response = WeatherService.getData();
    print(weatherAPI.baseURL);
    super.initState();
  }

  int _counter = 0;

  void _fetchCity() async {
    print("Fetching");
    var query = await firebaseDatabase
        .reference()
        .child('cities')
        //.orderByValue()
        //.reference()
        //.child('name/Dunafoldvar')
        .orderByChild('country')
        .equalTo("HU")
        .limitToLast(1)
        .once()
        .then((DataSnapshot dataSnapShot){

        Map<dynamic, dynamic> data = dataSnapShot.value;

        if(data != null){
          print("Value is not null: ${data.values}");
          setState(() {
           var city = City.map(data);
           cityName = city.name;
          });
        }
        else{
          print("Value is null");
        }
    })
    ;
        //.startAt(707860)
        //.endAt(707860);

//    query.onChildAdded.listen((event){
//      print("City is: " + event.snapshot.value["name"]);
//      setState(() {
//       cityName =  event.snapshot.value["name"].toString();
//       if(event.snapshot.value != null){
//         foundCity = "Found";
//       }
//      });
//    });
      //   .once()
      //   .then((DataSnapshot dataSnapshot) {
      // if (dataSnapshot.value != null) {
      //   Map<dynamic, dynamic> data = dataSnapshot.value;
      //   print("Snapshot is: ${data.values}");

      //   var city = City.map(data.values);
      //   print(city.name);
      // } else{
      //   print("Nothing Fetched");
      // }
    //});
    print("Done");
  }

  void _incrementCounter() {
    setState(() {
      firebaseDatabase
          .reference()
          .child('User')
          .set({'first_name': 'Kamar', 'last_name': 'Ojikutu'});
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(foundCity),
            Text(cityName),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchCity,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
