class PascabayarInquiryModel {
  String? action;
  String? phoneNumber;
  String? product;
  String? totalPayment;
  String? paymentBill;
  String? trxCode;
  String? noResi;
  String? balance;
  int? trancationId;
  String? authToken;

  PascabayarInquiryModel({
    this.action,
    this.phoneNumber,
    this.product,
    this.totalPayment,
    this.paymentBill,
    this.trxCode,
    this.noResi,
    this.balance,
    this.trancationId,
    this.authToken,
  });

  PascabayarInquiryModel.fromJson(Map<String, dynamic> json) {
    action = json['act'];
    phoneNumber = json['phone_number'];
    product = json['product'];
    totalPayment = json['total_payment'];
    paymentBill = json['payment'];
    trxCode = json['transaction_code'];
    noResi = json['no_resi'];
    balance = json['balance'];
    trancationId = json['transaction_id'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['act'] = action;
    data['phone_number'] = phoneNumber;
    data['product'] = product;
    data['total_payment'] = totalPayment;
    data['payment'] = paymentBill;
    data['transaction_code'] = trxCode;
    data['no_resi'] = noResi;
    data['balance'] = balance;
    data['transaction_id'] = trancationId;
    data['auth_token'] = authToken;
    return data;
  }
}
