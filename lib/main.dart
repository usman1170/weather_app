import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/splash.dart';

void main() {
  runApp(const MyApp());
}
// api
// https://api.openweathermap.org/data/3.0/onecall?lat=29.601436326727615&lon=72.83924345095731&appid=43d16083365db7948c86cb2601d5049c&units=matric&exclude=minutely

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
