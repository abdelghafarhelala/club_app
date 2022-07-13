class ClubDetails {
  Club? club;

  ClubDetails({this.club});

  ClubDetails.fromJson(Map<String, dynamic> json) {
    club = json['club'] != null ? Club.fromJson(json['club']) : null;
  }
}

class Club {
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

  Club(
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

  Club.fromJson(Map<String, dynamic> json) {
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
}
