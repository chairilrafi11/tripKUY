class RegisterFormResponse {
  int? id;
  dynamic salesSaldo;
  String? referral;
  String? uid;
  String? name;
  String? email;
  int? roleId;
  String? salesCode;
  String? address;
  String? phoneNumber;
  String? storeName;
  dynamic typeId;
  int? totalBonus;
  int? totalBalance;
  int? totalPoint;
  String? parentReferral;
  String? parentName;
  bool? canTranscation;
  String? authToken;

  RegisterFormResponse({
    this.id,
    this.salesSaldo,
    this.referral,
    this.uid,
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
    this.parentReferral,
    this.parentName,
    this.canTranscation,
    this.authToken
  });

  RegisterFormResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    salesSaldo = json['sales_saldo'];
    referral = json['referral'];
    uid = json['uid'];
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
    parentReferral = json['parent_referral'];
    parentName = json['parent_name'];
    canTranscation = json['can_transcation'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['sales_saldo'] = salesSaldo;
    data['referral'] = referral;
    data['uid'] = uid;
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
    data['parent_referral'] = parentReferral;
    data['parent_name'] = parentName;
    data['can_transcation'] = canTranscation;
    data['auth_token'] = authToken;
    return data;
  }
}
