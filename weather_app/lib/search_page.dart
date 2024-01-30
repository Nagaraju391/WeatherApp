import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/db/city_model.dart';
import 'package:weather_app/db/db_helper.dart';
import 'package:weather_app/provider.dart';
import 'package:weather_app/weather_home_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
 @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer.periodic( const Duration(seconds: 60), (time) {
      final weatherProvider =Provider.of<WeatherProvider>(context,listen: false);
      weatherProvider.updateTime();
    });
    getCityList();
    _getPosition();
  }

  DataBaseHelper dataBaseHelper = DataBaseHelper();
  List<CityModel>? cityList;
  final cityName = TextEditingController();
  var lat;
  var lng;
  var cityLat;
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    print('cityList => ${cityList?.length}');
    return lat == null ? Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.cyanAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
    ):
    Scaffold(
      resizeToAvoidBottomInset: true,
      body: Consumer<WeatherProvider>(
     builder: (context, value, child) =>
         Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.cyanAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 42.0, left: 11, right: 11, bottom: 11),
            child: Column(
              children: [
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "WEATHER",
                      style: TextStyle(fontSize: 41, fontWeight: FontWeight.bold),
                    ),

                  cityList!.isNotEmpty ?  ElevatedButton(
                        onPressed: (){
                          setState(() {
                            isEdit =!isEdit;
                          });
                        },
                        child: const Text("Edit",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold))) :const SizedBox()
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey ,
                  child: TextFormField(
                    onChanged: (value){
                       updateList(value);
                    },
                    cursorColor: null,
                    autofocus: false, /// set it to false
                    textInputAction: TextInputAction.done,
                    keyboardAppearance: Brightness.dark,
                    //keyboardType: TextInputType.text,
                    validator: (value) {
                      return "Enter valid city name";
                    },
                    controller: cityName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)),
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search for a city",
                      suffixIcon: GestureDetector(
                          onTap: () async{
                           await getLatAndLng(cityName.text);
                           if(cityLat != null) {
                             Navigator.of(context).push(
                                 MaterialPageRoute(builder: (context) {
                                   return WeatherHomePage(lat, lng, true);
                                 }));
                           }else{
                             _formKey.currentState!.validate();
                           }
                          },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 8.0,top: 9.0),
                              child: Text("Search",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                            ),
                          ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return  WeatherHomePage(lat,lng,false);
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(21),
                      ),
                      height: 150,
                      child:   Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("My Location",
                                    style: TextStyle(
                                        fontSize: 41,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),


                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(padding:const EdgeInsets.all(8.8),child:
                                  Text(value.time.toString(),
                                      style: const TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                cityList?.length != null ? Expanded(
                  child: ListView.builder(
                    itemCount: cityList?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {

                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return  WeatherHomePage(cityList![index].lat,cityList![index].lng,false);
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(21),
                            ),
                            height: 150,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(cityList![index].cityName!,
                                          style: const TextStyle(
                                              fontSize: 41,
                                              fontWeight: FontWeight.bold)),
                                      GestureDetector(
                                          onTap: () async {
                                            await dataBaseHelper
                                                .delete(cityList![index].id!);
                                            await getCityList();
                                          },
                                          child: isEdit == true ? const Icon(
                                            Icons.delete,
                                            size: 50,
                                          ): const SizedBox())
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(padding:const EdgeInsets.all(8.8),child:
                                      Text(value.time.toString(),
                                          style: const TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold))),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ) : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  getCityList() async {
    cityList = await dataBaseHelper.getCityModels();
    setState(() {
      cityList = cityList;
    });
  }
  void updateList(String value) async{
    if(value.isEmpty) {
      var city =  await dataBaseHelper.getCityModels();
      setState(() {
        cityList = city;
      });
    }else{
      setState(() {
      cityList = cityList?.where((element) => element.cityName!.toLowerCase().contains(value.toLowerCase())).toList();
    });
    }

  }

  addCityToDb(CityModel cityModel) async {
    await dataBaseHelper.insert(cityModel);
    await getCityList();
  }

  getLatAndLng(cityName) async {
try {
  List<Location> locations = await locationFromAddress(cityName);
  setState(() {
    cityLat = locations.last.latitude;
    lat= locations.last.latitude;
    lng= locations.last.longitude;
  });
}catch(e){
  _formKey.currentState?.validate();
}

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
    setState(() {
      lat = position.latitude;
      lng = position.longitude;
    });
  }

}
