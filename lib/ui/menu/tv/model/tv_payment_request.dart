class TvPaymentRequest {
  String? act;
  String? noResi;
  String? totalPayment;
  String? payment;
  String? pelId;
  String? product;
  int? transactionId;
  String? transactionCode;
  String? authToken;

  TvPaymentRequest({
    this.act,
    this.noResi,
    this.totalPayment,
    this.payment,
    this.pelId,
    this.product,
    this.transactionId,
    this.transactionCode,
    this.authToken
  });

  TvPaymentRequest.fromJson(Map<String, dynamic> json) {
    act = json['act'];
    noResi = json['no_resi'];
    totalPayment = json['total_payment'];
    payment = json['payment'];
    pelId = json['pel_id'];
    product = json['product'];
    transactionId = json['transaction_id'];
    transactionCode = json['transaction_code'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['act'] = act;
    data['no_resi'] = noResi;
    data['total_payment'] = totalPayment;
    data['payment'] = payment;
    data['pel_id'] = pelId;
    data['product'] = product;
    data['transaction_id'] = transactionId;
    data['transaction_code'] = transactionCode;
    data['auth_token'] = authToken;
    return data;
  }
}
