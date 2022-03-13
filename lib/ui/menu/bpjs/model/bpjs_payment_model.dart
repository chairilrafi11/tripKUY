class BPJSPaymentModel {
  String? pin;
  String? act;
  String? van;
  String? numbers;
  String? totalPayment;
  String? authToken;
  String? balance;
  String? transactionId;

  BPJSPaymentModel({
    this.pin,
    this.act,
    this.van,
    this.numbers,
    this.totalPayment,
    this.authToken,
    this.balance,
    this.transactionId
  });

  BPJSPaymentModel.fromJson(Map<String, dynamic> json) {
    pin = json['pin'];
    act = json['act'];
    van = json['van'];
    numbers = json['numbers'];
    totalPayment = json['total_payment'];
    authToken = json['auth_token'];
    balance = json['balance'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pin'] = pin;
    data['act'] = act;
    data['van'] = van;
    data['numbers'] = numbers;
    data['total_payment'] = totalPayment;
    data['auth_token'] = authToken;
    data['balance'] = balance;
    data['transaction_id'] = transactionId;
    return data;
  }
}
