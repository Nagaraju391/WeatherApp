import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/functions.dart';

import 'package:weather_app/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
 WeatherModel weatherModel = WeatherModel();
 Functions functions = Functions();
 Future getWeatherData(latitude, longitude) async{
   weatherModel = (await functions.getWeather(latitude, longitude))!;
    notifyListeners();
  }
 var time =   DateFormat.jm().format(DateTime.now());
 updateTime(){
  time = DateFormat.jm().format(DateTime.now());
notifyListeners();
}

}