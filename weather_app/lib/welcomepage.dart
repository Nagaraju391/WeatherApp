import 'dart:async';
import 'dart:convert';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/weather_model.dart';
import 'package:weather_app/weather_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    _getPosition();
    setState(() {});
    super.initState();
  }

  WeatherModel? weatherModel;
  var cityName = '';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2500,
      backgroundColor: Colors.blue.shade300,
      splash: Center(
          child: AnimatedTextKit(animatedTexts: [
        TyperAnimatedText('WEATHER APP',
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 55.0,
              fontWeight: FontWeight.bold,
            )),
        FadeAnimatedText("weatherModel!.city.name",
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ))
      ])),
      nextScreen:  WeatherPage(weatherModel),
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }

  Future _getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      weatherModel = await getWeather(position.latitude, position.longitude);
      print("cityName=> ${weatherModel!.city.name}");
      setState(() {
        print(weatherModel?.list[0].main.temp.toString());
        cityName = weatherModel!.city.name;
      });
    } catch (e) {
      // print(e);
    }
  }

  Future<WeatherModel> getWeather(latitude, longitude) async {
    final url =
        "http://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=2cf6750235cc48c419c387bd9e313d74";
    Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return WeatherModel.fromJson(responseBody);
    } else {
      throw Exception('somthing went wrong');
    }
  }
}
//http://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=2cf6750235cc48c419c387bd9e313d74;
//https://api.openweathermap.org/data/2.5/forecast?q=Bhuvanagiri&appid=2cf6750235cc48c419c387bd9e313d74
