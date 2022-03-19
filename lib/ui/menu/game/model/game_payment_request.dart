class GamePaymentRequest {
  String? authToken;
  String? pin;
  Transaction? transaction;

  GamePaymentRequest({this.authToken, this.pin, this.transaction});

  GamePaymentRequest.fromJson(Map<String, dynamic> json) {
    authToken = json['auth_token'];
    pin = json['pin'];
    transaction = json['transaction'] != null
        ? Transaction.fromJson(json['transaction'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['auth_token'] = authToken;
    data['pin'] = pin;
    if (transaction != null) {
      data['transaction'] = transaction!.toJson();
    }
    return data;
  }
}

class Transaction {
  int? userId;
  String? messages;
  String? indentifierNumber;
  int? providerId;
  int? transactionTypeId;
  int? productPriceId;
  String? balance;

  Transaction({
    this.userId,
    this.messages,
    this.indentifierNumber,
    this.providerId,
    this.transactionTypeId,
    this.productPriceId,
    this.balance
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    messages = json['messages'];
    indentifierNumber = json['indentifier_number'];
    providerId = json['provider_id'];
    transactionTypeId = json['transaction_type_id'];
    productPriceId = json['product_price_id'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['messages'] = messages;
    data['indentifier_number'] = indentifierNumber;
    data['provider_id'] = providerId;
    data['transaction_type_id'] = transactionTypeId;
    data['product_price_id'] = productPriceId;
    data['balance'] = balance;
    return data;
  }
}
