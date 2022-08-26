import 'package:flutter_burger_land/data/models/location_entity.dart';

abstract class LocationRepository {
  Future<UserLocation> getLocation();
}
