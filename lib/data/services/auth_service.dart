import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);

    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      currentUser.reload();
    }
    return currentUser!.uid;
  }

  Future<String> createUserWithEmailAndPasswordAndSignIn(
      String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    String uid = await signInWithEmailAndPassword(email, password);
    return uid;
  }
}
