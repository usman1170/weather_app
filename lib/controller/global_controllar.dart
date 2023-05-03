import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/widgets/dialogs.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;
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
      }
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((value) {
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;
      _isLoading.value = false;
    });
  }
}
