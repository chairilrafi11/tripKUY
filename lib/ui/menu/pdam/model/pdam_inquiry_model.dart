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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['act'] = this.act;
    data['id'] = this.id;
    data['total_payment'] = this.totalPayment;
    data['product'] = this.product;
    data['product_id'] = this.productId;
    data['auth_token'] = this.authToken;
    return data;
  }
}
