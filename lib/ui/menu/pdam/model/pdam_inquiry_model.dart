class PDAMInquiryModel {
  String? act;
  String? id;
  String? totalPayment;
  String? product;
  int? productId;
  String? authToken;

  PDAMInquiryModel({
    this.act,
    this.id,
    this.totalPayment,
    this.product,
    this.productId,
    this.authToken
  });

  PDAMInquiryModel.fromJson(Map<String, dynamic> json) {
    act = json['act'];
    id = json['id'];
    totalPayment = json['total_payment'];
    product = json['product'];
    productId = json['product_id'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['act'] = act;
    data['id'] = id;
    data['total_payment'] = totalPayment;
    data['product'] = product;
    data['product_id'] = productId;
    data['auth_token'] = authToken;
    return data;
  }
}
