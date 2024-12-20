import 'package:get/get.dart';
import 'package:social_media_app/resources/assets_path.dart';
import 'package:social_media_app/view_model/other_profile/other_profile_model.dart';

class OtherProfileController extends GetxController {
  final List<String> imageSet = [
    AssetsPath.ostadPromo1,
    AssetsPath.ostadPromo2,
    AssetsPath.ostadPromo3,
    AssetsPath.image7,
    AssetsPath.image8,
    AssetsPath.image5,
    AssetsPath.image4,
    AssetsPath.ostadPromo4,
    AssetsPath.ostadPromo5,
    AssetsPath.ostadPromo6,
  ];
  // Instance of OtherProfileModel
  late OtherProfileModel profile;

  // Loading state
  bool isLoading = false;

  // Method to fetch profile data
  void fetchProfileData() async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 2));

    // Mocked data
    profile = OtherProfileModel(
      "https://www.ostad.app",
      userName: "John Doe",
      profilePictureUrl: "https://randomuser.me/api/portraits/men/1.jpg",
      posts: 59,
      img: imageSet,
    );

    isLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchProfileData(); // Load profile data on initialization
  }
}
