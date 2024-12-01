import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media_app/view/profile/widgets/rich_text_profile_widget.dart';

import '../../resources/assets_path.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
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
                  width: 410,
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            'https://st3.depositphotos.com/3776273/31836/i/450/depositphotos_318367382-stock-photo-portrait-of-a-handsome-young.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Ferdos Mondol",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "@mferdos12",
                            style: TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                          SizedBox(height: 9),
                          Row(
                            children: [
                              RichTextProfileWidget(num: '59', text: 'Post'),
                              SizedBox(width: 8),
                              CircleAvatar(radius: 2, backgroundColor: Colors.grey),
                              SizedBox(width: 8),
                              RichTextProfileWidget(num: '125', text: 'Following'),
                              SizedBox(width: 8),
                              CircleAvatar(radius: 2, backgroundColor: Colors.grey),
                              SizedBox(width: 8),
                              RichTextProfileWidget(num: '850', text: 'Follower'),
                            ],
                          ),
                        ],
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
                indicator: UnderlineTabIndicator(
                  borderSide: const BorderSide(width: 2.0, color: Colors.black),
                  insets: const EdgeInsets.symmetric(horizontal: 30),
                ),
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/grid.svg'),
                        const SizedBox(width: 5),
                        const Text("Grid view"),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/list.svg'),
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
                  MasonryGridView.builder(
                    padding: const EdgeInsets.all(8.0),  // Padding for the entire grid
                    gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      String imagePath = AssetsPath.getImagePath(index); // Get dynamic image path
                      return Padding(
                        padding: const EdgeInsets.all(8.0),  // Padding for each item inside the grid
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    itemCount: 10, // Adjust as per your assets
                  ),


                  // List View
                  ListView.builder(
                    padding: const EdgeInsets.all(8.0),  // Padding for the entire list
                    itemCount: 10, // Adjust as per your assets
                    itemBuilder: (context, index) {
                      String imagePath = AssetsPath.getImagePath(index); // Get dynamic image path
                      return Padding(
                        padding: const EdgeInsets.all(8.0),  // Padding for each item inside the list
                        child: Row(
                          children: [
                            Image.asset(
                              imagePath, // Use the dynamically fetched image path
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 10),
                            Text("Image $index"),
                          ],
                        ),
                      );
                    },
                  )


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
