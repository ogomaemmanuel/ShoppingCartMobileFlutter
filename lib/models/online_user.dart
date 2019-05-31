class OnlineUserModel {
  int id;
  String userName;
  String firstName;
  String lastName;
  String email;
  String imageUrl;
  OnlineUserModel._(
      {this.id, this.userName, this.firstName, this.lastName, this.email,this.imageUrl});
  factory OnlineUserModel.fromJson(Map<String, dynamic> json) {
    return new OnlineUserModel._(
        email: json["email"],
        id: json["id"],
        userName: json["userName"],
        lastName: json["lastName"],
         imageUrl: json["imageUrl"]??"",
         firstName:json["firstName"]
        );
       
  }
}
