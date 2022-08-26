import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_burger_land/domain/create_user_uc.dart';
import 'package:flutter_burger_land/domain/sign_in_uc.dart';

class AuthProvider with ChangeNotifier {
  final CreateUserUC _createUserUC;
  final SignInUC _signInUC;

  AuthProvider(this._createUserUC, this._signInUC);

  late String _uid;
  String _errorMessage = "";

  String get uid => _uid;
  String get errorMessage => _errorMessage;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      _uid = await _signInUC(email, password);
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message!;
    } finally {
      notifyListeners();
    }
  }

  Future<void> createUserWithEmailAndPasswordAndSignIn(
      String email, String password) async {
    try {
      _uid = await _createUserUC(email, password);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  void resetErrorMessage() {
    _errorMessage = "";
  }
}
