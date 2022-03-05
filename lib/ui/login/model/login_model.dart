class LoginModel {
  Session? session;
  String? version;

  LoginModel({this.session, this.version});

  LoginModel.fromJson(Map<String, dynamic> json) {
    session =
        json['session'] != null ? Session.fromJson(json['session']) : null;
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (session != null) {
      data['session'] = session!.toJson();
    }
    data['version'] = version;
    return data;
  }
}

class Session {
  String? deviceId;
  String? deviceRegisterId;
  String? email;
  String? imei;
  String? fcm;
  String? latitude;
  String? longitude;
  String? password;
  String? phoneNumber;
  String? radius;
  String? simImei;

  Session({
    this.deviceId,
    this.deviceRegisterId,
    this.email,
    this.imei,
    this.latitude,
    this.longitude,
    this.password,
    this.phoneNumber,
    this.radius,
    this.simImei,
    this.fcm
  });

  Session.fromJson(Map<String, dynamic> json) {
    deviceId = json['device_id'];
    deviceRegisterId = json['device_register_id'];
    email = json['email'];
    imei = json['imei'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    password = json['password'];
    phoneNumber = json['phone_number'];
    radius = json['radius'];
    simImei = json['sim_imei'];
    fcm = json['fcm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['device_id'] = deviceId;
    data['device_register_id'] = deviceRegisterId;
    data['email'] = email;
    data['imei'] = imei;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['password'] = password;
    data['phone_number'] = phoneNumber;
    data['radius'] = radius;
    data['fcm_token'] = fcm;
    data['sim_imei'] = simImei;
    return data;
  }
}
