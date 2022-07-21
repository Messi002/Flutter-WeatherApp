// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:precipatation/services/location.dart';
import 'package:http/http.dart';


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

  void getLocation() async{
     Location location = Location();
     await location.getCurrentLocation();
     print(location.latitude);
     print(location.longitude);
  }

  void getData() async{
    Response response = await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=London&appid=0a16a89df9d7af77449a9db13adae845'));
  print(response.body);
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