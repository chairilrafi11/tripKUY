class PascabayarProviderResponse {
  int? id;
  String? product;
  String? name;

  PascabayarProviderResponse({this.id, this.product, this.name});

  PascabayarProviderResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['name'];
    name = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = product;
    data['description'] = name;
    return data;
  }
}
