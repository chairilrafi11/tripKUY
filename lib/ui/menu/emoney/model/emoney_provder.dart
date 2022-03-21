class EmoneyProviderResponse {
  int? id;
  String? iconPath;
  String? name;
  String? description;
  String? createdAt;

  EmoneyProviderResponse({this.id, this.iconPath, this.name, this.description, this.createdAt});

  EmoneyProviderResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iconPath = json['icon_path'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['icon_path'] = iconPath;
    data['name'] = name;
    data['description'] = description;
    data['created_at'] = createdAt;
    return data;
  }
}
