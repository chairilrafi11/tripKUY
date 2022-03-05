class BPJSPaymentModel {
  String? pin;
  String? act;
  String? van;
  String? numbers;
  String? totalPayment;
  String? authToken;

  BPJSPaymentModel({
    this.pin,
    this.act,
    this.van,
    this.numbers,
    this.totalPayment,
    this.authToken
  });

  BPJSPaymentModel.fromJson(Map<String, dynamic> json) {
    pin = json['pin'];
    act = json['act'];
    van = json['van'];
    numbers = json['numbers'];
    totalPayment = json['total_payment'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pin'] = this.pin;
    data['act'] = this.act;
    data['van'] = this.van;
    data['numbers'] = this.numbers;
    data['total_payment'] = this.totalPayment;
    data['auth_token'] = this.authToken;
    return data;
  }
}
