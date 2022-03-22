class RegisterActivationResponse {
  int? id;
  int? salesSaldo;
  String? referral;
  String? uid;
  String? authToken;
  String? name;
  String? email;
  int? roleId;
  String? salesCode;
  String? address;
  String? phoneNumber;
  String? storeName;
  int? typeId;
  String? totalBonus;
  int? totalBalance;
  int? totalPoint;
  int? updatedAt;
  bool? isEmoney;

  RegisterActivationResponse({
    this.id,
    this.salesSaldo,
    this.referral,
    this.uid,
    this.authToken,
    this.name,
    this.email,
    this.roleId,
    this.salesCode,
    this.address,
    this.phoneNumber,
    this.storeName,
    this.typeId,
    this.totalBonus,
    this.totalBalance,
    this.totalPoint,
    this.updatedAt,
    this.isEmoney
  });

  RegisterActivationResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    salesSaldo = json['sales_saldo'];
    referral = json['referral'];
    uid = json['uid'];
    authToken = json['auth_token'];
    name = json['name'];
    email = json['email'];
    roleId = json['role_id'];
    salesCode = json['sales_code'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    storeName = json['store_name'];
    typeId = json['type_id'];
    totalBonus = json['total_bonus'];
    totalBalance = json['total_balance'];
    totalPoint = json['total_point'];
    updatedAt = json['updated_at'];
    isEmoney = json['is_emoney'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sales_saldo'] = salesSaldo;
    data['referral'] = referral;
    data['uid'] = uid;
    data['auth_token'] = authToken;
    data['name'] = name;
    data['email'] = email;
    data['role_id'] = roleId;
    data['sales_code'] = salesCode;
    data['address'] = address;
    data['phone_number'] = phoneNumber;
    data['store_name'] = storeName;
    data['type_id'] = typeId;
    data['total_bonus'] = totalBonus;
    data['total_balance'] = totalBalance;
    data['total_point'] = totalPoint;
    data['updated_at'] = updatedAt;
    data['is_emoney'] = isEmoney;
    return data;
  }
}
