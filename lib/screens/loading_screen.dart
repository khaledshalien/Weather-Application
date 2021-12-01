import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/webapi.dart';

const apikey= "907de3e22dfaaf6eb280a4427a9e2915";

//babd64e8ceab801f4d4523083889d144

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  getWeatherdata()async{
    var loc = new Location();
    await loc.grtCurrentLocation();
    var Url = "http://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=${apikey}&units=metric";
    var webapi = new WebAPIHelper(url: Url);
    var weatherData =await webapi.getdata();
    print(weatherData);
    Navigator.push(context,MaterialPageRoute(builder: (context){
      return WeatherScreen(weatherData: weatherData,);
    }) );
  }

  @override
  void initState() {
    // TODO: implement initState

    getWeatherdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
