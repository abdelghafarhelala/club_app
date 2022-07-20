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
  int? facilities;
  int? sports;
  int? players;
  String? image;
  int? gallery;
  List<ListGallery>? listGallery;
  String? project;
  String? city;
  String? projectStatus;
  String? lat;
  String? lng;
  String? updatedAt;

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
      this.facilities,
      this.sports,
      this.players,
      this.image,
      this.gallery,
      this.listGallery,
      this.project,
      this.city,
      this.projectStatus,
      this.lat,
      this.lng,
      this.updatedAt});

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
    facilities = json['facilities'];
    sports = json['sports'];
    players = json['players'];
    image = json['image'];
    gallery = json['gallery'];
    if (json['list_gallery'] != null) {
      listGallery = <ListGallery>[];
      json['list_gallery'].forEach((v) {
        listGallery!.add(new ListGallery.fromJson(v));
      });
    }
    project = json['project'];
    city = json['city'];
    projectStatus = json['project_status'];
    lat = json['lat'];
    lng = json['lng'];
    updatedAt = json['updated_at'];
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
    data['facilities'] = this.facilities;
    data['sports'] = this.sports;
    data['players'] = this.players;
    data['image'] = this.image;
    data['gallery'] = this.gallery;
    if (this.listGallery != null) {
      data['list_gallery'] = this.listGallery!.map((v) => v.toJson()).toList();
    }
    data['project'] = this.project;
    data['city'] = this.city;
    data['project_status'] = this.projectStatus;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['updated_at'] = this.updatedAt;
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

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

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
