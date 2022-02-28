class ResponseUser {
  String? name;
  String? fcmToken;
  String? phoneNumber;
  String? email;

  ResponseUser({this.name, this.fcmToken, this.phoneNumber, this.email});

  ResponseUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fcmToken = json['fcm_token'];
    phoneNumber = json['phone_number'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['fcm_token'] = this.fcmToken;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    return data;
  }
}
