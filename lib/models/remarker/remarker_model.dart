class RemarkerModel {
  bool? success;
  String? message;
  List<Data>? data;

  RemarkerModel({this.success, this.message, this.data});

  RemarkerModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? noteCategory;
  String? noteStatus;
  int? seen;
  String? priority;
  String? club;
  Count? count;
  String? manager;
  String? employee;
  int? gallery;
  List<ListGallery>? listGallery;
  String? desc;
  String? employeeReply;
  String? employeeCloseDate;
  String? deadlineDate;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.noteCategory,
      this.noteStatus,
      this.seen,
      this.priority,
      this.club,
      this.count,
      this.manager,
      this.employee,
      this.gallery,
      this.listGallery,
      this.desc,
      this.employeeReply,
      this.employeeCloseDate,
      this.deadlineDate,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noteCategory = json['note_category'];
    noteStatus = json['note_status'];
    seen = json['seen'];
    priority = json['priority'];
    club = json['club'];
    count = json['count'] != null ? new Count.fromJson(json['count']) : null;
    manager = json['manager'];
    employee = json['employee'];
    gallery = json['gallery'];
    if (json['list_gallery'] != null) {
      listGallery = <ListGallery>[];
      json['list_gallery'].forEach((v) {
        listGallery!.add(new ListGallery.fromJson(v));
      });
    }
    desc = json['desc'];
    employeeReply = json['employee_reply'];
    employeeCloseDate = json['employee_close_date'];
    deadlineDate = json['deadline_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['note_category'] = this.noteCategory;
    data['note_status'] = this.noteStatus;
    data['seen'] = this.seen;
    data['priority'] = this.priority;
    data['club'] = this.club;
    if (this.count != null) {
      data['count'] = this.count!.toJson();
    }
    data['manager'] = this.manager;
    data['employee'] = this.employee;
    data['gallery'] = this.gallery;
    if (this.listGallery != null) {
      data['list_gallery'] = this.listGallery!.map((v) => v.toJson()).toList();
    }
    data['desc'] = this.desc;
    data['employee_reply'] = this.employeeReply;
    data['employee_close_date'] = this.employeeCloseDate;
    data['deadline_date'] = this.deadlineDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Count {
  int? comments;
  int? members;

  Count({this.comments, this.members});

  Count.fromJson(Map<String, dynamic> json) {
    comments = json['comments'];
    members = json['members'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comments'] = this.comments;
    data['members'] = this.members;
    return data;
  }
}

class ListGallery {
  int? id;
  String? file;
  String? fileType;

  ListGallery({this.id, this.file, this.fileType});

  ListGallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    file = json['file'];
    fileType = json['file_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['file'] = this.file;
    data['file_type'] = this.fileType;
    return data;
  }
}
