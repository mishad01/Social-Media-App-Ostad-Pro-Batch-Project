import 'package:social_media_app/data/services/firebase_auth_services.dart';
import 'package:social_media_app/resources/export.dart';
import 'package:social_media_app/view/auth/login/login_view.dart';
import 'package:social_media_app/view/home/widgets/home_story_section.dart';
import 'package:social_media_app/view/home/widgets/post_view_section.dart';
import 'package:social_media_app/view/notification/notification_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> postImg = [
    AssetsPath.image20,
    AssetsPath.image13,
    AssetsPath.image9,
    AssetsPath.image16,
    AssetsPath.image17,
    AssetsPath.image18,
    AssetsPath.image19,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Utils.updateShowDialogue();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                'https://randomuser.me/api/portraits/men/1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Center(
          child: Text('SocialLive',
              style: GoogleFonts.lobster(
                  fontWeight: FontWeight.bold, fontSize: 25)),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => NotificationView());
            },
            child: SvgPicture.asset(
              AssetsPath.notificationIcon,
              width: 24,
              height: 24,
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset(AssetsPath.messageIcon),
          ),
          IconButton(
              onPressed: () async {
                await FirebaseAuthServices.auth.signOut();
                Get.offAll(LoginView());
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            HomeStorySection(),
            SizedBox(height: 2.h),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: postImg.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      PostViewSection(
                        img: postImg[index],
                      ),
                      SizedBox(height: 1.h),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
