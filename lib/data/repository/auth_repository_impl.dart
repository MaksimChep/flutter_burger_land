import 'package:flutter_burger_land/data/services/auth_service.dart';
import 'package:flutter_burger_land/data/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    String uid = await _authService.signInWithEmailAndPassword(email, password);
    return uid;
  }

  @override
  Future<String> createUserWithEmailAndPasswordAndSignIn(
      String email, String password) async {
    String uid = await _authService.createUserWithEmailAndPasswordAndSignIn(
        email, password);
    return uid;
  }
}
