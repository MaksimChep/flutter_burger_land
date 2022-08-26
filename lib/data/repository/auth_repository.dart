abstract class AuthRepository {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPasswordAndSignIn(
      String email, String password);
}
