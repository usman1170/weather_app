class HourlyWeatherData {
  List<Hourly> hourly;

  HourlyWeatherData({required this.hourly});
  factory HourlyWeatherData.fromJson(Map<String, dynamic> json) =>
      HourlyWeatherData(
          hourly:
              List<Hourly>.from(json["hourly"].map((e) => Hourly.fromJson(e))));
}

//
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

//
class Hourly {
  int? dt;
  int? temp;
  int? feelsLike;
  num? pressure;
  num? humidity;
  num? clouds;
  num? windSpeed;
  List<Weather>? weather;

  Hourly({
    this.dt,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.clouds,
    this.windSpeed,
    this.weather,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        dt: int.tryParse(json['dt'].toString()),
        temp: (json["temp"] as num?)?.round(),
        feelsLike: (json["feels_like"] as num?)?.round(),
        pressure: num.tryParse(json['pressure'].toString()),
        humidity: num.tryParse(json['humidity'].toString()),
        clouds: num.tryParse(json['clouds'].toString()),
        windSpeed: num.tryParse(json['wind_speed'].toString()),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        if (dt != null) 'dt': dt,
        if (temp != null) 'temp': temp,
        if (feelsLike != null) 'feels_like': feelsLike,
        if (pressure != null) 'pressure': pressure,
        if (humidity != null) 'humidity': humidity,
        if (clouds != null) 'clouds': clouds,
        if (windSpeed != null) 'wind_speed': windSpeed,
        if (weather != null)
          'weather': weather?.map((e) => e.toJson()).toList(),
      };
}
