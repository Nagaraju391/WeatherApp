

import 'package:flutter/material.dart';
import 'package:weather_app/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
 City? city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
              fit: BoxFit.cover,
              image: AssetImage('images/welcomeimg.webp')),
            const Padding(
            padding: EdgeInsets.only(top: 88.0),
            child: SizedBox(
              // decoration: BoxDecoration(
              //     border: Border.all(color: Colors.white)),
              height: 200,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('city!.name',
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text("temp- 30",
                        style: TextStyle(
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
          padding: const EdgeInsets.only(top: 300.0,left: 15.0,right: 15.0,),

          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      border: Border.all(color: Colors.white)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      border: Border.all(color: Colors.white)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      border: Border.all(color: Colors.white)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: BoxDecoration(
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
                          ])
                      ),
                    ),
                    Expanded(
                      child: Container(

                          margin: const EdgeInsets.all(5.0),
                        height: MediaQuery.of(context).size.height / 3.5,
                        decoration: BoxDecoration(
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
                          ])
                      ),
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
                          ])
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(5.0),
                        height: MediaQuery.of(context).size.height / 3.5,
                        decoration: BoxDecoration(
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
                          ])
                      ),
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
                          ])
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(5.0),
                        height: MediaQuery.of(context).size.height / 3.5,
                        decoration: BoxDecoration(
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
                          ])
                      ),
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