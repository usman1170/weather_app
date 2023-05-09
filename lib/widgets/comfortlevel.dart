import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather_data.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ComfortLevel extends StatelessWidget {
  final CurrentWeatherData currentWeatherData;
  const ComfortLevel({super.key, required this.currentWeatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 1,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: const Text(
            "Comfort Level",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            bottom: 20,
          ),
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: currentWeatherData.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                      animationEnabled: true,
                      customWidths: CustomSliderWidths(
                        trackWidth: 8,
                        progressBarWidth: 14,
                      ),
                      infoProperties: InfoProperties(
                        bottomLabelStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          letterSpacing: .4,
                        ),
                        bottomLabelText: "Humidity",
                      ),
                      size: 160,
                      customColors: CustomSliderColors(
                          trackColor: Colors.purple.shade100,
                          progressBarColors: [
                            Colors.purple.shade300,
                            Colors.purpleAccent.shade200,
                            Colors.blue,
                            Colors.blueAccent.shade700,
                          ])),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Feels Like : ${currentWeatherData.current.feelsLike! - 273} °C",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Text(
                      "UV index : ${currentWeatherData.current.uvi}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 2,
                width: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
