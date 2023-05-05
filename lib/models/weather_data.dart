import 'package:weather_app/models/current_weather_data.dart';
import 'package:weather_app/models/daily_weather_data.dart';
import 'package:weather_app/models/hourly_weather_data.dart';

class WeatherData {
  final CurrentWeatherData? current;
  final HourlyWeatherData? hourly;
  final DailyWeatherData? daily;

  WeatherData([
    this.current,
    this.hourly,
    this.daily,
  ]);
  CurrentWeatherData getCurrentWeatherData() => current!;
  HourlyWeatherData getHourlyWeatherData() => hourly!;
  DailyWeatherData getdailyWeatherData() => daily!;
}
