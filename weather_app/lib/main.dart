import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider.dart';
import 'package:weather_app/search_page.dart';

void main() async {
 // WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context){
        return WeatherProvider();
      })
    ],
    child: const MyApp(),
  ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SearchPage(),
    );
  }
}



