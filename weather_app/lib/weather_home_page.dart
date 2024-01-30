import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/db/db_helper.dart';
import 'package:weather_app/provider.dart';
import 'package:weather_app/weather_item_container.dart';

import 'db/city_model.dart';

class WeatherHomePage extends StatefulWidget {
  final lat;
  final lng;
   var boolean;

   WeatherHomePage(this.lat, this.lng,this.boolean, {super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState(lat, lng, boolean);
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  var lat;
  var lng;
  var boolean;
  @override
  void initState() {
    super.initState();
    Timer.periodic( const Duration(seconds: 60), (time) {
      final weatherProvider =Provider.of<WeatherProvider>(context,listen: false);
      weatherProvider.updateTime();
      setState(() {

      });
    });
    final weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    weatherProvider.getWeatherData(widget.lat, widget.lng);
    setState(() {});
  }

  DataBaseHelper dataBaseHelper = DataBaseHelper();
  var dc = 273.15;
  _WeatherHomePageState(lat, lng,boolean);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return value.weatherModel.name == null
            ? Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.cyanAccent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                body: Stack(children: [
                  const Image(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage('images/welcomeimg.webp')),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      width: double.infinity,
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                           Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                         widget.boolean == true ?  IconButton(
                              onPressed: ()async{
                                CityModel cityModel = CityModel(
                                    cityName: value.weatherModel.name,
                                    lat: value.weatherModel.coord!.lat,
                                    lng: value.weatherModel.coord!.lon);

                               await addCityToDb(cityModel);
                                 setState(() {
                                   widget.boolean =false;
                                 });
                              },
                                  icon: const
                                     Padding(
                                      padding: EdgeInsets.only(right: 26.0),
                                      child: Icon(Icons.star_border,color: Colors.white),
                                    ),

                                 ): const Padding(
                                   padding: EdgeInsets.only(right: 38.0),
                                   child: Icon(Icons.star,color: Colors.lightGreen,),
                                 ),
                          ],),
                          Text(value.weatherModel.name.toString(),
                              style: const TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text((('${value.weatherModel.main!.temp.round()-dc.toInt()} °C')),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 2.5),
                    child: Consumer<WeatherProvider>(builder: (context, value, Widget? child) {
                      return GridView.count(
                        childAspectRatio: 3 / 4,
                        crossAxisCount: 2,
                        children:  [
                          const CustomContainer(
                            icon:Icon(Icons.sunny) , weatherEM: 'UV INDEX',data: "",
                          ),
                          CustomContainer( icon:const Icon(Icons.access_time_sharp) , weatherEM: 'TIME',data: value.time),
                          CustomContainer( icon:const Icon(Icons.wind_power) , weatherEM: 'WIND',data: '${value.weatherModel.wind?.speed} kph' ),
                          CustomContainer( icon:const Icon(Icons.water_drop) , weatherEM: 'RAINFALL',data: value.weatherModel.weather?[0].description),
                          CustomContainer( icon:const Icon(Icons.thermostat) , weatherEM: 'FEELS LIKE',data: ('${value.weatherModel.main!.feelsLike.round()-dc.toInt()} °')),
                          CustomContainer( icon:const Icon(Icons.water) , weatherEM: 'HUMIDITY',data: '${value.weatherModel.main?.humidity} %' ),
                          CustomContainer( icon:const Icon(Icons.remove_red_eye) , weatherEM: 'VISIBILITY',data: value.weatherModel.visibility),
                          CustomContainer( icon:const Icon(Icons.speed_sharp) , weatherEM: 'PRESSURE',data: "${value.weatherModel.main?.pressure} hPa"),
                        ],
                      );
                    }),
                  ),
                ]),
              );
      },
    );
  }
  addCityToDb(CityModel cityModel) async {
    await dataBaseHelper.insert(cityModel);
    setState(() {

    });
  }

}
