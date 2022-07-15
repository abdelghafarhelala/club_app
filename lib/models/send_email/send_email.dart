class SendEmailModel {
  bool? success;
  String? message;

  SendEmailModel({this.success, this.message});

  SendEmailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }
}
