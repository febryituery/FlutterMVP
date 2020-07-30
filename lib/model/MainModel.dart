class MainModel {
  int totalItems;

  MainModel({this.totalItems});

  MainModel.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalItems'] = this.totalItems;
    return data;
  }
}