import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../resources/assets_path.dart';

import '../../view_model/profile/profile_controller.dart';
import '../profile/widgets/rich_text_profile_widget.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.5,
          title: const Text(
            "My Profile",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            // Profile Section
            Container(
              height: 115,
              color: Colors.white,
              child: Center(
                child: Container(
                  height: 112,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      GetBuilder<ProfileController>(
                        builder: (controller) => Container(
                          height: 80,
                          width: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              controller.profile.profilePictureUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: GetBuilder<ProfileController>(
                          builder: (controller) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.profile.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                controller.profile.username,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 9),
                              Row(
                                children: [
                                  RichTextProfileWidget(
                                      num: controller.profile.posts.toString(),
                                      text: 'Post'),
                                  const SizedBox(width: 8),
                                  const CircleAvatar(
                                      radius: 2, backgroundColor: Colors.grey),
                                  const SizedBox(width: 8),
                                  RichTextProfileWidget(
                                      num: controller.profile.following
                                          .toString(),
                                      text: 'Following'),
                                  const SizedBox(width: 8),
                                  const CircleAvatar(
                                      radius: 2, backgroundColor: Colors.grey),
                                  const SizedBox(width: 8),
                                  RichTextProfileWidget(
                                      num: controller.profile.followers
                                          .toString(),
                                      text: 'Follower'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),

            // Tabs Section
            Container(
              color: Colors.white,
              child: TabBar(
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2.0, color: Colors.black),
                  insets: EdgeInsets.symmetric(horizontal: 30),
                ),
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AssetsPath.gridIcon),
                        const SizedBox(width: 5),
                        const Text("Grid view"),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AssetsPath.listIcon),
                        const SizedBox(width: 5),
                        const Text("List view"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // TabBarView Section
            Expanded(
              child: TabBarView(
                children: [
                  // Grid View
                  GetBuilder<ProfileController>(
                    builder: (controller) => MasonryGridView.builder(
                      padding: const EdgeInsets.all(8.0),
                      gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            AssetsPath.getImagePath(index),
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                      itemCount: controller.gridImages.length,
                    ),
                  ),

                  // List View
                  GetBuilder<ProfileController>(
                    builder: (controller) => ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: controller.gridImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                AssetsPath.getImagePath(index),
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              ),
                              const SizedBox(width: 10),
                              Text("Image $index"),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
