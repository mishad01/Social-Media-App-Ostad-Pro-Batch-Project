import 'package:social_media_app/resources/export.dart';
import 'package:social_media_app/view/auth/login/widgets/custom_text_field.dart';
import 'package:get/get.dart';

import '../../../view_model/auth/sign_up_controller.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _emailTEController = TextEditingController();
  final _passwordTEController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
                        'Create Account',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
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
                        suffixImg: null,
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
                      CustomTextField(
                        prefixImg: AssetsPath.lockIcon,
                        suffixImg: null,
                        hintText: "Confirm Password",
                        hintTextDetails: "Confirm Password",
                        controller: _confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          if (value != _passwordTEController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 4.h),
                      GetBuilder<SignUpController>(
                        builder: (signUpController) {
                          return Visibility(
                            visible: !signUpController.signUpApiInProgress,
                            replacement: const Center(child: CircularProgressIndicator()),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formState.currentState!.validate()) {
                                  bool isSuccess = await signUpController.signUp(
                                    _emailTEController.text,
                                    _passwordTEController.text,
                                  );
                                  if (!isSuccess) {
                                    Get.snackbar('Sign Up Failed', 'Please try again later.');
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
                                'Sign Up',
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
    _confirmPasswordController.dispose();
  }
}
