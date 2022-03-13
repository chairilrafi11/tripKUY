// ignore_for_file: unnecessary_new

class TelephonePaymentModel {
  String? pin;
  String? act;
  int? categoryId;
  String? id;
  String? totalPayment;
  String? authToken;
  String? balance;
  String? transactionId;

  TelephonePaymentModel({
    this.pin,
    this.act,
    this.categoryId,
    this.id,
    this.totalPayment,
    this.authToken,
    this.balance,
    this.transactionId
  });

  TelephonePaymentModel.fromJson(Map<String, dynamic> json) {
    pin = json['pin'];
    act = json['act'];
    categoryId = json['category_id'];
    id = json['id'];
    totalPayment = json['total_payment'];
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
    data['auth_token'] = authToken;
    data['balance'] = balance;
    data['transaction_id'] = transactionId;
    return data;
  }
}
