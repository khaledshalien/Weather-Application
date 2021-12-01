import 'package:geolocator/geolocator.dart';

class Location{
  double? latitude;
  double? longitude;



  grtCurrentLocation()async{

     var pos =await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     latitude = pos.latitude;
     longitude = pos.longitude;

  }


}