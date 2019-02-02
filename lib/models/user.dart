class AuthUserDetails {
  String accessToken;
  String expiresIn;
  _User userDetails;
  AuthUserDetails._({this.accessToken, this.expiresIn, this.userDetails});
  factory AuthUserDetails.fromJson(Map<String, dynamic> json) {
    return new AuthUserDetails._(
        accessToken: json["accessToken"],
        expiresIn: json["expires_in"],
        userDetails: _User.fromJson(json["userDetails "]));
  }
}
class _User {
  String id;
  String phoneNumber;
  String email;
  String userName;
  String firstName;
  String lastName;
  _User._(
      {this.id,
      this.phoneNumber,
      this.email,
      this.userName,
      this.firstName,
      this.lastName});
  factory _User.fromJson(Map<String, dynamic> json) {
    return new _User._(
        id: json["id"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        userName: json["userName"],
        firstName: json["firstName"],
        lastName: json["lastName"]);
  }
}
