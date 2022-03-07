class ElectricPospaidPaymentModel {
  String? pin;
  String? act;
  int? categoryId;
  String? id;
  String? totalPayment;
  String? type;
  String? authToken;
  String? balance;
  String? transactionId;

  ElectricPospaidPaymentModel({
    this.pin,
    this.act,
    this.categoryId,
    this.id,
    this.totalPayment,
    this.type,
    this.authToken,
    this.balance,
    this.transactionId
  });

  ElectricPospaidPaymentModel.fromJson(Map<String, dynamic> json) {
    pin = json['pin'];
    act = json['act'];
    categoryId = json['category_id'];
    id = json['id'];
    totalPayment = json['total_payment'];
    type = json['type'];
    authToken = json['auth_token'];
    balance = json['balance'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pin'] = pin;
    data['act'] = act;
    data['category_id'] = categoryId;
    data['id'] = id;
    data['total_payment'] = totalPayment;
    data['type'] = type;
    data['auth_token'] = authToken;
    data['balance'] = balance;
    data['transaction_id'] = transactionId;
    return data;
  }
}
