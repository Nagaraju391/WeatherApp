
import 'package:flutter/material.dart';
import 'package:weather_app/welcomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}

//api.openweathermap.org/data/2.5/forecast/daily?q=London&units=metric&cnt=7&appid={API key}
//api.openweathermap.org/data/2.5/forecast/daily?lat=37.785834&lon=-122.406417&cnt=16&appid=7a63bd9a0c9d4b45a9e123133232704
