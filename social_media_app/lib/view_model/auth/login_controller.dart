import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:social_media_app/data/services/firebase_auth_services.dart';

class LogInController extends GetxController {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  bool _signInApiInProgress = false;
  String _errorMessage = '';

  bool get logInApiInProgress => _signInApiInProgress;

  String get errorMessage => _errorMessage;

  Future<bool> signIn(String email, String password) async {
    bool isSuccess = false;
    _signInApiInProgress = true;
    update();
    User? user = await _auth.signInWithEmailAndPassword(email, password);
    if (user != null) {
      isSuccess = true;
    } else {
      _errorMessage = 'Something went wrong';
    }
    _signInApiInProgress = false;
    update();
    return isSuccess;
  }
}
