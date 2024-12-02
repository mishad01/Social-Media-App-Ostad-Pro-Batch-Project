import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:social_media_app/resources/export.dart';
import 'package:social_media_app/view/profile/widgets/my_profile_details_section.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.5,
          title: const Text(
            "My Profile",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              // Profile Section
              MyProfileDetailsSection(),
              SizedBox(height: 0.8.h),
              // Tabs Section
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white, width: 1),
                  ),
                ),
                child: TabBar(
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                        width: 2.0, color: Colors.black.withOpacity(0.2)),
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
                      padding: const EdgeInsets.all(8.0),
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        String imagePath = AssetsPath.getImagePath(index);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
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
                      padding: const EdgeInsets.all(8.0),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        String imagePath = AssetsPath.getImagePath(index);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                imagePath,
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
      ),
    );
  }
}
