import 'package:social_media_app/resources/export.dart';
import 'package:social_media_app/view_model/followers_and_following/followers_controller.dart';

class FollowersList extends StatelessWidget {
  const FollowersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<FollowersController>(
          init: FollowersController(),
          builder: (controller) {
            // Check loading state
            if (controller.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            // If no followers, show a message
            if (controller.followersList.isEmpty) {
              return Center(
                child: Text(
                  "No followers yet",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }
            return ListView.builder(
              itemCount: controller.followersList.length,
              itemBuilder: (context, index) {
                final follower = controller.followersList[index];
                return Container(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    follower.img,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    follower.fullName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    follower.username,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              FilledButton(
                                onPressed: () {
                                  Utils.unfollowBottomSheet();
                                },
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(59, 30),
                                    backgroundColor: Color(0xff6993FF),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)))),
                                child: Text('Remove',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                        Divider()
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
