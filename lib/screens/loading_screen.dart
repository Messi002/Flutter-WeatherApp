// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:precipatation/services/location.dart';
import 'package:http/http.dart' as http;


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
  
  }

      Future<void> getData() async{
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=57&lon=-2.15&appid=0a16a89df9d7af77449a9db13adae845'));
    print(response.statusCode);
  }

  void getLocation() async{
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