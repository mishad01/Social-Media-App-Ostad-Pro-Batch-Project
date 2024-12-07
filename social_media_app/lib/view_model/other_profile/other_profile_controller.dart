import 'package:get/get.dart';

import 'other_profile_model.dart';

class OtherProfileController extends GetxController {
  OtherProfileModel profile = OtherProfileModel(
    profilePictureUrl:
    "https://st3.depositphotos.com/3776273/31836/i/450/depositphotos_318367382-stock-photo-portrait-of-a-handsome-young.jpg",
    websiteUrl: "https://www.mferdos.com",

    posts: 59,
    followers: 850,
    following: 125,
  );


  List<Map<String, dynamic>> gridPosts = [
    {"imagePath": "assets/images/image_0.png", "caption": "Beautiful sunset", "mediaType": "image"},
    {"imagePath": "assets/images/image_1.png", "caption": "Learning Flutter!", "mediaType": "image"},

  ];

  void updateProfile(OtherProfileModel newProfile) {
    profile = newProfile;
    update();
  }

  void addPost(String imagePath, String caption, String mediaType) {
    gridPosts.add({"imagePath": imagePath, "caption": caption, "mediaType": mediaType});
    update();
  }



  void updateWebsite(String newWebsiteUrl) {
    profile = OtherProfileModel(
      profilePictureUrl: profile.profilePictureUrl,
      websiteUrl: newWebsiteUrl,
      posts: profile.posts,
      followers: profile.followers,
      following: profile.following,
    );
    update();
  }
}
