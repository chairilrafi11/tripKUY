class ElectricTokenResponse {
  List<PulsaListrik>? pulsaListrik;

  ElectricTokenResponse({this.pulsaListrik});

  ElectricTokenResponse.fromJson(Map<String, dynamic> json) {
    if (json['Pulsa Listrik'] != null) {
      pulsaListrik = <PulsaListrik>[];
      json['Pulsa Listrik'].forEach((v) {
        pulsaListrik!.add(PulsaListrik.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pulsaListrik != null) {
      data['Pulsa Listrik'] =
          pulsaListrik!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PulsaListrik {
  int? id;
  String? name;
  int? salePrice;
  int? type;
  int? transactionTypeId;
  int? providerId;
  int? createdAt;
  int? updatedAt;

  PulsaListrik({
    this.id,
    this.name,
    this.salePrice,
    this.type,
    this.transactionTypeId,
    this.providerId,
    this.createdAt,
    this.updatedAt
  });

  PulsaListrik.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    salePrice = json['sale_price'];
    type = json['type'];
    transactionTypeId = json['transaction_type_id'];
    providerId = json['provider_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sale_price'] = salePrice;
    data['type'] = type;
    data['transaction_type_id'] = transactionTypeId;
    data['provider_id'] = providerId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
