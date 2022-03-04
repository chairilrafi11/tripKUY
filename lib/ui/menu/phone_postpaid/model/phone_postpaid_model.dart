class PhonePostpaidModel {
  int? id;
  String? product;
  String? name;

  PhonePostpaidModel({this.id, this.product, this.name});

  PhonePostpaidModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product'] = product;
    data['name'] = name;
    return data;
  }
}
