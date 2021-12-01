import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_location.dart';

import 'package:weather_app/screens/loading_screen.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/services/webapi.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.weatherData});

  final weatherData;
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}


class _WeatherScreenState extends State<WeatherScreen> {
  var w = WeatherModel();
  int? temp;
  String? message;
  String? weatherIcon;
  String? CityNameView;
  String? CityName;


  showDataOnUI(dynamic wd){
    setState(() {
      double t = wd['main']['temp'];
      temp = t.toInt();

      message = w.getMessage(temp!);
      var cond = wd['weather'][0]['id'];
      weatherIcon = w.getWeatherIcon(cond);
      CityName = wd['name'];

    });
  }
  @override
  void initState() {
    // TODO: implement initState
   showDataOnUI(widget.weatherData);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/sky2.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                TextButton(
                     onPressed: (){showDataOnUI(widget.weatherData);},
                     child: Icon(Icons.near_me,size: 50,color: Colors.white,)),
                 TextButton(
                   onPressed: ()async{
                       var cityName =await Navigator.push(context, MaterialPageRoute(builder: (context){
                         return CityLocation();
                       }));
                       if(cityName != null){
                         var CN =  WebAPIHelper(url: "http://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${apikey}&units=metric");
                         var weatherDate =await CN.getdata();
                         showDataOnUI(weatherDate);
                       }CityNameView=cityName;
                 }, child: Icon(Icons.location_city,size: 50,color: Colors.white)),
               ],
             ),
              Padding(
                padding: EdgeInsets.only(left: 15 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("$temp",style: TextStyle(fontFamily: "Spartan",fontSize: 100),),
                        Text("$weatherIcon",style: TextStyle(fontSize: 60,),),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on,size: 30,),
                        SizedBox(width: 10,),
                        Text("$CityName",style: TextStyle(fontSize: 25,fontFamily: "Spartan"),),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15 ),
                child: Text("$message",style: TextStyle(fontFamily: "Spartan",fontSize: 60),),),
            ],
          ),
        ),
      ),

    );
  }
}
