
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
    getWeather();
    _getPosition();
    super.initState();
  }

  var cityName = '';
  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      duration: 2500,

backgroundColor: Colors.blue.shade300,
            splash: Center(child: AnimatedTextKit(animatedTexts: [
              TyperAnimatedText('WEATHER APP',textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 55.0,
                fontWeight: FontWeight.bold,
              )),

              FadeAnimatedText(cityName,textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 55.0,
                fontWeight: FontWeight.bold,
              ))
            ]) ), nextScreen: const WeatherPage(),
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
    // print(position);
    // print(position.latitude);
    // print( position.longitude);
    try {
      List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        cityName = place.locality!;
        print(position.latitude);
        print(position.longitude);
      });
      //getweatherApp(cityName);
    } catch (e) {
      // print(e);
    }
  }

  getWeather() async {
    const url =
        "http://api.openweathermap.org/data/2.5/forecast?lat=37.785834&lon=-122.406417&appid=2cf6750235cc48c419c387bd9e313d74";
    final uri = Uri.parse(url);
   Response response = await http.get(uri);
    final results = await json.decode(response.body)['city'];
    print(results);
    print(City.fromJson(results).name);
  return City.fromJson(results);


  }


}