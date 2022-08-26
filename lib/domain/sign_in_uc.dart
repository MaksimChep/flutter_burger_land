import 'package:flutter_burger_land/data/repository/auth_repository.dart';

class SignInUC {
  final AuthRepository _authRepository;

  SignInUC(this._authRepository);

  Future<String> call(String email, String password) async {
    String uid =
        await _authRepository.signInWithEmailAndPassword(email, password);
    return uid;
  }
}
