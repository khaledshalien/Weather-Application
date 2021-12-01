import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CityLocation extends StatefulWidget {

  @override
  _CityLocationState createState() => _CityLocationState();
}

class _CityLocationState extends State<CityLocation> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("images/city_background.jpg"),
          ),
        ),
        child: SafeArea(
            child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30,horizontal: 15),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,size: 40,color: Colors.black,),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter City Name",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )
                      ),
                    onChanged: (value){
                      cityName = value;
                    },
                    ),
                  ),
                RaisedButton(

                  color: Colors.grey.withOpacity(0.5),
                    onPressed: (){
                      Navigator.pop(context, cityName);
                    },
                    child: Text('Get Weather', style: TextStyle(
                        fontSize: 30, fontFamily: 'Spartan MB',
                    ),)),

              ],
            ),
          ),
        ),
    );
  }
}
