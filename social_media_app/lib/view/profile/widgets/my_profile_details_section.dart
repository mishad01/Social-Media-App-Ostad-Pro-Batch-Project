import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view/follower_and_following/follower_and_following_view.dart';
import 'rich_text_profile_widget.dart';

class MyProfileDetailsSection extends StatelessWidget {
  const MyProfileDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              'https://st3.depositphotos.com/3776273/31836/i/450/depositphotos_318367382-stock-photo-portrait-of-a-handsome-young.jpg',
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Ferdos Mondol",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                "@mferdos12",
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const RichTextProfileWidget(num: '59', text: 'Post'),
                  const SizedBox(width: 8),
                  const CircleAvatar(radius: 2, backgroundColor: Colors.grey),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => Get.to(() => const FollowerAndFollowingView()),
                    child: const RichTextProfileWidget(num: '125', text: 'Following'),
                  ),
                  const SizedBox(width: 8),
                  const CircleAvatar(radius: 2, backgroundColor: Colors.grey),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => Get.to(() => const FollowerAndFollowingView()),
                    child: const RichTextProfileWidget(num: '850', text: 'Follower'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
