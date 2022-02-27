class RegisterModel {
  String? name;
  String? birthPlace;
  String? birthDate;
  String? gender;
  String? phoneNumber;
  String? email;
  String? address;
  String? fcmToken;
  String? idCardNumber;
  String? motherName;
  String? province;
  String? cityName;
  String? village;
  String? district;
  String? postalCode;
  String? profession;
  String? salary;
  String? communityMember;
  String? appOrigin;
  String? password;
  String? confirmPassword;
  String? location;
  String? vehicle;
  String? addressDomisili;
  String? latitude;
  String? longitude;
  String? idDistributor;
  String? marriageStatus;

  RegisterModel({
    this.name,
    this.birthPlace,
    this.birthDate,
    this.gender,
    this.phoneNumber,
    this.email,
    this.address,
    this.fcmToken,
    this.idCardNumber,
    this.motherName,
    this.province,
    this.cityName,
    this.village,
    this.district,
    this.postalCode,
    this.profession, 
    this.salary, 
    this.communityMember,
    this.appOrigin,
    this.password,
    this.confirmPassword,
    this.location,
    this.vehicle,
    this.addressDomisili,
    this.latitude,
    this.longitude,
    this.idDistributor,
    this.marriageStatus,
  });

  RegisterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    birthPlace = json['birth_place'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    address = json['address'];
    fcmToken = json['fcm_token'];
    idCardNumber = json['id_card_number'];
    motherName = json['mother_name'];
    province = json['province'];
    cityName = json['city_name'];
    village = json['village'];
    district = json['district'];
    postalCode = json['postal_code'];
    profession = json['profession'];
    salary = json['salary'];
    communityMember = json['community_member'];
    appOrigin = json['app_origin'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
    location = json['location'];
    vehicle = json['vehicle'];
    addressDomisili = json['domisili'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    idDistributor = json['id_distributor'];
    marriageStatus = json['marriage_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['birth_place'] = birthPlace;
    data['birth_date'] = birthDate;
    data['gender'] = gender;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['address'] = address;
    data['fcm_token'] = fcmToken;
    data['id_card_number'] = idCardNumber;
    data['mother_name'] = motherName;
    data['province'] = province;
    data['city_name'] = cityName;
    data['village'] = village;
    data['district'] = district;
    data['postal_code'] = postalCode;
    data['profession'] = profession;
    data['salary'] = salary;
    data['community_member'] = communityMember;
    data['app_origin'] = appOrigin;
    data['password'] = password;
    data['confirm_password'] = confirmPassword;
    data['location'] = location;
    data['vehicle'] = vehicle;
    data['domisili'] = addressDomisili;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['id_distributor'] = idDistributor;
    data['marriage_status'] = marriageStatus;
    return data;
  }
}
