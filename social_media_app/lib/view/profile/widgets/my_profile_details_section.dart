import 'package:social_media_app/resources/export.dart';
import 'package:social_media_app/view/follower_and_following/follower_and_following_view.dart';
import 'package:social_media_app/view/profile/widgets/rich_text_profile_widget.dart';

class MyProfileDetailsSection extends StatelessWidget {
  const MyProfileDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11.5.h,
      color: Colors.white,
      child: Center(
        child: Container(
          height: 11.2.h,
          width: 90.0.w,
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
              SizedBox(width: 2.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      RichTextProfileWidget(
                        num: '59',
                        text: 'Post',
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(radius: 2, backgroundColor: Colors.grey),
                      SizedBox(width: 2.w),
                      InkWell(
                        onTap: () {
                          Get.to(() => FollowerAndFollowingView());
                        },
                        child: RichTextProfileWidget(
                          num: '125',
                          text: 'Following',
                        ),
                      ),
                      SizedBox(width: 8),
                      const CircleAvatar(
                          radius: 2, backgroundColor: Colors.grey),
                      SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          Get.to(() => FollowerAndFollowingView());
                        },
                        child:
                            RichTextProfileWidget(num: '850', text: 'Follower'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
