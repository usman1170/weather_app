import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

extension appTheme on ThemeData {
  Color get lightColor => Get.isDarkMode ? Colors.white70 : Colors.black87;

  Color get bgColor => Get.isDarkMode
      ? const Color.fromARGB(255, 42, 43, 43)
      : Colors.grey.shade200;
  Color get countDownColor =>
      Get.isDarkMode ? Colors.white : Colors.orange.shade800;
  Color get mainColor => Get.isDarkMode
      ? Colors.orange.shade400.withOpacity(.4)
      : Colors.orange.shade400;
  Color get btnColor => Get.isDarkMode ? Colors.orange : Colors.orange.shade400;
}
