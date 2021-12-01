import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/screens/loading_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData.dark(),
        home: LoadingScreen(),
    );
  }
}


