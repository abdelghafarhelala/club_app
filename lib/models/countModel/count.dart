class CountModel {
  bool? success;
  int? projects;
  int? members;

  CountModel({this.success, this.projects, this.members});

  CountModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    projects = json['projects'];
    members = json['members'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['projects'] = this.projects;
    data['members'] = this.members;
    return data;
  }
}