class RemarkerModel {
  List<Data>? data;
  Links? links;
  Meta? meta;

  RemarkerModel({this.data, this.links, this.meta});

  RemarkerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
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
  String? fileType;
  String? filePath;
  String? desc;
  Null? employeeReply;
  Null? employeeCloseDate;
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
      this.fileType,
      this.filePath,
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

class Links {
  String? first;
  String? last;
  Null? prev;
  Null? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
