import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media_app/view_model/followers_and_following/following_controller.dart';

class FollowingList extends StatelessWidget {
  const FollowingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FollowingController>(
        init: FollowingController(),
        builder: (controller) {
          if (controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.followingList.isEmpty) {
            return Center(
              child: Text(
                "No following yet",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }
          return Expanded(
            child: ListView.builder(
              itemCount: controller.followingList.length,
              itemBuilder: (context, index) {
                final following = controller.followingList[index];
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
                                    following.img,
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
                                    following.fullName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    following.username,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              FilledButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(59, 30),
                                    backgroundColor: Color(0xFFEAECF0),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)))),
                                child: Text('Following',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black)),
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
            ),
          );
        });
  }
}
