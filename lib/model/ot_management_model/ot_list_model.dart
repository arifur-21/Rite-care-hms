
class OtListModel {
  String? items;
  int? totalItems;

  OtListModel({this.items, this.totalItems});

  OtListModel.fromJson(Map<String, dynamic> json) {
    items = json['items'];
    totalItems = json['totalItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items'] = this.items;
    data['totalItems'] = this.totalItems;
    return data;
  }
}