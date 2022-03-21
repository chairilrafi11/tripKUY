class RegisterActivation {
  String? authToken;
  String? code;

  RegisterActivation({this.authToken, this.code});

  RegisterActivation.fromJson(Map<String, dynamic> json) {
    authToken = json['auth_token'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['auth_token'] = authToken;
    data['code'] = code;
    return data;
  }
}
