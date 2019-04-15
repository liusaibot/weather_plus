import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Plus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // theme: ThemeData(
      //     primaryColor: const Color(0xFF1C306D),
      //     accentColor: const Color(0xFFFFAD32),
      //     scaffoldBackgroundColor: Colors.transparent,
      //     fontFamily: "Product-sans",
      //   ),
      home: MyHomePage(),
    );
  }
}

