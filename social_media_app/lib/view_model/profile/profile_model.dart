class ProfileModel {
  final String name;
  final String username;
  final String profilePictureUrl;
  final int posts;
  final int followers;
  final int following;

  ProfileModel({
    required this.name,
    required this.username,
    required this.profilePictureUrl,
    required this.posts,
    required this.followers,
    required this.following,
  });
}
