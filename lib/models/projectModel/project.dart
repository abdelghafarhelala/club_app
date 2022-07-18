class projects {
  List<ProjectData>? projectData;

  projects({this.projectData});

  projects.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      projectData = <ProjectData>[];
      json['data'].forEach((v) {
        projectData!.add(new ProjectData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.projectData != null) {
      data['data'] = this.projectData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectData {
  int? id;
  String? name;
  String? logo;
  String? priority;

  ProjectData({this.id, this.name, this.logo, this.priority});

  ProjectData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['priority'] = this.priority;
    return data;
  }
}
