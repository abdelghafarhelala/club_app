class clubsModel {
  bool? success;
  String? message;
  List<Data>? data;

  clubsModel({this.success, this.message, this.data});

  clubsModel.fromJson(Map<String, dynamic> json) {
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
