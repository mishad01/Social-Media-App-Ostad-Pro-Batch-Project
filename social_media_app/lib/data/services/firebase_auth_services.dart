import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (error) {
      print('Some error  Occur');
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (error) {
      print('Some error Occur');
    }
    return null;
  }
}
