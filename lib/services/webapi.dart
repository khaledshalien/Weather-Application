import 'dart:convert';
import 'package:http/http.dart';

class WebAPIHelper{
String? url;

WebAPIHelper({this.url});


 getdata()async{
  var result = await get(Uri.parse("$url"));
  return jsonDecode(result.body);
 }
}
