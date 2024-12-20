class OtherProfileModel {
  final String userName;
  final String profilePictureUrl;
  final String websiteUrl;
  final int posts;
  final List<String> img;

  OtherProfileModel(
    this.websiteUrl, {
    required this.userName,
    required this.profilePictureUrl,
    required this.posts,
    required this.img,
  });
}
