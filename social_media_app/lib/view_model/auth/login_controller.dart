import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../firebase_auth_services.dart';

class LoginController extends GetxController {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  bool _signInApiInProgress = false;
  String _errorMessage = '';

  bool get signInApiInProgress => _signInApiInProgress;
  String get errorMessage => _errorMessage;

  Future<bool> signIn(String email, String password) async {
    bool isSuccess = false;
    _signInApiInProgress = true;
    update();

    try {
      User? user = await _auth.signInWithEmailAndPassword(email, password);
      if (user != null) {
        isSuccess = true;

        Get.toNamed('/home');
      } else {
        _errorMessage = 'Invalid email or password';
        Get.snackbar('Login Failed', _errorMessage);
      }
    } catch (e) {
      _errorMessage = e.toString();
      Get.snackbar('Error', _errorMessage);
    }

    _signInApiInProgress = false;
    update();
    return isSuccess;
  }
}
