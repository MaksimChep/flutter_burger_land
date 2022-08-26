import 'package:flutter_burger_land/data/models/location_entity.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GeoService {
  Future<UserLocation> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    UserLocation standartLocation = UserLocation(country: '', city: '');

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return standartLocation;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return standartLocation;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return standartLocation;
    }
    Position position = await Geolocator.getCurrentPosition(
        forceAndroidLocationManager: true,
        desiredAccuracy: LocationAccuracy.high);
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    UserLocation location = UserLocation(
        city: placemarks[0].locality!, country: placemarks[0].country!);
    return location;
  }
}
