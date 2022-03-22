import 'package:flutter/material.dart';

class GameProductResponse {
  List<Game>? game;
  List<FormData>? form;

  GameProductResponse({this.game, this.form});

  GameProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['Topup Game'] != null) {
      game = <Game>[];
      json['Topup Game'].forEach((v) {
        game!.add(Game.fromJson(v));
      });
    }
    if (json['form'] != null) {
      form = <FormData>[];
      json['form'].forEach((v) {
        form!.add(FormData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (game != null) {
      data['Game'] = game!.map((v) => v.toJson()).toList();
    } 
    if (form != null) {
      data['form'] = form!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Game {
  int? id;
  String? name;
  int? salePrice;
  int? type;
  int? providerId;
  int? priceMerchant;
  int? productId;
  int? createdAt;
  int? updatedAt;

  Game({
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

  Game.fromJson(Map<String, dynamic> json) {
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

class FormData {
  String? label;
  String? formType;
  int? sequence;
  TextEditingController textEditingController = TextEditingController();

  FormData({this.label, this.formType, this.sequence, required this.textEditingController});

  FormData.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    formType = json['form_type'];
    sequence = json['sequence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['form_type'] = formType;
    data['sequence'] = sequence;
    return data;
  }
}
