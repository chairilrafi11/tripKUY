class EmoneyProductResponse {
  List<Emoney>? emoney;

  EmoneyProductResponse({this.emoney});

  EmoneyProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['Emoney'] != null) {
      emoney = <Emoney>[];
      json['Emoney'].forEach((v) {
        emoney!.add(new Emoney.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (emoney != null) {
      data['Emoney'] = emoney!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Emoney {
  int? id;
  String? name;
  int? salePrice;
  int? type;
  int? providerId;
  int? priceMerchant;
  int? productId;
  int? createdAt;
  int? updatedAt;

  Emoney({
    this.id,
    this.name,
    this.salePrice,
    this.type,
    this.providerId,
    this.priceMerchant,
    this.productId,
    this.createdAt,
    this.updatedAt
  });

  Emoney.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    salePrice = json['sale_price'];
    type = json['type'];
    providerId = json['provider_id'];
    priceMerchant = json['price_merchant'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sale_price'] = salePrice;
    data['type'] = type;
    data['provider_id'] = providerId;
    data['price_merchant'] = priceMerchant;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}