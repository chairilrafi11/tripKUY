class CheckPhoneNumberModel {
  UserOtp? userOtp;

  CheckPhoneNumberModel({this.userOtp});

  CheckPhoneNumberModel.fromJson(Map<String, dynamic> json) {
    userOtp = json['user_otp'] != null
        ? new UserOtp.fromJson(json['user_otp'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userOtp != null) {
      data['user_otp'] = this.userOtp!.toJson();
    }
    return data;
  }
}

class UserOtp {
  String? phoneNumber;

  UserOtp({this.phoneNumber});

  UserOtp.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
