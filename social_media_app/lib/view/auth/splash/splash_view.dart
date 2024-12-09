import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app/resources/export.dart';
import 'package:social_media_app/view/auth/signup/sign_up_view.dart';
import 'package:social_media_app/view/home/home_view.dart';
import 'package:social_media_app/view/home/widgets/main_bottom_navigation_bar.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.offAll(HomeView()); // Replace with your main screen route
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SociaLive',
              style: GoogleFonts.lobster(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => SignUpView());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff4478FF),
                minimumSize: Size(295, 42),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 2,
              ),
              child: const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600, // Semi-bold
                  color: Colors.white, // Text color
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => MainBottomNavigationBar());
              },
              child: RichText(
                text: const TextSpan(
                  text: 'Log In',
                  style: TextStyle(
                    color: AppColors.themeColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 22,
                        color: AppColors.themeColor,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
