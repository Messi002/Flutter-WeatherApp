import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class NetworkHelper{

    NetworkHelper(this.uri);

    final String uri;

    Future getData() async{
    //  final uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=London&appid=$kapiKey');
   
      
      final response = await http.get(Uri.parse(uri));

      if( response.statusCode==200){
           String data = response.body;
      var decodeData = jsonDecode(data);
      return decodeData;
      }else {
      print(response.statusCode);
     }


  }

}