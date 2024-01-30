import 'package:flutter/material.dart';
import 'package:weather_app/weather_model.dart';

class WeatherPage extends StatefulWidget {
  final weatherModel;

  const WeatherPage(this.weatherModel, {super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState(weatherModel);
}

class _WeatherPageState extends State<WeatherPage> {
  var weatherModel;
  _WeatherPageState(this.weatherModel);
@override
  void initState() {
    super.initState();
    print("weatherModel : $weatherModel");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const Image(
            width: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage('images/welcomeimg.webp')),
        Padding(
          padding: const EdgeInsets.only(top: 88.0),
          child: SizedBox(
            // decoration: BoxDecoration(
            //     border: Border.all(color: Colors.white)),
            height: 200,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(weatherModel.city.name,
                      style: const TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text(weatherModel.list[0].main.temp.toString(),
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
            top: 300.0,
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
                                  Text("UV INDEX",
                                      style: TextStyle(
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
                                fontSize: 30,
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
                                  Text("UV INDEX",
                                      style: TextStyle(
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
                                fontSize: 30,
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
                                  Text("UV INDEX",
                                      style: TextStyle(
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
                                fontSize: 30,
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
                                  Text("UV INDEX",
                                      style: TextStyle(
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
                                fontSize: 30,
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
                                  Text("UV INDEX",
                                      style: TextStyle(
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
                                fontSize: 30,
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
                                  Text("UV INDEX",
                                      style: TextStyle(
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
                                fontSize: 30,
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
                                Text("UV INDEX",
                                    style: TextStyle(
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
                              fontSize: 30,
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
                                Text("UV INDEX",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          Text(
                            ' uv.toString()',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30,
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
}

//api.openweathermap.org/data/2.5/forecast?lat=37.785834&lon=-122.406417&appid=2cf6750235cc48c419c387bd9e313d74
