class RegisterFormModel {
  String? imei;
  UserLocation? userLocation;
  User? user;

  RegisterFormModel({this.imei, this.userLocation, this.user});

  RegisterFormModel.fromJson(Map<String, dynamic> json) {
    imei = json['imei'];
    userLocation = json['user_location'] != null
        ? UserLocation.fromJson(json['user_location'])
        : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['imei'] = imei;
    if (userLocation != null) {
      data['user_location'] = userLocation!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data.removeWhere((key, value) => value == null);
    return data;
  }
}

class UserLocation {
  String? latitude;
  String? longitude;

  UserLocation({this.latitude, this.longitude});

  UserLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data.removeWhere((key, value) => value == null);
    return data;
  }
}

class User {
  String? address;
  int? areaId;
  String? birthDate;
  String? birthPlace;
  bool? canTransactions;
  int? cashBalance;
  String? cityName;
  String? email;
  String? expiredIdCard;
  String? gender;
  int? id;
  String? idCardType;
  int? loanBalance;
  int? merchantTypeId;
  String? namaGadisIbu;
  String? name;
  int? otherBalance;
  String? parentReferral;
  String? password;
  String? passwordConfirmation;
  String? phoneNumber;
  int? roleId;
  int? salesBalance;
  int? salesSaldo;
  int? statusId;
  String? storeName;
  int? totalBalance;
  int? totalBonus;
  int? totalPoint;
  int? typeId;
  String? uid;
  String? fcm;
  String? pin;

  User({
    this.address,
    this.areaId,
    this.birthDate,
    this.birthPlace,
    this.canTransactions,
    this.cashBalance,
    this.cityName,
    this.email,
    this.expiredIdCard,
    this.gender,
    this.id,
    this.idCardType,
    this.loanBalance,
    this.merchantTypeId,
    this.namaGadisIbu,
    this.name,
    this.otherBalance,
    this.parentReferral,
    this.password,
    this.passwordConfirmation,
    this.phoneNumber,
    this.roleId,
    this.salesBalance,
    this.salesSaldo,
    this.statusId,
    this.storeName,
    this.totalBalance,
    this.totalBonus,
    this.totalPoint,
    this.typeId,
    this.uid,
    this.fcm,
    this.pin
  });

  User.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    areaId = json['area_id'];
    birthDate = json['birth_date'];
    birthPlace = json['birth_place'];
    canTransactions = json['can_transactions'];
    cashBalance = json['cash_balance'];
    cityName = json['city_name'];
    email = json['email'];
    expiredIdCard = json['expired_id_card'];
    gender = json['gender'];
    id = json['id'];
    idCardType = json['id_card_type'];
    loanBalance = json['loan_balance'];
    merchantTypeId = json['merchant_type_id'];
    namaGadisIbu = json['nama_gadis_ibu'];
    name = json['name'];
    otherBalance = json['other_balance'];
    parentReferral = json['parent_referral'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    phoneNumber = json['phone_number'];
    roleId = json['role_id'];
    salesBalance = json['sales_balance'];
    salesSaldo = json['sales_saldo'];
    statusId = json['status_id'];
    storeName = json['store_name'];
    totalBalance = json['total_balance'];
    totalBonus = json['total_bonus'];
    totalPoint = json['total_point'];
    typeId = json['type_id'];
    uid = json['uid'];
    fcm = json['fcm'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['address'] = address;
    data['area_id'] = areaId;
    data['birth_date'] = birthDate;
    data['birth_place'] = birthPlace;
    data['can_transactions'] = canTransactions;
    data['cash_balance'] = cashBalance;
    data['city_name'] = cityName;
    data['email'] = email;
    data['expired_id_card'] = expiredIdCard;
    data['gender'] = gender;
    data['id'] = id;
    data['id_card_type'] = idCardType;
    data['loan_balance'] = loanBalance;
    data['merchant_type_id'] = merchantTypeId;
    data['nama_gadis_ibu'] = namaGadisIbu;
    data['name'] = name;
    data['other_balance'] = otherBalance;
    data['parent_referral'] = parentReferral;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    data['phone_number'] = phoneNumber;
    data['role_id'] = roleId;
    data['sales_balance'] = salesBalance;
    data['sales_saldo'] = salesSaldo;
    data['status_id'] = statusId;
    data['store_name'] = storeName;
    data['total_balance'] = totalBalance;
    data['total_bonus'] = totalBonus;
    data['total_point'] = totalPoint;
    data['type_id'] = typeId;
    data['uid'] = uid;
    data['fcm_token'] = fcm;
    data['pin'] = pin;
    data.removeWhere((key, value) => value == null);
    return data;
  }
}
