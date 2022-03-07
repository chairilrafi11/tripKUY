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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['act'] = this.act;
    data['no_resi'] = this.noResi;
    data['total_payment'] = this.totalPayment;
    data['payment'] = this.payment;
    data['phone_number'] = this.phoneNumber;
    data['product'] = this.product;
    data['transaction_code'] = this.transactionCode;
    data['auth_token'] = this.authToken;
    return data;
  }
}
