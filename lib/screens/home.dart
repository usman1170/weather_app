import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/global_controllar.dart';
import 'package:weather_app/models/hourly_weather_data.dart';
import 'package:weather_app/widgets/comfortlevel.dart';
import 'package:weather_app/widgets/dailydata.dart';

import '../widgets/hourlydata.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController _globalController = Get.put(
    GlobalController(),
    permanent: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _globalController.checkLoading().isTrue
            ? Container(
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: Image.asset("assets/weather/02d.png"),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Getting data...",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SpinKitFadingCircle(
                        color: Colors.white,
                        size: 38,
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width,
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
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * .025,
                  ),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
                          //
                          // Header container
                          //
                          const HeaderContainer(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .014,
                          ),
                          Row(
                            children: [
                              //
                              // Veritical long container
                              //
                              MainLongContainer(
                                currentWeatherData: _globalController
                                    .getWeatherValues()
                                    .getCurrentWeatherData(),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.height * .03,
                              ),
                              Column(
                                children: [
                                  //
                                  // Row upper container
                                  //
                                  RowUpperContainer(
                                    currentWeatherData: _globalController
                                        .getWeatherValues()
                                        .getCurrentWeatherData(),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .03,
                                  ),
                                  //
                                  // Row lower container
                                  //
                                  RowLowerContainer(
                                    currentWeatherData: _globalController
                                        .getWeatherValues()
                                        .getCurrentWeatherData(),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  "Today :",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 14),
                                child: Text(
                                  "View details",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .015,
                          ),
                          HourlyDetails(
                            hourlyWeatherData: _globalController
                                .getWeatherValues()
                                .getHourlyWeatherData(),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .015,
                          ),
                          ComfortLevel(
                            currentWeatherData: _globalController
                                .getWeatherValues()
                                .getCurrentWeatherData(),
                          ),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height * .02,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: const [
                          //     Padding(
                          //       padding: EdgeInsets.only(left: 8),
                          //       child: Text(
                          //         "This week :",
                          //         style: TextStyle(
                          //           fontSize: 14,
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.w500,
                          //         ),
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: EdgeInsets.only(right: 14),
                          //       child: Text(
                          //         "View all",
                          //         style: TextStyle(
                          //           fontSize: 14,
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.w500,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height * .015,
                          // ),
                          // DailyDetails(
                          //   hourlyWeatherData: _globalController
                          //       .getWeatherValues()
                          //       .getHourlyWeatherData(),
                          // ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
