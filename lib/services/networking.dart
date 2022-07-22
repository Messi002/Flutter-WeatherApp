import 'package:http/http.dart' as http;
import 'package:precipatation/utilities/constants.dart';
import 'dart:convert';
import 'dart:async';


class NetworkHelper{

    NetworkHelper(this.url);

    final String url;

    void getData() async{
         final uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kapiKey');
    //  final uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=London&appid=$kapiKey');
   
      
      final response = await http.get(uri);

      if( response.statusCode==200){
           String data = response.body;
      var decodeData = jsonDecode(data);
      }else {
      print(response.statusCode);
     }


  }

}