import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  List<String> imageSet = [
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
        title: Text(
          "Ostad App",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          ProfileDetailsSection(),
          SizedBox(height: 1.h),
          ItemViewSection(imageSet: imageSet),
        ],
      ),
    );
  }
}

class ProfileDetailsSection extends StatelessWidget {
  const ProfileDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      color: Colors.white,
      child: Center(
        child: Container(
          height: 85,
          width: 383,
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    'https://randomuser.me/api/portraits/men/1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 4.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RichTextProfile(num: '59', text: 'Post'),
                      SizedBox(width: 5.w),
                      RichTextProfile(num: '125', text: 'Following'),
                      SizedBox(width: 5.w),
                      RichTextProfile(num: '850', text: 'Follower'),
                    ],
                  ),
                  SizedBox(height: 0.3.h),
                  Text('Visit : www.ostad.app'),
                  FollowAndMessageButton()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemViewSection extends StatelessWidget {
  const ItemViewSection({
    super.key,
    required this.imageSet,
  });

  final List<String> imageSet;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 200, // Adjust width to fit the tabs
      color: Colors.white,
      child: DefaultTabController(
        length: 2,
        // Number of tabs
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/grid.svg'),
                      SizedBox(width: 1.w),
                      Text("Grid view"),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/list.svg'),
                      SizedBox(width: 1.w),
                      Text("List view"),
                    ],
                  ),
                ),
              ],
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0, color: Colors.black),
                insets: EdgeInsets.symmetric(horizontal: 30),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  GridViewItems(imageSet: imageSet),
                  ListViewItems(imageSet: imageSet),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
