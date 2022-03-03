class ResponseLogin {
  int? id;
  int? salesSaldo;
  String? referral;
  Null? uid;
  String? name;
  String? email;
  int? roleId;
  String? salesCode;
  String? address;
  String? phoneNumber;
  String? storeName;
  Null? typeId;
  int? totalBonus;
  int? totalBalance;
  int? totalPoint;
  String? deviceId;
  String? deviceRegisterId;
  int? otherBalance;
  String? parentReferral;
  String? version;
  String? parentReferralName;
  bool? canTransactions;
  String? authToken;
  int? updatedAt;
  int? apiKeyId;
  int? merchantTypeId;
  String? photoProfile;
  int? finnetTypeId;
  int? areaId;
  String? pekerjaan;
  String? birthDate;
  String? birthPlace;
  String? gender;
  String? expiredIdCard;
  String? namaGadisIbu;

  ResponseLogin(
      {this.id,
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
      this.deviceId,
      this.deviceRegisterId,
      this.otherBalance,
      this.parentReferral,
      this.version,
      this.parentReferralName,
      this.canTransactions,
      this.authToken,
      this.updatedAt,
      this.apiKeyId,
      this.merchantTypeId,
      this.photoProfile,
      this.finnetTypeId,
      this.areaId,
      this.pekerjaan,
      this.birthDate,
      this.birthPlace,
      this.gender,
      this.expiredIdCard,
      this.namaGadisIbu});

  ResponseLogin.fromJson(Map<String, dynamic> json) {
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
    deviceId = json['device_id'];
    deviceRegisterId = json['device_register_id'];
    otherBalance = json['other_balance'];
    parentReferral = json['parent_referral'];
    version = json['version'];
    parentReferralName = json['parent_referral_name'];
    canTransactions = json['can_transactions'];
    authToken = json['auth_token'];
    updatedAt = json['updated_at'];
    apiKeyId = json['api_key_id'];
    merchantTypeId = json['merchant_type_id'];
    photoProfile = json['photo_profile'];
    finnetTypeId = json['finnet_type_id'];
    areaId = json['area_id'];
    pekerjaan = json['pekerjaan'];
    birthDate = json['birth_date'];
    birthPlace = json['birth_place'];
    gender = json['gender'];
    expiredIdCard = json['expired_id_card'];
    namaGadisIbu = json['nama_gadis_ibu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sales_saldo'] = this.salesSaldo;
    data['referral'] = this.referral;
    data['uid'] = this.uid;
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
    data['device_id'] = this.deviceId;
    data['device_register_id'] = this.deviceRegisterId;
    data['other_balance'] = this.otherBalance;
    data['parent_referral'] = this.parentReferral;
    data['version'] = this.version;
    data['parent_referral_name'] = this.parentReferralName;
    data['can_transactions'] = this.canTransactions;
    data['auth_token'] = this.authToken;
    data['updated_at'] = this.updatedAt;
    data['api_key_id'] = this.apiKeyId;
    data['merchant_type_id'] = this.merchantTypeId;
    data['photo_profile'] = this.photoProfile;
    data['finnet_type_id'] = this.finnetTypeId;
    data['area_id'] = this.areaId;
    data['pekerjaan'] = this.pekerjaan;
    data['birth_date'] = this.birthDate;
    data['birth_place'] = this.birthPlace;
    data['gender'] = this.gender;
    data['expired_id_card'] = this.expiredIdCard;
    data['nama_gadis_ibu'] = this.namaGadisIbu;
    return data;
  }
}
