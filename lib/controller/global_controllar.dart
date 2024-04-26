import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/fetch_weatherdata.dart';
import 'package:weather_app/models/weather_data.dart';

const apiKey = "43d16083365db7948c86cb2601d5049c";
const newKey = "066300b3cf92c1fec10cd7462e7a42ff";

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;
  final weatherData = WeatherData().obs;
  WeatherData getWeatherValues() {
    return weatherData.value;
  }

  @override
  void onInit() {
    _isLoading.isTrue ? getLocation() : null;
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      await Future.error("Location is not available");
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      await Future.error("Location permission is not available");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        await Future.error("Location permission is denied");
        locationPermission = await Geolocator.requestPermission();
      }
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((value) {
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;
      // calling weather api
      return FetchWeather()
          .getWeatherData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }
}
