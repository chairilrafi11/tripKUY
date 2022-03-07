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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['act'] = this.action;
    data['phone_number'] = this.phoneNumber;
    data['product'] = this.product;
    data['total_payment'] = this.totalPayment;
    data['payment'] = this.paymentBill;
    data['transaction_code'] = this.trxCode;
    data['no_resi'] = this.noResi;
    data['balance'] = this.balance;
    data['transaction_id'] = this.trancationId;
    data['auth_token'] = this.authToken;
    return data;
  }
}
