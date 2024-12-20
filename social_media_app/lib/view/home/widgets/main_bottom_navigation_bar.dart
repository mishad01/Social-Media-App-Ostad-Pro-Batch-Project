import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:social_media_app/resources/export.dart';
import 'package:social_media_app/view/other_profile/other_profile_view.dart';
import 'package:social_media_app/view/profile/profile_view.dart';
import 'package:social_media_app/view/search/search_view.dart';

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({super.key});

  @override
  State<MainBottomNavigationBar> createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  int currentIndex = 0;
  final List<Widget> _pages = [
    const OtherProfileView(),
    const SearchView(),
    Center(
      child: Text('Camera/Upload Screen'),
    ), // Placeholder for camera/gallery
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 2) {
            // Handle special case for camera/gallery dialog
            Utils.selectCameraOrGalleryShowDialogue();
          } else {
            setState(() {
              currentIndex = index;
            });
          }
        },
        backgroundColor: Colors.white,
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home, size: 24),
            title: Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search, size: 24),
            title: Text("Explore"),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.add, size: 24),
            title: Text("Upload"),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person, size: 24),
            title: Text("My Profile"),
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: _pages,
      ),
    );
  }
}
