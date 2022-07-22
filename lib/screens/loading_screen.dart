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
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  Future<void> getData() async {

     final uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=London&appid=$kapiKey');
     try {
       
      final response = await http.get(uri);
      String data = response.body;
      var abilities = jsonDecode(data)['weather'][0]['description'];
      print(response.statusCode);
      print(abilities);
     } catch (e) {
       print(e);
       throw e;
     }
     

    // if (response.statusCode == 200) {
    //   String data = (jsonDecode(response.body)); 

    //  var longitude = jsonDecode(data)['coord']['lon'];
    //   print(longitude);
    // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
    //   print(weatherDescription);

    // } else {
    //   throw Exception('Failed to load weather conditions');
    // }
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
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
