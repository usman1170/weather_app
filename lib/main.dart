import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/splash.dart';

void main() {
  runApp(const MyApp());
}
// api
//

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
