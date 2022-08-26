import 'package:flutter_burger_land/data/services/geo_service.dart';
import 'package:flutter_burger_land/data/models/location_entity.dart';
import 'package:flutter_burger_land/data/repository/location_repository.dart';

class LocationRepositoryImpl extends LocationRepository {
  final GeoService _geoService;

  LocationRepositoryImpl(this._geoService);

  @override
  Future<UserLocation> getLocation() async {
    var location = await _geoService.getLocation();
    return location;
  }
}
