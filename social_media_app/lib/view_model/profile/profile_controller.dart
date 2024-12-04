import 'package:get/get.dart';
import 'package:social_media_app/view_model/profile/profile_model.dart';

class ProfileController extends GetxController {
  ProfileModel profile = ProfileModel(
    name: "Ferdos Mondol",
    username: "@mferdos12",
    profilePictureUrl:
    "https://st3.depositphotos.com/3776273/31836/i/450/depositphotos_318367382-stock-photo-portrait-of-a-handsome-young.jpg",
    posts: 59,
    followers: 850,
    following: 125,
  );

  List<String> gridImages =
  List.generate(10, (index) => "assets/images/image_$index.png");

  void updateProfile(ProfileModel newProfile) {
    profile = newProfile;
    update(); // Notify GetBuilder to rebuild widgets
  }

  void addImage(String imagePath) {
    gridImages.add(imagePath);
    update();
  }
}
