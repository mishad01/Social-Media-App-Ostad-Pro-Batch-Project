
import 'package:get/get.dart';
import 'package:social_media_app/view_model/auth/login_controller.dart';
import 'package:social_media_app/view_model/auth/sign_up_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(SignUpController());

  }
}