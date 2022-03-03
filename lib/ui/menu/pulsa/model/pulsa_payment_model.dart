class PulsaPaymentModel {
  bool? payment;
  String? pin;
  Transaction? transaction;
  String? authToken;

  PulsaPaymentModel({this.payment, this.pin, this.transaction, this.authToken});

  PulsaPaymentModel.fromJson(Map<String, dynamic> json) {
    payment = json['payment'];
    pin = json['pin'];
    transaction = json['transaction'] != null
        ? new Transaction.fromJson(json['transaction'])
        : null;
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment'] = this.payment;
    data['pin'] = this.pin;
    if (this.transaction != null) {
      data['transaction'] = this.transaction!.toJson();
    }
    data['auth_token'] = this.authToken;
    return data;
  }
}

class Transaction {
  String? messages;
  String? indentifierNumber;
  int? productPriceId;
  int? providerId;
  int? time;
  int? transactionTypeId;
  int? userId;

  Transaction(
      {this.messages,
      this.indentifierNumber,
      this.productPriceId,
      this.providerId,
      this.time,
      this.transactionTypeId,
      this.userId});

  Transaction.fromJson(Map<String, dynamic> json) {
    messages = json['messages'];
    indentifierNumber = json['indentifier_number'];
    productPriceId = json['product_price_id'];
    providerId = json['provider_id'];
    time = json['time'];
    transactionTypeId = json['transaction_type_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messages'] = this.messages;
    data['indentifier_number'] = this.indentifierNumber;
    data['product_price_id'] = this.productPriceId;
    data['provider_id'] = this.providerId;
    data['time'] = this.time;
    data['transaction_type_id'] = this.transactionTypeId;
    data['user_id'] = this.userId;
    return data;
  }
}
