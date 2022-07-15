class ResetPasswordModel {
  bool? success;
  String? message;
  Data? data;

  ResetPasswordModel({this.success, this.message, this.data});

  ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<String>? email;
  List<String>? password;

  Data({this.email, this.password});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'].cast<String>();
    password = json['password'].cast<String>();
  }
}
