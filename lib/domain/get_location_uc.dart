import 'package:flutter_burger_land/data/models/location_entity.dart';
import 'package:flutter_burger_land/data/repository/location_repository.dart';

class GetLocationUC {
  final LocationRepository _locationRepository;

  GetLocationUC(this._locationRepository);

  Future<UserLocation> call() async {
    var location = await _locationRepository.getLocation();
    return location;
  }
}
