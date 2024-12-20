class ProfileModel {
  final String userName;
  final String profilePictureUrl;
  final int posts;
  final int followers;
  final int following;
  final List<String> img;

  ProfileModel({
    required this.userName,
    required this.profilePictureUrl,
    required this.posts,
    required this.followers,
    required this.following,
    required this.img,
  });
}
