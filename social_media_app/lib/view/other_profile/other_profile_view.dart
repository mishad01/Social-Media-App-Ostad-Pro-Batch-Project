import 'package:social_media_app/resources/export.dart';
import 'package:social_media_app/view/other_profile/widgets/follow_and_message_button.dart';
import 'package:social_media_app/view/other_profile/widgets/grid_view_items.dart';
import 'package:social_media_app/view/other_profile/widgets/list_view_items.dart';
import 'package:social_media_app/view/other_profile/widgets/rich_text_profile.dart';
import 'package:social_media_app/view_model/other_profile/other_profile_controller.dart';

class OtherProfileView extends StatelessWidget {
  const OtherProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // Bind controller
    final OtherProfileController controller = Get.put(OtherProfileController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Ostad App",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: GetBuilder<OtherProfileController>(
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
  final OtherProfileController controller;

  const ProfileDetailsSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final profile = controller.profile;

    return Container(
      height: 13.h,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        children: [
          Container(
            height: 10.h,
            width: 20.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(profile.profilePictureUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichTextProfile(num: '${profile.posts}', text: 'Posts'),
                    const RichTextProfile(num: '125', text: 'Following'),
                    const RichTextProfile(num: '850', text: 'Followers'),
                  ],
                ),
                SizedBox(height: 1.h),
                Text(
                  profile.websiteUrl,
                  style: TextStyle(fontSize: 15.sp, color: Colors.black),
                ),
                SizedBox(height: 1.h),
                const FollowAndMessageButton(),
              ],
            ),
          ),
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
