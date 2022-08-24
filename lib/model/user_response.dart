class UserResponse {
  String? type;
  String? message;
  User? data;

  UserResponse({this.type, this.message, this.data});

  UserResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class User {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;
  int? userPoints;
  List<String?>? userNotification;
 
  User(
      {this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.imageUrl,
      this.address,
      this.role,
      this.userPoints,
      this.userNotification});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
    userPoints = json['UserPoints'];
    if (json['UserNotification'] != null) {
      userNotification = <Null>[];
      json['UserNotification'].forEach((v) {
        userNotification!.add(v.fromJson(v));
      });
    }
  }
  User.fromJsonUp(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
    userPoints = json['UserPoints'];
    if (json['UserNotification'] != null) {
      userNotification = <Null>[];
      json['UserNotification'].forEach((v) {
        userNotification!.add(v.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['imageUrl'] = this.imageUrl;
    data['address'] = this.address;
    data['role'] = this.role;
    data['UserPoints'] = this.userPoints;
    if (this.userNotification != null) {
      /*data['UserNotification'] = this
          .userNotification!
          .map((v) => (v != null) ? v.toJson() : null)
          .toList();*/
    }
    return data;
  }
}
