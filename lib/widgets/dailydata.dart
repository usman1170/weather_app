// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/hourly_weather_data.dart';

class DailyDetails extends StatelessWidget {
  final HourlyWeatherData hourlyWeatherData;
  const DailyDetails({
    super.key,
    required this.hourlyWeatherData,
  });

  @override
  Widget build(BuildContext context) {
    return hourlyList();
  }

  Widget hourlyList() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        height: 465,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 7,
          itemBuilder: (context, index) {
            return DailyData(
              date: hourlyWeatherData.hourly[index].dt!,
              temp: hourlyWeatherData.hourly[index].temp!,
              weather: hourlyWeatherData.hourly[index].weather![0].main!,
              image: hourlyWeatherData.hourly[index].weather![0].icon!,
            );
          },
        ));
  }
}

class DailyData extends StatelessWidget {
  DailyData({
    super.key,
    required this.date,
    required this.temp,
    required this.weather,
    required this.image,
  });
  int temp;
  int date;
  String image;
  String weather;

  String getTime(final time) {
    DateTime datetime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    String x = DateFormat("yMMMMd").format(datetime);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
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
              getTime(date),
              style: const TextStyle(
                fontSize: 13.5,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
              width: MediaQuery.of(context).size.width * .1,
              child: Image.asset("assets/weather/$image.png"),
            ),
            Text(
              "${temp - 273} 'C",
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
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
