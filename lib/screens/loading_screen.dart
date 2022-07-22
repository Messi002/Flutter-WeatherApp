// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:precipatation/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:precipatation/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
    double? latitude;
    double? longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }


    void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude =location.longitude;
    getData();
  }

  Future<void> getData() async {
     final uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kapiKey');
    //  final uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=London&appid=$kapiKey');
   
      
      final response = await http.get(uri);

      if( response.statusCode==200){
           String data = response.body;
      var decodeData = jsonDecode(data);

      double temperature = decodeData['main']['temp'];
      int condition = decodeData['weather'][0]['id'];
      String cityName = decodeData['name'];

      print(temperature);
      print(condition);
      print(cityName);
      }else {
      print(response.statusCode);
     }
     
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
