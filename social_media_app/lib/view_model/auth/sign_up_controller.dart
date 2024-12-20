import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:social_media_app/data/services/firebase_auth_services.dart';
import 'package:social_media_app/view/auth/login/login_view.dart';

class SignUpController extends GetxController {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  String _errorMessage = '';
  bool _signUpApiProgress = false;

  // Getters for exposing the private variables
  bool get signUpApiInProgress => _signUpApiProgress;
  String get errorMessage => _errorMessage;

  /// Method to sign up a user using email and password
  Future<bool> signUp(String email, String password) async {
    bool isSuccess = false;
    _signUpApiProgress = true;
    update();

    try {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if (user != null) {
        // Save user information in Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': email,
          'createdAt': DateTime.now(),
        });

        Get.snackbar('Sign Up', 'User is successfully created',
            snackPosition: SnackPosition.TOP);
        isSuccess = true;
        Get.offAll(LoginView());
      } else {
        _errorMessage = 'Sign-up failed. Please try again.';
        Get.snackbar('Error', _errorMessage,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      _errorMessage = e.toString();
      Get.snackbar('Error', _errorMessage, snackPosition: SnackPosition.BOTTOM);
    } finally {
      _signUpApiProgress = false;
      update();
    }

    return isSuccess;
  }
}
