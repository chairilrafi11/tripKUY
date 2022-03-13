class PhonePostpaidPaymentModel {
  String? pin;
  String? act;
  String? noResi;
  String? totalPayment;
  String? payment;
  String? phoneNumber;
  String? product;
  String? transactionCode;
  String? authToken;
  String? balance;
  String? transactionId;

  PhonePostpaidPaymentModel({
    this.pin,
    this.act,
    this.noResi,
    this.totalPayment,
    this.payment,
    this.phoneNumber,
    this.product,
    this.transactionCode,
    this.authToken,
    this.balance,
    this.transactionId
  });

  PhonePostpaidPaymentModel.fromJson(Map<String, dynamic> json) {
    pin = json['pin'];
    act = json['act'];
    noResi = json['no_resi'];
    totalPayment = json['total_payment'];
    payment = json['payment'];
    phoneNumber = json['phone_number'];
    product = json['product'];
    transactionCode = json['transaction_code'];
    authToken = json['auth_token'];
    balance = json['balance'];
    transactionId = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pin'] = pin;
    data['act'] = act;
    data['no_resi'] = noResi;
    data['total_payment'] = totalPayment;
    data['payment'] = payment;
    data['phone_number'] = phoneNumber;
    data['product'] = product;
    data['transaction_code'] = transactionCode;
    data['auth_token'] = authToken;
    data['balance'] = balance;
    data['transaction_id'] = transactionId;
    return data;
  }
}
