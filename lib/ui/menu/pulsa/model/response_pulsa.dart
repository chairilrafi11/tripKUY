class ResponsePulsa {
  List<Pulsa>? pulsa;
  List<Data>? data;

  ResponsePulsa({this.pulsa});

  ResponsePulsa.fromJson(Map<String, dynamic> json) {
    if (json['pulsa'] != null) {
      pulsa = <Pulsa>[];
      json['pulsa'].forEach((v) {
        pulsa!.add(Pulsa.fromJson(v));
      });
    }
    if (json['paket'] != null) {
      data = <Data>[];
      json['paket'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pulsa != null) {
      data['pulsa'] = pulsa!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pulsa {
  int? id;
  String? name;
  int? price;
  int? statusId;
  String? providerName;

  Pulsa({this.id, this.name, this.price, this.statusId, this.providerName});

  Pulsa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    statusId = json['status_id'];
    providerName = json['provider_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['status_id'] = statusId;
    data['provider_name'] = providerName;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? price;
  int? statusId;
  String? providerName;

  Data({this.id, this.name, this.price, this.statusId, this.providerName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    statusId = json['status_id'];
    providerName = json['provider_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['status_id'] = statusId;
    data['provider_name'] = providerName;
    return data;
  }
}
