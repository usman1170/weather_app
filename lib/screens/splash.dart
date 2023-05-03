// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue.shade300,
              Colors.blue.shade400,
            ],
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Center(
          child: ZoomIn(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset("assets/weather/02d.png"),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: BounceInDown(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            height: 55,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(30)),
            child: const Padding(
              padding: EdgeInsets.only(bottom: 6),
              child: Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Usman Ghani ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "®",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
