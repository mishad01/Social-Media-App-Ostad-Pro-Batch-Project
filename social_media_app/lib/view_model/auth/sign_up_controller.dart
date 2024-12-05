import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../firebase_auth_services.dart';

class SignUpController extends GetxController {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  String _errorMessage = '';
  bool _signUpApiProgress = false;

  bool get signUpApiInProgress => _signUpApiProgress;
  String get errorMessage => _errorMessage;

  Future<bool> signUp(String email, String password) async {
    bool isSuccess = false;
    _signUpApiProgress = true;
    update();

    try {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': email,
        });

        Get.snackbar('Sign Up', 'User successfully created');
        Get.toNamed('/login');
        isSuccess = true;
      } else {
        _errorMessage = 'Sign-up failed. Please try again.';
        Get.snackbar('Error', _errorMessage);
      }
    } catch (e) {
      _errorMessage = e.toString();
      Get.snackbar('Error', _errorMessage);
    } finally {
      _signUpApiProgress = false;
      update();
    }

    return isSuccess;
  }
}
