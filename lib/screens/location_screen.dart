// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:precipatation/services/location.dart';
import 'package:precipatation/utilities/constants.dart';

class LocationScreen extends StatefulWidget {

    LocationScreen({this.LocationWeather});
    final LocationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
   Future<double>? temperature;
  int? condition;
  String? cityName;


  @override
  void initState() {
    super.initState();
    updateUI(widget.LocationWeather);
  }
   
 void updateUI(dynamic weatherData){
      setState(() {
         double? temperature = weatherData['main']['temp'];
      int condition = weatherData['weather'][0]['id'];
      String cityName = weatherData['name'];
       print(cityName);
      print(temperature);
      });
  
     
     

     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    new Text(
                      // '$temperature',
                      '${temperature ?? "Loading..."}',
                    
                      style: kTempTextStyle,
                    ),
                    Text(
                      '☀️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's 🍦 time in San Francisco!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




