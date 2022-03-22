class PGNPaymentRequest {
  String? act;
  String? id;
  String? totalPayment;
  String? authToken;
  String? transactionId;
  String? balance;
  String? pin;

  PGNPaymentRequest({
    this.act, 
    this.id, 
    this.totalPayment, 
    this.authToken,
    this.balance,
    this.transactionId,
    this.pin
  });

  PGNPaymentRequest.fromJson(Map<String, dynamic> json) {
    act = json['act'];
    id = json['id'];
    totalPayment = json['total_payment'];
    authToken = json['auth_token'];
    transactionId = json['transaction_id'];
    balance = json['balance'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['act'] = act;
    data['id'] = id;
    data['total_payment'] = totalPayment;
    data['auth_token'] = authToken;
    data['transaction_id'] = transactionId;
    data['balance'] = balance;
    data['pin'] = pin;
    return data;
  }
}
