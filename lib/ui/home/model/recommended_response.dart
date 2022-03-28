class RecommendedResponse {
  int? productId;
  String? productName;
  String? providerName;
  String? transactionType;
  int? price;

  RecommendedResponse({
    this.productId, 
    this.productName, 
    this.transactionType, 
    this.price,
    this.providerName
  });

  RecommendedResponse.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    providerName = json['provider_name'];
    transactionType = json['transaction_type'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['provider_name'] = providerName;
    data['transaction_type'] = transactionType;
    data['price'] = price;
    return data;
  }
}
