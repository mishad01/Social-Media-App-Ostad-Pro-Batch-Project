import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/resources/export.dart';

import 'package:social_media_app/view/other_profile/widgets/grid_view_items.dart';
import 'package:social_media_app/view/other_profile/widgets/list_view_items.dart';

import 'package:social_media_app/view/profile/widgets/my_profile_details_section.dart';
import 'package:social_media_app/view_model/profile/profile_controller.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "My Profile",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: [
              ProfileDetailsSection(controller: controller),
              SizedBox(height: 1.h),
              ItemViewSection(imageSet: controller.profile.img),
            ],
          );
        },
      ),
    );
  }
}

class ProfileDetailsSection extends StatelessWidget {
  final ProfileController controller;

  const ProfileDetailsSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 13.h,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: const Row(
        children: [
          MyProfileDetailsSection(),


        ],
      ),
    );
  }
}

class ItemViewSection extends StatelessWidget {
  final List<String> imageSet;

  const ItemViewSection({super.key, required this.imageSet});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 70.h,
      child: DefaultTabController(
        length: 2, // Number of tabs
        child: Column(
          children: [
            // TabBar
            TabBar(
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AssetsPath.gridIcon),
                      SizedBox(width: 2.w),
                      Text("Grid View",
                          style:
                          TextStyle(fontSize: 15.sp, color: Colors.black)),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AssetsPath.listIcon),
                      SizedBox(width: 2.w),
                      Text("List View",
                          style:
                          TextStyle(fontSize: 15.sp, color: Colors.black)),
                    ],
                  ),
                ),
              ],
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0, color: Colors.black),
                insets: EdgeInsets.symmetric(horizontal: 30),
              ),
            ),
            // TabBarView
            Expanded(
              child: TabBarView(
                children: [
                  GridViewItems(imageSet: imageSet),
                  ListViewItems(imageSet: imageSet),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
