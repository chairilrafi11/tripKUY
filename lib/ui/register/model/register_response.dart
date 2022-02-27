class ResponseRegister {
  String? token;
  bool? isPassword;

  ResponseRegister({this.token, this.isPassword});

  ResponseRegister.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isPassword = json['is_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['is_password'] = isPassword;
    return data;
  }
}
