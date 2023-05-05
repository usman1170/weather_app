import 'dart:convert';

import 'package:weather_app/controller/global_controllar.dart';
import 'package:weather_app/models/current_weather_data.dart';
import 'package:weather_app/models/daily_weather_data.dart';
import 'package:weather_app/models/hourly_weather_data.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:http/http.dart' as http;

class FetchWeather {
  WeatherData? weatherData;
  Future<WeatherData> getWeatherData(lat, lon) async {
    var response = await http.get(
      Uri.parse(
        apiUrl(lat, lon),
      ),
    );
    var jsonData = jsonDecode(response.body);
    weatherData = WeatherData(
      CurrentWeatherData.fromJson(jsonData),
      HourlyWeatherData.fromJson(jsonData),
      // DailyWeatherData.fromJson(jsonData),
    );
    return weatherData!;
  }
}

String apiUrl(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=matric&exclude=minutely";
  return url;
}
