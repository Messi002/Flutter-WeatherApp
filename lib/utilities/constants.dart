import 'package:flutter/material.dart';

const kapiKey = '0a16a89df9d7af77449a9db13adae845';

final kWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 60.0,
);

const kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: 'Enter a city name',
    hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(
          10.0,
        ),
      ),
    ),
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ));
