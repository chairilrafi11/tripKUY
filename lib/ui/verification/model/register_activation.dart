class RegisterActivation {
  String? authToken;
  String? code;

  RegisterActivation({this.authToken, this.code});

  RegisterActivation.fromJson(Map<String, dynamic> json) {
    authToken = json['auth_token'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth_token'] = this.authToken;
    data['code'] = this.code;
    return data;
  }
}
