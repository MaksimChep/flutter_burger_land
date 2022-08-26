import 'package:flutter_burger_land/data/repository/auth_repository.dart';

class CreateUserUC {
  final AuthRepository _authRepository;

  CreateUserUC(this._authRepository);

  Future<String> call(String email, String password) async {
    String uid = await _authRepository.createUserWithEmailAndPasswordAndSignIn(
        email, password);
    return uid;
  }
}
