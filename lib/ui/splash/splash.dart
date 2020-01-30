import 'dart:async';
import 'dart:developer';

import 'package:intl/intl.dart';

import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/routes.dart';
import 'package:boilerplate/services/weather_service.dart';
import 'package:boilerplate/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/weather.dart';
import 'package:weather/weather.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
  //     statusBarColor: background_color1, //or set color with: Color(0xFF0000FF)
  //   ));
  @override
  void initState() {
    super.initState();
    startTimer();
    getWeather();


  }


  getWeather() async {
    WeatherStation weatherStation = new WeatherStation("5a3e7fe28eafeb6401c1fd25ea458490");
    Weather weather = await weatherStation.currentWeather();
   print("weatherrrrrrrrrrrrrrrr..........................................");
    print("weather"+weather.date.toString().split(" ")[0]);
    print("weather"+weather.toString());
    print("weather Details"+weather.weatherDescription);
    weatherService.temperature = weather.temperature.celsius ;
    // weatherService.date = weather.date as String;
    weatherService.weather = weather.weatherDescription;
    DateTime date = DateTime.now();
    var dateFormat = DateFormat('EEEE, d MMM, yyyy').format(date);
    weatherService.date = dateFormat;






  }

  @override
  Widget build(BuildContext context) {
     return Material(
      child: Center(
        child: AppIconWidget(image: 'assets/icons/logo.png')
        ),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 5000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

     Navigator.of(context).pushReplacementNamed(Routes.lang);



    // if (preferences.getBool(Preferences.is_logged_in) ?? false) {
    //   Navigator.of(context).pushReplacementNamed(Routes.login);
    // } else {
    //   Navigator.of(context).pushReplacementNamed(Routes.home);
    // }
  }
}

