import 'package:social_media_app/resources/export.dart';
import 'package:social_media_app/view/auth/login/widgets/custom_text_field.dart';
import 'package:get/get.dart';

import '../../../view_model/auth/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailTEController = TextEditingController();
  final _passwordTEController = TextEditingController();
  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Utils.appBarIcon(),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formState,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 12.h),
                Container(
                  width: 75.w,
                  height: 50.h,
                  child: Column(
                    children: [
                      const Text(
                        'Enter your email and password',
                        style: TextStyle(
                          color: Color(0xff101828),
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      CustomTextField(
                        prefixImg: AssetsPath.envelopeIcon,
                        hintText: "Email",
                        hintTextDetails: "Input Email",
                        controller: _emailTEController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          final emailRegex = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 2.h),
                      CustomTextField(
                        prefixImg: AssetsPath.lockIcon,
                        suffixImg: AssetsPath.eyeIcon,
                        hintText: "Password",
                        hintTextDetails: "Input Password",
                        controller: _passwordTEController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          const Icon(
                            Icons.check_box_outline_blank,
                            color: Colors.black,
                          ),
                          SizedBox(width: 2.w),
                          const Text(
                            'Save password',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      GetBuilder<LoginController>(
                        builder: (loginController) {
                          return Visibility(
                            visible:
                                loginController.signInApiInProgress == false,
                            replacement:
                                Center(child: CircularProgressIndicator()),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formState.currentState!.validate()) {
                                  bool success = await loginController.signIn(
                                      _emailTEController.text,
                                      _passwordTEController.text);
                                  if (success) {
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text(loginController.errorMessage),
                                      ),
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.themeColor,
                                minimumSize: const Size.fromHeight(36),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                elevation: 2,
                              ),
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }
}
