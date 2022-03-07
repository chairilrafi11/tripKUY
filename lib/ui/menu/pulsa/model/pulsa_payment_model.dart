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
    data['payment'] = payment;
    data['pin'] = pin;
    if (transaction != null) {
      data['transaction'] = transaction!.toJson();
    }
    data['auth_token'] = authToken;
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
  String? balance;

  Transaction({
    this.messages,
    this.indentifierNumber,
    this.productPriceId,
    this.providerId,
    this.time,
    this.transactionTypeId,
    this.userId,
    this.balance
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    messages = json['messages'];
    indentifierNumber = json['indentifier_number'];
    productPriceId = json['product_price_id'];
    providerId = json['provider_id'];
    time = json['time'];
    transactionTypeId = json['transaction_type_id'];
    userId = json['user_id'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['messages'] = messages;
    data['indentifier_number'] = indentifierNumber;
    data['product_price_id'] = productPriceId;
    data['provider_id'] = providerId;
    data['time'] = time;
    data['transaction_type_id'] = transactionTypeId;
    data['user_id'] = userId;
    data['balance'] = balance;
    return data;
  }
}
