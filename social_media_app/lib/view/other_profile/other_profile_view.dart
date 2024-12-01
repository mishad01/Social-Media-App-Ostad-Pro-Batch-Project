import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media_app/view/other_profile/widgets/rich_text_profile.dart';

class OtherProfileView extends StatefulWidget {
  const OtherProfileView({super.key});

  @override
  State<OtherProfileView> createState() => _OtherProfileViewState();
}

class _OtherProfileViewState extends State<OtherProfileView> {
  List<String> imageSet = [
    'assets/icons/1.jpg',
    'assets/icons/3.jpg',
    'assets/icons/4.jpg',
    'assets/icons/5.png',
    'assets/icons/6.jpg',
    'assets/icons/7.jpg',
    'assets/icons/8.jpg',
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
          Container(
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
                        /* Text(
                          "Ferdous Mondol",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "@mferdous12",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 0.9.h),*/
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
                        Row(
                          children: [
                            FilledButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(59, 30),
                                  backgroundColor: Color(0xffEAECF0),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)))),
                              child: Text('Follow',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black)),
                            ),
                            SizedBox(width: 3.w),
                            FilledButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(59, 30),
                                  backgroundColor: Color(0xffEAECF0),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)))),
                              child: Text('Message',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black)),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 1.h),
          Container(
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
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 2.0, color: Colors.black),
                      insets: EdgeInsets.symmetric(horizontal: 30),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Center(
                          child: MasonryGridView.builder(
                            gridDelegate:
                                const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(imageSet[index]),
                            ),
                            itemCount: imageSet.length,
                          ),
                        ),
                        Center(
                            child: ListView.builder(
                          itemCount: imageSet.length,
                          itemBuilder: (context, index) {
                            return Image.asset(imageSet[index]);
                          },
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
