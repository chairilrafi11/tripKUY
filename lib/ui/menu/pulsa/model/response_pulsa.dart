class ResponsePulsa {
  List<Pulsa>? pulsa;
  List<Data>? data;

  ResponsePulsa({this.pulsa});

  ResponsePulsa.fromJson(Map<String, dynamic> json) {
    if (json['pulsa'] != null) {
      pulsa = <Pulsa>[];
      json['pulsa'].forEach((v) {
        pulsa!.add(new Pulsa.fromJson(v));
      });
    }
    if (json['paket'] != null) {
      data = <Data>[];
      json['paket'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pulsa != null) {
      data['pulsa'] = this.pulsa!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pulsa {
  int? id;
  String? name;
  int? price;
  int? statusId;

  Pulsa({this.id, this.name, this.price, this.statusId});

  Pulsa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    statusId = json['status_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['status_id'] = this.statusId;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? price;
  int? statusId;

  Data({this.id, this.name, this.price, this.statusId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    statusId = json['status_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['status_id'] = this.statusId;
    return data;
  }
}
