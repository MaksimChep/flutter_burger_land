import 'package:flutter/widgets.dart';
import 'package:flutter_burger_land/data/models/location_entity.dart';
import 'package:flutter_burger_land/domain/get_location_uc.dart';

class LocationProvider with ChangeNotifier {
  final GetLocationUC _getLocationUC;

  LocationProvider(this._getLocationUC);

  UserLocation _location = UserLocation(country: '', city: '');
  late String _errorMessage;

  UserLocation get location => _location;
  String get errorMessage => _errorMessage;

  void getLocation() async {
    try {
      _location = await _getLocationUC();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }
}
