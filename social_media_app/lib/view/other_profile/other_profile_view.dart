import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media_app/resources/assets_path.dart';
import 'package:social_media_app/view/other_profile/widgets/follow_and_message_button.dart';
import 'package:social_media_app/view/other_profile/widgets/grid_view_items.dart';
import 'package:social_media_app/view/other_profile/widgets/list_view_items.dart';
import 'package:social_media_app/view/other_profile/widgets/rich_text_profile.dart';

class OtherProfileView extends StatefulWidget {
  const OtherProfileView({super.key});

  @override
  State<OtherProfileView> createState() => _OtherProfileViewState();
}

class _OtherProfileViewState extends State<OtherProfileView> {
  final List<String> imageSet = [
    AssetsPath.ostadPromo1,
    AssetsPath.ostadPromo2,
    AssetsPath.ostadPromo3,
    AssetsPath.image7,
    AssetsPath.image8,
    AssetsPath.image5,
    AssetsPath.image4,
    AssetsPath.ostadPromo4,
    AssetsPath.ostadPromo5,
    AssetsPath.ostadPromo6,
  ];

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          const ProfileDetailsSection(),
          SizedBox(height: 1.h),
          ItemViewSection(imageSet: imageSet),
        ],
      ),
    );
  }
}

class ProfileDetailsSection extends StatelessWidget {
  const ProfileDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13.h,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        children: [
          Container(
            height: 12.h,
            width: 12.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: NetworkImage(
                    'https://randomuser.me/api/portraits/men/1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 5.w),
          // Profile Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    RichTextProfile(num: '59', text: 'Posts'),
                    RichTextProfile(num: '125', text: 'Following'),
                    RichTextProfile(num: '850', text: 'Followers'),
                  ],
                ),
                SizedBox(height: 1.h),
                Text(
                  'Visit: www.ostad.app',
                  style: TextStyle(fontSize: 10.sp, color: Colors.black),
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
                              TextStyle(fontSize: 10.sp, color: Colors.black)),
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
                              TextStyle(fontSize: 10.sp, color: Colors.black)),
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
