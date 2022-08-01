class departments {
  List<DepartData>? data;

  departments({this.data});

  departments.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DepartData>[];
      json['data'].forEach((v) {
        data!.add(new DepartData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DepartData {
  int? id;
  String? name;

  DepartData({this.id, this.name});

  DepartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
