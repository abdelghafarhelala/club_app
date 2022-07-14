class UserModel {
  bool? success;
  String? message;
  String? token;
  User? user;

  UserModel({this.success, this.message, this.token, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? role;
  String? image;
  String? department;
  String? mobileNumber;
  String? jobTitle;

  User(
      {this.id,
      this.name,
      this.email,
      this.role,
      this.image,
      this.department,
      this.mobileNumber,
      this.jobTitle});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    image = json['image'];
    department = json['department'];
    mobileNumber = json['mobile_number'];
    jobTitle = json['job_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['image'] = this.image;
    data['department'] = this.department;
    data['mobile_number'] = this.mobileNumber;
    data['job_title'] = this.jobTitle;
    return data;
  }
}
