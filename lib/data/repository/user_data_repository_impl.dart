import 'package:flutter_burger_land/data/services/firestore_service.dart';
import 'package:flutter_burger_land/data/models/user_data_entity.dart';
import 'package:flutter_burger_land/data/repository/user_data_repository.dart';

class UserDataRepositoryImpl extends UserDataRepository {
  final FirestoreService _firestoreService;

  UserDataRepositoryImpl(this._firestoreService);

  @override
  Future<UserData> getUserData(String uid) async {
    var user = await _firestoreService.getUserData(uid);
    return user;
  }

  @override
  Future addUserData(UserData user, String uid) async {
    await _firestoreService.addUserData(user, uid);
  }
}
