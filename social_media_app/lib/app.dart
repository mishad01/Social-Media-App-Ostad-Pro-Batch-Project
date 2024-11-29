import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media_app/view/other_profile/other_profile_view.dart';

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (p0, p1, p2) {
        return GetMaterialApp(
          home: OtherProfileView(),
        );
      },
    );
  }
}
