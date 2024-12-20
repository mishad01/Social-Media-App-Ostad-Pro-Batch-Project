import 'package:get/get.dart';
import 'package:social_media_app/view_model/followers_and_following/followers_model.dart';

class FollowingController extends GetxController {
  bool isLoading = false;
  List<FollowingModel> followingList = [];

  void fetchFollowingData() async {
    isLoading = true;
    update();

    await Future.delayed(Duration(seconds: 2));
    followingList = [
      FollowingModel("John Doe", "john_doe",
          "https://randomuser.me/api/portraits/men/5.jpg"),
      FollowingModel("Jane Smith", "jane_smith",
          "https://randomuser.me/api/portraits/women/6.jpg"),
      FollowingModel("Emily Davis", "emily_d",
          "https://randomuser.me/api/portraits/women/7.jpg"),
      FollowingModel("Michael Brown", "michael_b",
          "https://randomuser.me/api/portraits/men/8.jpg"),
      FollowingModel("Sarah Wilson", "sarah_w",
          "https://randomuser.me/api/portraits/women/9.jpg"),
    ];

    isLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchFollowingData();
  }
}
