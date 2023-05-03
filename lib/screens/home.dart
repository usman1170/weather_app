import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controllar.dart';

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
                      // Text(
                      //   "Loadind data",
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w500,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: Image.asset("assets/weather/02d.png"),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
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
                              const MainLongContainer(),
                              SizedBox(
                                width: MediaQuery.of(context).size.height * .03,
                              ),
                              Column(
                                children: [
                                  //
                                  // Row upper container
                                  //
                                  const RowUpperContainer(
                                    temp: "35",
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .03,
                                  ),
                                  //
                                  // Row lower container
                                  //
                                  const RowLowerContainer(),
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
                                  "Next Days :",
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
                                  "View all",
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
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width - 0,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: const [
                                  DailyDetails(
                                    date: '04, jan',
                                    day: "monday",
                                    image: 'assets/weather/02d.png',
                                    temp: "23-36 'C",
                                    weather: 'sunny',
                                  ),
                                  DailyDetails(
                                    date: '05, jan',
                                    day: "tuesday",
                                    image: 'assets/weather/01d.png',
                                    temp: "26-38 'C",
                                    weather: 'Hot',
                                  ),
                                  DailyDetails(
                                    date: '06, jan',
                                    day: "wednesday",
                                    image: 'assets/weather/09d.png',
                                    temp: "19-29 'C",
                                    weather: 'Rainy',
                                  ),
                                  DailyDetails(
                                    date: '07, jan',
                                    day: "thursday",
                                    image: 'assets/weather/02d.png',
                                    temp: "27-39 'C",
                                    weather: 'partialy sunny',
                                  ),
                                ],
                              ),
                            ),
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
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width - 0,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100.withOpacity(.4),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: const [
                                  HourlyDetails(
                                    time: '7:00 am',
                                    image: 'assets/weather/02d.png',
                                    temp: "23'C",
                                    weather: 'sunny',
                                  ),
                                  HourlyDetails(
                                    time: '7:30 am',
                                    image: 'assets/weather/01d.png',
                                    temp: "24'C",
                                    weather: 'sunny',
                                  ),
                                  HourlyDetails(
                                    time: '8:00 am',
                                    image: 'assets/weather/09d.png',
                                    temp: "26'C",
                                    weather: 'Rainy',
                                  ),
                                  HourlyDetails(
                                    time: '7:30 am',
                                    image: 'assets/weather/02d.png',
                                    temp: "27 'C",
                                    weather: 'partialy sunny',
                                  ),
                                  HourlyDetails(
                                    time: '7:30 am',
                                    image: 'assets/weather/10d.png',
                                    temp: "27 'C",
                                    weather: 'partialy sunny',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .03,
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

class DailyDetails extends StatelessWidget {
  const DailyDetails({
    super.key,
    required this.date,
    required this.day,
    required this.image,
    required this.temp,
    required this.weather,
  });
  final String date;
  final String day;
  final String image;
  final String temp;
  final String weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
          // height: MediaQuery.of(context).size.height * .2,
          width: MediaQuery.of(context).size.width * .27,
          decoration: BoxDecoration(
            color: Colors.blue.shade100.withOpacity(.4),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                day,
                style: const TextStyle(
                  fontSize: 13.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
                width: MediaQuery.of(context).size.width * .1,
                child: Image.asset(image),
              ),
              Column(
                children: [
                  Text(
                    temp,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    weather,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}

class HourlyDetails extends StatelessWidget {
  const HourlyDetails({
    super.key,
    required this.time,
    required this.image,
    required this.temp,
    required this.weather,
  });
  final String time;
  final String image;
  final String temp;
  final String weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
              height: MediaQuery.of(context).size.height * .2,
              width: MediaQuery.of(context).size.width * .27,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                    width: MediaQuery.of(context).size.width * .1,
                    child: Image.asset(image),
                  ),
                  Column(
                    children: [
                      Text(
                        temp,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        weather,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Container(
              width: .65,
              height: MediaQuery.of(context).size.height * .15,
              color: Colors.white,
            )
          ],
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
