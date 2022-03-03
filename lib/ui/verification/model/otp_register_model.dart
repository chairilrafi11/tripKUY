class OtpRegisterModel {
  int? id;
  String? otpCode;
  String? phoneNumber;

  OtpRegisterModel({this.id, this.otpCode, this.phoneNumber});

  OtpRegisterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    otpCode = json['otp_code'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['otp_code'] = this.otpCode;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
