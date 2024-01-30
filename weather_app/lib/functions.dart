import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weather_app/weather_model.dart';

class Functions {

  Future<WeatherModel?> getWeather(latitude, longitude) async {
    WeatherModel? weatherModel;

      final String url =
          "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=2cf6750235cc48c419c387bd9e313d74";
      print(url);
      Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        weatherModel = WeatherModel.fromJson(responseBody);
      } else {
        print("something went wrong ");
      }

    return weatherModel;
  }
}
