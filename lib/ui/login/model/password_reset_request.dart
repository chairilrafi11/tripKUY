class PasswordResetRequest {
  String? phoneNumber;

  PasswordResetRequest({this.phoneNumber});

  PasswordResetRequest.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    return data;
  }
}
