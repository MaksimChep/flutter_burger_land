import 'package:flutter_burger_land/data/models/user_data_entity.dart';
import 'package:flutter_burger_land/data/repository/user_data_repository.dart';

class GetUserDataUC {
  final UserDataRepository _userDataRepository;

  GetUserDataUC(this._userDataRepository);

  Future<UserData> call(String uid) async {
    var user = await _userDataRepository.getUserData(uid);
    return user;
  }
}
