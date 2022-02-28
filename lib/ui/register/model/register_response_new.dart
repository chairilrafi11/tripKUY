class RegisterResponseNew {
  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? fcmToken;
  String? birthPlace;
  String? idCardNumber;
  String? gender;
  int? userRoleId;
  String? cityName;
  String? kycStatus;
  String? appOrigin;
  bool? isVerifiedCode;
  String? motherName;
  String? village;
  String? district;
  String? postalCode;
  String? registrationNumber;
  bool? isTopup;
  String? profession;
  String? salary;
  String? communityMember;

  RegisterResponseNew({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.fcmToken,
    this.birthPlace,
    this.idCardNumber,
    this.gender,
    this.userRoleId,
    this.cityName,
    this.kycStatus,
    this.appOrigin,
    this.isVerifiedCode,
    this.motherName,
    this.village,
    this.district,
    this.postalCode,
    this.registrationNumber,
    this.isTopup,
    this.profession,
    this.salary,
    this.communityMember
  });

  RegisterResponseNew.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    fcmToken = json['fcm_token'];
    birthPlace = json['birth_place'];
    idCardNumber = json['id_card_number'];
    gender = json['gender'];
    userRoleId = json['user_role_id'];
    cityName = json['city_name'];
    kycStatus = json['kyc_status'];
    appOrigin = json['app_origin'];
    isVerifiedCode = json['is_verified_code'];
    motherName = json['mother_name'];
    village = json['village'];
    district = json['district'];
    postalCode = json['postal_code'];
    registrationNumber = json['registration_number'];
    isTopup = json['is_topup'];
    profession = json['profession'];
    salary = json['salary'];
    communityMember = json['community_member'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['fcm_token'] = fcmToken;
    data['birth_place'] = birthPlace;
    data['id_card_number'] = idCardNumber;
    data['gender'] = gender;
    data['user_role_id'] = userRoleId;
    data['city_name'] = cityName;
    data['kyc_status'] = kycStatus;
    data['app_origin'] = appOrigin;
    data['is_verified_code'] = isVerifiedCode;
    data['mother_name'] = motherName;
    data['village'] = village;
    data['district'] = district;
    data['postal_code'] = postalCode;
    data['registration_number'] = registrationNumber;
    data['is_topup'] = isTopup;
    data['profession'] = profession;
    data['salary'] = salary;
    data['community_member'] = communityMember;
    return data;
  }
}
