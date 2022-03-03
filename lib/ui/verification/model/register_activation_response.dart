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
  Null? totalBonus;
  int? totalBalance;
  int? totalPoint;
  int? updatedAt;
  bool? isEmoney;

  RegisterActivationResponse(
      {this.id,
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
      this.isEmoney});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sales_saldo'] = this.salesSaldo;
    data['referral'] = this.referral;
    data['uid'] = this.uid;
    data['auth_token'] = this.authToken;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role_id'] = this.roleId;
    data['sales_code'] = this.salesCode;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['store_name'] = this.storeName;
    data['type_id'] = this.typeId;
    data['total_bonus'] = this.totalBonus;
    data['total_balance'] = this.totalBalance;
    data['total_point'] = this.totalPoint;
    data['updated_at'] = this.updatedAt;
    data['is_emoney'] = this.isEmoney;
    return data;
  }
}
