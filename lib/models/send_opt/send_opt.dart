class SendOptModel {
  bool? success;
  String? message;
  Data? data;

  SendOptModel({this.success, this.message, this.data});

  SendOptModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<String>? email;

  Data({this.email});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'].cast<String>();
  }
}
