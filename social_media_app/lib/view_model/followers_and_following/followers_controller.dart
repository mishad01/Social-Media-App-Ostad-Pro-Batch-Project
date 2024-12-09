import 'package:get/get.dart';
import 'package:social_media_app/view_model/followers_and_following/followers_model.dart';

class FollowersController extends GetxController {
  bool isLoading = false;
  List<FollowingModel> followersList = [];

  void fetchFollowersData() async {
    isLoading = true;
    update();

    await Future.delayed(Duration(seconds: 2));
    followersList = [
      FollowingModel("John Doe", "john_doe",
          "https://randomuser.me/api/portraits/men/1.jpg"),
      FollowingModel("Jane Smith", "jane_smith",
          "https://randomuser.me/api/portraits/women/2.jpg"),
      FollowingModel("Emily Davis", "emily_d",
          "https://randomuser.me/api/portraits/women/3.jpg"),
      FollowingModel("Michael Brown", "michael_b",
          "https://randomuser.me/api/portraits/men/4.jpg"),
      FollowingModel("Sarah Wilson", "sarah_w",
          "https://randomuser.me/api/portraits/women/5.jpg"),
    ];
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchFollowersData();
  }
}
