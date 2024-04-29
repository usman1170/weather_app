import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controllar.dart';
import 'package:weather_app/screens/map_page.dart';
import 'package:weather_app/utils/constants.dart';
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
  bool darkTheme = false;
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
                      lightColor.shade300,
                      lightColor.shade400,
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
                      darkTheme ? darkColor.shade800 : lightColor.shade300,
                      darkTheme ? darkColor.shade800 : lightColor.shade400,
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
                          HeaderContainer(
                            theme: () {
                              setState(() {
                                darkTheme = !darkTheme;
                              });
                            },
                            location: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MapPage(),
                                  ));
                            },
                          ),
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
                                    color1: darkTheme
                                        ? Colors.teal.shade300
                                        : Colors.orange.shade200
                                            .withOpacity(.8),
                                    color2: darkTheme
                                        ? Colors.teal.shade500
                                        : Colors.orange.shade400
                                            .withOpacity(.75),
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
                                    color: darkTheme
                                        ? Colors.teal.shade100
                                        : Colors.orange.shade200
                                            .withOpacity(.7),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  "Next Hours :",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox()
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
                          DailyDataForecast(
                            weatherDataDaily: _globalController
                                .getWeatherValues()
                                .getdailyWeatherData(),
                            ontap: () {},
                            color1: darkTheme
                                ? Colors.teal.shade200.withOpacity(.6)
                                : Colors.orangeAccent.shade100.withOpacity(.3),
                            color2: darkTheme
                                ? Colors.teal.shade300.withOpacity(.8)
                                : Colors.orangeAccent.shade200.withOpacity(.5),
                            color3: darkTheme
                                ? Colors.teal.shade500
                                : Colors.orange.shade400.withOpacity(.6),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .015,
                          ),
                          ComfortLevel(
                            currentWeatherData: _globalController
                                .getWeatherValues()
                                .getCurrentWeatherData(),
                          ),
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
