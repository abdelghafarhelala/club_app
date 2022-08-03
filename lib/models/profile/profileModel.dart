class ProfileModel {
  Data? data;

  ProfileModel({this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? role;
  String? image;
  String? department;
  String? mobileNumber;
  String? jobTitle;
  String? active;

  Data(
      {this.id,
      this.name,
      this.email,
      this.role,
      this.image,
      this.department,
      this.mobileNumber,
      this.jobTitle,
      this.active});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    image = json['image'];
    department = json['department'];
    mobileNumber = json['mobile_number'];
    jobTitle = json['job_title'];
    active = json['active'];
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
    data['active'] = this.active;
    return data;
  }
}
