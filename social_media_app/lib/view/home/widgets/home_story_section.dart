import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media_app/resources/assets_path.dart';

class HomeStorySection extends StatelessWidget {
  const HomeStorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> storyImg = [
      AssetsPath.profileImage1,
      AssetsPath.profileImage2,
      AssetsPath.profileImage3,
      AssetsPath.profileImage4,
    ];
    return Container(
      height: 186,
      color: Colors.white,
      child: ListView.builder(
        itemCount: storyImg.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              width: 120,
              height: 154,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  Container(
                    width: 128,
                    height: 145,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.grey,
                    ),
                    child: index == 0
                        ? Center(
                            child: SizedBox(
                              height: 50, // Adjusted size
                              width: 50,
                              child: SvgPicture.asset(
                                AssetsPath.addIcon,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Image.asset(
                            storyImg[index],
                            fit: BoxFit.fill,
                          ),
                  ),
                  SizedBox(height: 0.7.h),
                  Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
