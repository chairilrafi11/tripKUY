class RegisterModelAgen {
  String? nameAgen;
  String? phoneNumber;
  String? idDistributor;
  String? address;
  String? cityName;
  String? villageId;
  String? district;
  String? postalCode;
  String? fcmToken;
  String? vehicle;
  String? latitude;
  String? longitude;
  String? location;

  RegisterModelAgen({
    this.nameAgen,
    this.phoneNumber,
    this.address,
    this.fcmToken,
    this.cityName,
    this.villageId,
    this.district,
    this.postalCode,
    this.location,
    this.vehicle,
    this.latitude,
    this.longitude,
    this.idDistributor,
  });

  RegisterModelAgen.fromJson(Map<String, dynamic> json) {
    nameAgen = json['name'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    fcmToken = json['fcm_token'];
    cityName = json['city_name'];
    villageId = json['village_id'];
    district = json['district'];
    postalCode = json['postal_code'];
    location = json['location'];
    vehicle = json['vehicle'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    idDistributor = json['id_distributor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = nameAgen;
    data['phone_number'] = phoneNumber;
    data['address'] = address;
    data['fcm_token'] = fcmToken;
    data['city_name'] = cityName;
    data['village_id'] = villageId;
    data['district'] = district;
    data['postal_code'] = postalCode;
    data['location'] = location;
    data['vehicle'] = vehicle;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['id_distributor'] = idDistributor;
    return data;
  }
}
