import 'package:social_media_app/resources/export.dart';
import 'package:social_media_app/view/auth/login/widgets/custom_text_field.dart';
import 'package:social_media_app/view/home/widgets/main_bottom_navigation_bar.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Utils.appBarIcon(),
      ),
      body: SingleChildScrollView(
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
                      'Inter your phone number and password',
                      style: TextStyle(
                        color: Color(0xff101828),
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    const CustomTextField(
                      prefixImg: AssetsPath.envelopeIcon,
                      hintText: "Email",
                      hintTextDetails: "Input Email",
                    ),
                    SizedBox(height: 2.h),
                    const CustomTextField(
                      prefixImg: AssetsPath.lockIcon,
                      suffixImg: AssetsPath.eyeIcon,
                      hintText: "Password",
                      hintTextDetails: "Input Password",
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
                    ElevatedButton(
                      onPressed: () {
                        Get.offAll(() => MainBottomNavigationBar());
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
