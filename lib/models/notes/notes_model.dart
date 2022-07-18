class NotesModel {
  bool? success;
  String? message;
  Note? note;

  NotesModel({this.success, this.message, this.note});

  NotesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    note = json['note'] != null ? new Note.fromJson(json['note']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.note != null) {
      data['note'] = this.note!.toJson();
    }
    return data;
  }
}

class Note {
  int? id;
  String? noteCategory;
  String? noteStatus;
  int? seen;
  String? priority;
  String? club;
  Count? count;
  String? manager;
  String? employee;
  Null? fileType;
  Null? filePath;
  String? desc;
  Null? employeeReply;
  Null? employeeCloseDate;
  String? deadlineDate;
  String? createdAt;
  String? updatedAt;

  Note(
      {this.id,
      this.noteCategory,
      this.noteStatus,
      this.seen,
      this.priority,
      this.club,
      this.count,
      this.manager,
      this.employee,
      this.fileType,
      this.filePath,
      this.desc,
      this.employeeReply,
      this.employeeCloseDate,
      this.deadlineDate,
      this.createdAt,
      this.updatedAt});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noteCategory = json['note_category'];
    noteStatus = json['note_status'];
    seen = json['seen'];
    priority = json['priority'];
    club = json['club'];
    count = json['count'] != null ? new Count.fromJson(json['count']) : null;
    manager = json['manager'];
    employee = json['employee'];
    fileType = json['file_type'];
    filePath = json['file_path'];
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
    data['file_type'] = this.fileType;
    data['file_path'] = this.filePath;
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
