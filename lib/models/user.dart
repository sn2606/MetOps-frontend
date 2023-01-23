/// Model for an authorized user of the app.
class User {
  int id;
  String username;
  String fullName;
  String email;
  String phoneNo;
  String accessToken;
  String refreshToken;

  User({
    required this.id,
    required this.username,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.accessToken,
    required this.refreshToken,
  });
}
