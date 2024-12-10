import 'package:get/get.dart';
import 'package:social_media_app/resources/assets_path.dart';
import 'package:social_media_app/view_model/profile/profile_model.dart';

class ProfileController extends GetxController {
  final List<String> imageSet = [
    AssetsPath.image1,
    AssetsPath.image2,
    AssetsPath.image3,
    AssetsPath.image4,
    AssetsPath.image5,
    AssetsPath.image6,
    AssetsPath.image7,
    AssetsPath.image8,
    AssetsPath.image9,
    AssetsPath.image10,
  ];

  late ProfileModel profile;

  bool isLoading = false;

  void fetchProfileData() async {
    isLoading = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    profile = ProfileModel(
      userName: "Ferdos Mondol",
      profilePictureUrl:
      "https://st3.depositphotos.com/3776273/31836/i/450/depositphotos_318367382-stock-photo-portrait-of-a-handsome-young.jpg",
      posts: 59,
      followers: 850,
      following: 125,
      img: imageSet,
    );

    isLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
  }
}
