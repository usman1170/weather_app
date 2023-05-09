class CurrentWeatherData {
  final Current current;

  CurrentWeatherData({required this.current});
  factory CurrentWeatherData.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherData(
        current: Current.fromJson(
          json["current"],
        ),
      );
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Current {
  int? temp;
  int? feelsLike;
  double? pressure;
  double? humidity;
  double? uvi;
  double? clouds;
  double? visibility;
  double? windSpeed;
  List<Weather>? weather;

  Current({
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.weather,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temp: (json["temp"] as num?)?.round(),
        feelsLike: (json["feels_like"] as num?)?.round(),
        pressure: double.tryParse(json['pressure'].toString()),
        humidity: double.tryParse(json['humidity'].toString()),
        uvi: double.tryParse(json['uvi'].toString()),
        clouds: double.tryParse(json['clouds'].toString()),
        visibility: double.tryParse(json['visibility'].toString()),
        windSpeed: double.tryParse(json['wind_speed'].toString()),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'pressure': pressure,
        'humidity': humidity,
        "uvi": uvi,
        'clouds': clouds,
        'visibility': visibility,
        'wind_speed': windSpeed,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}
