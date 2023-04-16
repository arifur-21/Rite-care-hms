
class BloodGroupModel {
  String? status;
  List<Data>? data;

  BloodGroupModel({this.status, this.data});

  BloodGroupModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic? id;
  dynamic? name;


  Data(
      {this.id,
        this.name,
      });

  Data.fromJson(Map<dynamic, dynamic> json) {
    id = json['Id'];
    name = json['Name'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;

    return data;
  }
}