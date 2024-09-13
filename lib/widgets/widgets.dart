// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/current_weather_data.dart';
import '../controller/global_controllar.dart';

class HeaderContainer extends StatefulWidget {
  const HeaderContainer({
    super.key,
    required this.theme,
  });
  final VoidCallback theme;
  @override
  State<HeaderContainer> createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer> {
  String locality = '';
  String city = '';
  String date = DateFormat("yMMMMd").format(DateTime.now());
  final GlobalController _globalController = Get.put(
    GlobalController(),
    permanent: true,
  );
  @override
  void initState() {
    getAddress(
      _globalController.getLattitude().value,
      _globalController.getLongitude().value,
    );
    super.initState();
  }

  getAddress(lat, long) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
    Placemark place = placemark[0];
    setState(() {
      locality = place.subLocality!;
      city = place.subAdministrativeArea ?? "Loading...";
      print("sub == ${place.subLocality}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .025,
      ),
      height: MediaQuery.of(context).size.height * .1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    city,
                    style: const TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ],
              ),
              if (locality != "")
                Text(
                  locality,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
          InkWell(
            onTap: widget.theme,
            child: const Icon(
              Icons.brightness_4_outlined,
              size: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class RowUpperContainer extends StatelessWidget {
  final CurrentWeatherData currentWeatherData;
  final Color color1;
  final Color color2;
  const RowUpperContainer({
    super.key,
    required this.currentWeatherData,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .04,
        vertical: MediaQuery.of(context).size.height * .022,
      ),
      width: MediaQuery.of(context).size.width * .38,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(.5),
              color1,
              color2,
            ]),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Temp.",
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    right: 8,
                  ),
                  child: Text(
                    "${currentWeatherData.current.temp! - 273} °C",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Divider(
                color: Colors.white,
                thickness: 1.2,
                endIndent: 40,
                indent: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowLowerContainer extends StatelessWidget {
  final CurrentWeatherData currentWeatherData;
  final Color color;
  const RowLowerContainer({
    super.key,
    required this.currentWeatherData,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .02,
        vertical: MediaQuery.of(context).size.height * .022,
      ),
      width: MediaQuery.of(context).size.width * .38,
      decoration: BoxDecoration(
        color: Colors.blue.shade100.withOpacity(.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Feels\nLike.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 14,
                    right: 8,
                    bottom: 14,
                  ),
                  child: Text(
                    // currentWeatherData.current.feelsLike
                    "${currentWeatherData.current.feelsLike! - 273} °C",
                    style: TextStyle(
                      fontSize: 30,
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Text(
                  "moderate\n",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Divider(
                color: Colors.white,
                thickness: 1.2,
                endIndent: 40,
                indent: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainLongContainer extends StatelessWidget {
  final CurrentWeatherData currentWeatherData;
  MainLongContainer({
    super.key,
    required this.currentWeatherData,
  });

  String date = DateFormat("yMMMMd").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .04,
        vertical: MediaQuery.of(context).size.height * .02,
      ),
      width: MediaQuery.of(context).size.width * .43,
      decoration: BoxDecoration(
        color: Colors.blue.shade200.withOpacity(.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .25,
                child: Text(
                  date,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
                width: MediaQuery.of(context).size.width * .065,
                child: Image.asset(
                  "assets/weather/${currentWeatherData.current.weather![0].icon}.png",
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 10, top: 4),
            child: Text(
              "${currentWeatherData.current.weather![0].main}",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
            endIndent: 30,
            indent: 30,
            thickness: 1.5,
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * .05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    // for Wind
                    //
                    const Text(
                      "wind",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                        bottom: 18,
                      ),
                      child: Text(
                        "${currentWeatherData.current.windSpeed} km/h",
                        style: const TextStyle(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    //
                    // for Humidity
                    //
                    const Text(
                      "Humidity",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                        bottom: 18,
                      ),
                      child: Text(
                        "${currentWeatherData.current.humidity}",
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    //
                    // for Pressure
                    //
                    const Text(
                      "Pressure",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                      ),
                      child: Text(
                        "${currentWeatherData.current.pressure} pa",
                        style: const TextStyle(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .04),
                child: const Divider(
                  color: Colors.white,
                  thickness: 1.5,
                  endIndent: 30,
                  indent: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
