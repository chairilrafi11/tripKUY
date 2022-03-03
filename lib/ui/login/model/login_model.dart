class LoginModel {
  Session? session;
  String? version;

  LoginModel({this.session, this.version});

  LoginModel.fromJson(Map<String, dynamic> json) {
    session =
        json['session'] != null ? new Session.fromJson(json['session']) : null;
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.session != null) {
      data['session'] = this.session!.toJson();
    }
    data['version'] = this.version;
    return data;
  }
}

class Session {
  String? deviceId;
  String? deviceRegisterId;
  String? email;
  String? imei;
  String? latitude;
  String? longitude;
  String? password;
  String? phoneNumber;
  String? radius;
  String? simImei;

  Session(
      {this.deviceId,
      this.deviceRegisterId,
      this.email,
      this.imei,
      this.latitude,
      this.longitude,
      this.password,
      this.phoneNumber,
      this.radius,
      this.simImei});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_id'] = this.deviceId;
    data['device_register_id'] = this.deviceRegisterId;
    data['email'] = this.email;
    data['imei'] = this.imei;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['password'] = this.password;
    data['phone_number'] = this.phoneNumber;
    data['radius'] = this.radius;
    data['sim_imei'] = this.simImei;
    return data;
  }
}
