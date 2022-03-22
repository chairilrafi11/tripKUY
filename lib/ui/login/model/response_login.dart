class ResponseLogin {
  int? id;
  int? salesSaldo;
  String? referral;
  String? uid;
  String? name;
  String? email;
  int? roleId;
  String? salesCode;
  String? address;
  String? phoneNumber;
  String? storeName;
  int? typeId;
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

  ResponseLogin({
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
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['device_id'] = deviceId;
    data['device_register_id'] = deviceRegisterId;
    data['other_balance'] = otherBalance;
    data['parent_referral'] = parentReferral;
    data['version'] = version;
    data['parent_referral_name'] = parentReferralName;
    data['can_transactions'] = canTransactions;
    data['auth_token'] = authToken;
    data['updated_at'] = updatedAt;
    data['api_key_id'] = apiKeyId;
    data['merchant_type_id'] = merchantTypeId;
    data['photo_profile'] = photoProfile;
    data['finnet_type_id'] = finnetTypeId;
    data['area_id'] = areaId;
    data['pekerjaan'] = pekerjaan;
    data['birth_date'] = birthDate;
    data['birth_place'] = birthPlace;
    data['gender'] = gender;
    data['expired_id_card'] = expiredIdCard;
    data['nama_gadis_ibu'] = namaGadisIbu;
    return data;
  }
}
