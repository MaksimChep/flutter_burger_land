import 'package:flutter/widgets.dart';
import 'package:flutter_burger_land/data/models/user_data_entity.dart';
import 'package:flutter_burger_land/domain/add_user_data_uc.dart';
import 'package:flutter_burger_land/domain/get_user_data_uc.dart';

class UserDataProvider with ChangeNotifier {
  final GetUserDataUC _getUserDataUC;
  final AddUserDataUC _addUserDataUC;

  UserDataProvider(this._getUserDataUC, this._addUserDataUC);

  UserData _userData = UserData();
  late String _errorMessage;

  UserData get userData => _userData;
  String get errorMessage => _errorMessage;

  Future<void> getUserData(String uid) async {
    try {
      _userData = await _getUserDataUC(uid);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  void addUserData(UserData user, String uid) async {
    try {
      await _addUserDataUC(user, uid);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }
}
