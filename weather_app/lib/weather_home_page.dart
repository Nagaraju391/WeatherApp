import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weather_app/weather_model.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  WeatherModel? _weatherModel;

  @override
  void initState() {
    _getPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return   _weatherModel == null ? const Image(
            width: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage('images/welcomeimg.webp')) :
    Scaffold(
              body: Stack(children: [
          const Image(
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage('images/welcomeimg.webp')),
          Padding(
              padding: EdgeInsets.only(top: 78.0),
              child: SizedBox(
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.white)),
                height: 200,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(_weatherModel!.city.name,
                          style: const TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text(_weatherModel!.list[0].main.temp.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
          ),
          Container(
              decoration: const BoxDecoration(
                // image: DecorationImage(
                //     fit: BoxFit.cover,
                //     image: AssetImage('images/welcomeimg.webp'))
              ),
              padding: const EdgeInsets.only(
                top: 270.0,
                left: 15.0,
                right: 15.0,
              ),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(21),
                          border: Border.all(color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(21),
                          border: Border.all(color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(21),
                          border: Border.all(color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(21),
                          border: Border.all(color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.all(5.0),
                              height: MediaQuery.of(context).size.height / 3.5,
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(21),
                                  border: Border.all(color: Colors.white)),
                              child: const Column(children: [
                                Padding(
                                  padding: EdgeInsets.all(13.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.sunny,
                                        color: Colors.white,
                                      ),
                                      Text(" UV INDEX",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                                Text(
                                  'uv.toString()',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ])),
                        ),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.all(5.0),
                              height: MediaQuery.of(context).size.height / 3.5,
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(21),
                                  border: Border.all(color: Colors.white)),
                              child: const Column(children: [
                                Padding(
                                  padding: EdgeInsets.all(13.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.sunny,
                                        color: Colors.white,
                                      ),
                                      Text(" UV INDEX",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                                Text(
                                  'uv.toString()',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ])),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.all(5.0),
                              height: MediaQuery.of(context).size.height / 3.5,
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(21),
                                  border: Border.all(color: Colors.white)),
                              child: const Column(children: [
                                Padding(
                                  padding: EdgeInsets.all(13.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.sunny,
                                        color: Colors.white,
                                      ),
                                      Text(" UV INDEX",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                                Text('uv.toString()',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ])),
                        ),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.all(5.0),
                              height: MediaQuery.of(context).size.height / 3.5,
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(21),
                                  border: Border.all(color: Colors.white)),
                              child: const Column(children: [
                                Padding(
                                  padding: EdgeInsets.all(13.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.sunny,
                                        color: Colors.white,
                                      ),
                                      Text(" UV INDEX",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                                Text(
                                  'uv.toString()',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ])),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.all(5.0),
                              height: MediaQuery.of(context).size.height / 3.5,
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(21),
                                  border: Border.all(color: Colors.white)),
                              child: const Column(children: [
                                Padding(
                                  padding: EdgeInsets.all(13.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.sunny,
                                        color: Colors.white,
                                      ),
                                      Text(" UV INDEX",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                                Text(
                                  'uv.toString()',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ])),
                        ),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.all(5.0),
                              height: MediaQuery.of(context).size.height / 3.5,
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(21),
                                  border: Border.all(color: Colors.white)),
                              child: const Column(children: [
                                Padding(
                                  padding: EdgeInsets.all(13.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.sunny,
                                        color: Colors.white,
                                      ),
                                      Text(" UV INDEX",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                                Text(
                                  'uv.toString()',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ])),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            height: MediaQuery.of(context).size.height / 3.5,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(21),
                                border: Border.all(color: Colors.white)),
                            child: const Column(children: [
                              Padding(
                                padding: EdgeInsets.all(13.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.sunny,
                                      color: Colors.white,
                                    ),
                                    Text(" UV INDEX",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              Text(
                                'uv.toString()',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            height: MediaQuery.of(context).size.height / 3.5,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(21),
                                border: Border.all(color: Colors.white)),
                            child: const Column(children: [
                              Padding(
                                padding: EdgeInsets.all(13.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.sunny,
                                      color: Colors.white,
                                    ),
                                    Text(" UV INDEX",
                                        style: TextStyle(
                                          fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              Text(
                                'uv.toString()',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,

                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ),
        ]),
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


    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
      _weatherModel =
    await getWeather(position.latitude, position.longitude);
      setState(() {});
  }

  Future<WeatherModel> getWeather(latitude, longitude) async {
    final url =
        "http://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=2cf6750235cc48c419c387bd9e313d74";
    print(url);
    Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return WeatherModel.fromJson(responseBody);
    } else {
      throw Exception('somthing went wrong');
    }
  }


}
