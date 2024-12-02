import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media_app/resources/assets_path.dart';

class Utils {
  static AppBar customAppBar(String title) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.white,
    );
  }

  static void updateShowDialogue() {
    Get.defaultDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 300,
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Container(
                  width: 224,
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 60,
                      ),
                      Text(
                        "Profile Created",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        "update your name, profile image, additional number",
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 1.h),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(224, 36),
                            backgroundColor: Color(0xff4478FF),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4))),
                        child: Text(
                          "Update",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(224, 36),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4))),
                        child: Text(
                          "Skip",
                          style: TextStyle(color: Color(0xff4478FF)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void showCommentBottomSheet() {
    Get.bottomSheet(Container(
      height: 438,
      child: ListView(
        children: [
          Center(
            child: Container(
              height: 438,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  color: Colors.white),
              child: Column(
                children: [
                  SizedBox(height: 3.w),
                  Text(
                    "Comment",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(height: 1.w),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  //ListView
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.5.w),
                                    child: Center(
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.network(
                                            'https://randomuser.me/api/portraits/men/1.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Kathryn Annee",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 2.w),
                                          Text(
                                            "2 hours ago",
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 240,
                                        child: Text(
                                          "Nice picture you have captured 🔥 ",
                                          style: TextStyle(fontSize: 14.0),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          "Replay",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(right: 3.w),
                                    child: SvgPicture.asset(
                                        AssetsPath.loveLineIcon),
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.grey.shade300,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                'https://randomuser.me/api/portraits/men/1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            child: TextFormField(
                              decoration:
                                  InputDecoration(hintText: "Add Comment"),
                            ),
                          ),
                          Text("Post",
                              style: TextStyle(color: Color(0xffb4478FF))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  static void alertShowDialogue() {
    Get.defaultDialog(
      title: "",
      content: Column(
        children: [
          SizedBox(height: 1.h),
          Center(
            child: Container(
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Center(
                child: Container(
                  width: 224,
                  child: Column(
                    children: [
                      Icon(
                        Icons.error,
                        size: 60,
                      ),
                      Text(
                        "Do you want to post",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        "Your post will share by clicking yes, if need any change click on edit.",
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(104, 36),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4))),
                            child: Text(
                              "Edit",
                              style: TextStyle(color: Color(0xff4478FF)),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(104, 36),
                                backgroundColor: Color(0xff4478FF),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4))),
                            child: Text(
                              "Post Now",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void selectCameraOrGalleryShowDialogue() {
    Get.defaultDialog(
      title: "",
      content: Container(
        width: 256,
        height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(height: 1.h),
            Text(
              "Select Form",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetsPath.cameraIcon,
                      width: 88,
                      height: 88,
                    ),
                    Text("Camera"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetsPath.galleryIcon,
                      width: 88,
                      height: 88,
                    ),
                    Text("Gallery"),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  static void unfollowBottomSheet() {
    Get.bottomSheet(Container(
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.5.w),
                  child: Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          'https://randomuser.me/api/portraits/men/1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 3.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kathryn Annee",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Container(
                      width: 240,
                      child: Text(
                        "@shagor.a",
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
            ),
            TextButton.icon(
              onPressed: () {},
              label: Text(
                "Remove",
                style: TextStyle(color: Colors.red),
              ),
              icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
            )
          ],
        ),
      ),
    ));
  }
}
