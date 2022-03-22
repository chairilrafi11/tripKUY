class ElectricPospaidInquiryModel {
  String? act;
  int? categoryId;
  String? id;
  String? totalPayment;
  String? type;
  String? authToken;

  ElectricPospaidInquiryModel({
    this.act,
    this.categoryId,
    this.id,
    this.totalPayment,
    this.type,
    this.authToken
  });

  ElectricPospaidInquiryModel.fromJson(Map<String, dynamic> json) {
    act = json['act'];
    categoryId = json['category_id'];
    id = json['id'];
    totalPayment = json['total_payment'];
    type = json['type'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['act'] = act;
    data['category_id'] = categoryId;
    data['id'] = id;
    data['total_payment'] = totalPayment;
    data['type'] = type;
    data['auth_token'] = authToken;
    return data;
  }
}
