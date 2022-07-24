// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:precipatation/screens/city_screen.dart';
import 'package:precipatation/utilities/constants.dart';
import 'package:precipatation/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({super.key, this.LocationWeather});
  final LocationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temperature = 0;
  int? condition;
  String? cityName;
  String? weatherIcon;
  WeatherModel weatherCondition = WeatherModel();
  String? TempCond;

  @override
  void initState() {
    super.initState();
    updateUI(widget.LocationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        cityName = '';
        TempCond = 'Unable to get weather data...';
        return;
      }
      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherCondition.getWeatherIcon(condition);
      var city = weatherData['name'];
      cityName = city;
      TempCond = weatherCondition.getMessage(temperature);
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
                    onPressed: () async {
                      var weatherData =
                          await weatherCondition.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 40.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  "$cityName",
                  style: kTempTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      // '$temperature',
                      '${temperature}°C',

                      style: kTempTextStyle,
                    ),
                    Text(
                      ' $weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 1.0),
                child: Text(
                  '$TempCond',
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
              const SizedBox(
                height: 6.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
