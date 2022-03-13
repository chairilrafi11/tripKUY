class ElectricPrepaidInquiry {
  String? act;
  String? idPel;
  int? idProduct;
  String? refnum;
  String? type;
  String? authToken;

  ElectricPrepaidInquiry({
    this.act,
    this.idPel,
    this.idProduct,
    this.refnum,
    this.type,
    this.authToken
  });

  ElectricPrepaidInquiry.fromJson(Map<String, dynamic> json) {
    act = json['act'];
    idPel = json['id_pel'];
    idProduct = json['id_product'];
    refnum = json['refnum'];
    type = json['type'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['act'] = act;
    data['id_pel'] = idPel;
    data['id_product'] = idProduct;
    data['refnum'] = refnum;
    data['type'] = type;
    data['auth_token'] = authToken;
    return data;
  }
}
