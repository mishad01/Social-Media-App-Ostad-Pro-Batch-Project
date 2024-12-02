import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media_app/resources/app_colors.dart';
import 'package:social_media_app/view/home/widgets/main_bottom_navigation_bar.dart';

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (p0, p1, p2) {
        return GetMaterialApp(
          home: MainBottomNavigationBar(),
          theme: buildThemeData(),
        );
      },
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      fontFamily: 'Satoshi',
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: AppColors.grayColor.withOpacity(0.5)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.grayColor.withOpacity(0.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.themeColor,
            ),
          ),
          hintStyle: TextStyle(color: AppColors.grayColor.withOpacity(0.6))),
    );
  }
}
