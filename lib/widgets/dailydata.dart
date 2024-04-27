import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/daily_weather_data.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataForecast({
    Key? key,
    required this.weatherDataDaily,
  }) : super(key: key);

  // string manipulation
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10, left: 8),
              child: Text(
                "Next Days :",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        dailyList(),
      ],
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 450,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          final icon =
              "assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png";
          final maxTemp =
              "${weatherDataDaily.daily[index].temp!.max! - 273}º C";
          final minTemp =
              "${weatherDataDaily.daily[index].temp!.min! - 273}º C";
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: MediaQuery.of(context).size.width - 50,
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(.5),
                    Colors.orangeAccent.shade100.withOpacity(.5),
                    Colors.orangeAccent.shade200.withOpacity(.7),
                  ]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getDay(weatherDataDaily.daily[index].dt),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54.withOpacity(.75),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(icon),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "$maxTemp/$minTemp",
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
