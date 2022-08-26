import 'package:flutter_burger_land/data/models/user_data_entity.dart';

abstract class UserDataRepository {
  Future<UserData> getUserData(String uid);
  Future addUserData(UserData user, String uid);
}
