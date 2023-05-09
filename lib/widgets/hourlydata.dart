// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/hourly_weather_data.dart';

class HourlyDetails extends StatelessWidget {
  final HourlyWeatherData hourlyWeatherData;
  const HourlyDetails({
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
        height: 170,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hourlyWeatherData.hourly.length > 22
              ? 22
              : hourlyWeatherData.hourly.length,
          itemBuilder: (context, index) {
            return HourlyData(
              time: hourlyWeatherData.hourly[index].dt!,
              temp: hourlyWeatherData.hourly[index].temp!,
              weather: hourlyWeatherData.hourly[index].weather![0].main!,
              image: hourlyWeatherData.hourly[index].weather![0].icon!,
            );
          },
        ));
  }
}

class HourlyData extends StatelessWidget {
  HourlyData({
    super.key,
    required this.time,
    required this.temp,
    required this.weather,
    required this.image,
  });
  int temp;
  int time;
  String image;
  String weather;

  String getTime(final time) {
    DateTime datetime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    String x = DateFormat("jm").format(datetime);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: MediaQuery.of(context).size.width * .25,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.blue.shade200.withOpacity(.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getTime(time),
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: Image.asset("assets/weather/$image.png"),
            ),
            Column(
              children: [
                Text(
                  "${temp - 273} °C",
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
    );
  }
}
