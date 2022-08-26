import 'package:flutter_burger_land/data/models/user_data_entity.dart';
import 'package:flutter_burger_land/data/repository/user_data_repository.dart';

class AddUserDataUC {
  final UserDataRepository _userDataRepository;

  AddUserDataUC(this._userDataRepository);

  Future call(UserData user, String uid) async {
    await _userDataRepository.addUserData(user, uid);
  }
}
