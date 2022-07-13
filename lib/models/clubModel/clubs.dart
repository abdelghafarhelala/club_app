class clubsModel {
  List<Data>? data;
  Links? links;
  Meta? meta;

  clubsModel({this.data, this.links, this.meta});

  clubsModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? area;
  String? constructionRatio;
  int? membershipsNumber;
  int? membersNumber;
  String? managerName;
  String? securityManagerName;
  int? employeesNumber;
  int? salesPointsNumber;
  int? shopsNumber;
  String? image;
  String? project;
  String? city;
  String? projectStatus;
  String? lat;
  String? lng;

  Data(
      {this.id,
      this.name,
      this.area,
      this.constructionRatio,
      this.membershipsNumber,
      this.membersNumber,
      this.managerName,
      this.securityManagerName,
      this.employeesNumber,
      this.salesPointsNumber,
      this.shopsNumber,
      this.image,
      this.project,
      this.city,
      this.projectStatus,
      this.lat,
      this.lng});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    area = json['area'];
    constructionRatio = json['construction_ratio'];
    membershipsNumber = json['memberships_number'];
    membersNumber = json['members_number'];
    managerName = json['manager_name'];
    securityManagerName = json['security_manager_name'];
    employeesNumber = json['employees_number'];
    salesPointsNumber = json['sales_points_number'];
    shopsNumber = json['shops_number'];
    image = json['image'];
    project = json['project'];
    city = json['city'];
    projectStatus = json['project_status'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['area'] = this.area;
    data['construction_ratio'] = this.constructionRatio;
    data['memberships_number'] = this.membershipsNumber;
    data['members_number'] = this.membersNumber;
    data['manager_name'] = this.managerName;
    data['security_manager_name'] = this.securityManagerName;
    data['employees_number'] = this.employeesNumber;
    data['sales_points_number'] = this.salesPointsNumber;
    data['shops_number'] = this.shopsNumber;
    data['image'] = this.image;
    data['project'] = this.project;
    data['city'] = this.city;
    data['project_status'] = this.projectStatus;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
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
  List<Link>? link;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.link,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      link = <Link>[];
      json['links'].forEach((v) {
        link!.add(new Link.fromJson(v));
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
    if (this.link != null) {
      data['links'] = this.link!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({this.url, this.label, this.active});

  Link.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}