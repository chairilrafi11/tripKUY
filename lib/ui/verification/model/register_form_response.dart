class RegisterFormResponse {
  String? imei;
  UserLocation? userLocation;
  User? user;

  RegisterFormResponse({this.imei, this.userLocation, this.user});

  RegisterFormResponse.fromJson(Map<String, dynamic> json) {
    imei = json['imei'];
    userLocation = json['user_location'] != null
        ? new UserLocation.fromJson(json['user_location'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imei'] = this.imei;
    if (this.userLocation != null) {
      data['user_location'] = this.userLocation!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
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

  User(
      {this.address,
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
      this.uid});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['area_id'] = this.areaId;
    data['birth_date'] = this.birthDate;
    data['birth_place'] = this.birthPlace;
    data['can_transactions'] = this.canTransactions;
    data['cash_balance'] = this.cashBalance;
    data['city_name'] = this.cityName;
    data['email'] = this.email;
    data['expired_id_card'] = this.expiredIdCard;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['id_card_type'] = this.idCardType;
    data['loan_balance'] = this.loanBalance;
    data['merchant_type_id'] = this.merchantTypeId;
    data['nama_gadis_ibu'] = this.namaGadisIbu;
    data['name'] = this.name;
    data['other_balance'] = this.otherBalance;
    data['parent_referral'] = this.parentReferral;
    data['password'] = this.password;
    data['password_confirmation'] = this.passwordConfirmation;
    data['phone_number'] = this.phoneNumber;
    data['role_id'] = this.roleId;
    data['sales_balance'] = this.salesBalance;
    data['sales_saldo'] = this.salesSaldo;
    data['status_id'] = this.statusId;
    data['store_name'] = this.storeName;
    data['total_balance'] = this.totalBalance;
    data['total_bonus'] = this.totalBonus;
    data['total_point'] = this.totalPoint;
    data['type_id'] = this.typeId;
    data['uid'] = this.uid;
    return data;
  }
}
