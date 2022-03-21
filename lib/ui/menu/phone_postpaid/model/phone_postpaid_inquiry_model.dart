class PhonePostpaidInquiryModel {
  String? act;
  String? noResi;
  String? totalPayment;
  String? payment;
  String? phoneNumber;
  String? product;
  String? transactionCode;
  String? authToken;

  PhonePostpaidInquiryModel({
    this.act,
    this.noResi,
    this.totalPayment,
    this.payment,
    this.phoneNumber,
    this.product,
    this.transactionCode,
    this.authToken
  });

  PhonePostpaidInquiryModel.fromJson(Map<String, dynamic> json) {
    act = json['act'];
    noResi = json['no_resi'];
    totalPayment = json['total_payment'];
    payment = json['payment'];
    phoneNumber = json['phone_number'];
    product = json['product'];
    transactionCode = json['transaction_code'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['act'] = act;
    data['no_resi'] = noResi;
    data['total_payment'] = totalPayment;
    data['payment'] = payment;
    data['phone_number'] = phoneNumber;
    data['product'] = product;
    data['transaction_code'] = transactionCode;
    data['auth_token'] = authToken;
    return data;
  }
}
