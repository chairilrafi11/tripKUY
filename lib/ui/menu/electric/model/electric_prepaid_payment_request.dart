class ElectricPrepaidPaymentRequest {
  String? pin;
  String? act;
  String? idPel;
  int? idProduct;
  String? refnum;
  String? type;
  String? authToken;
  String? balance;

  ElectricPrepaidPaymentRequest({
    this.pin,
    this.act,
    this.idPel,
    this.idProduct,
    this.refnum,
    this.type,
    this.authToken,
    this.balance
  });

  ElectricPrepaidPaymentRequest.fromJson(Map<String, dynamic> json) {
    pin = json['pin'];
    act = json['act'];
    idPel = json['id_pel'];
    idProduct = json['id_product'];
    refnum = json['refnum'];
    type = json['type'];
    authToken = json['auth_token'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pin'] = pin;
    data['act'] = act;
    data['id_pel'] = idPel;
    data['id_product'] = idProduct;
    data['refnum'] = refnum;
    data['type'] = type;
    data['auth_token'] = authToken;
    data['balance'] = balance;
    return data;
  }
}
