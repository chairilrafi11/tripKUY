class PasswordResetForm {
  String? authToken;
  String? passcode;
  String? password;
  String? passwordConfirmation;

  PasswordResetForm({
    this.authToken,
    this.passcode,
    this.password,
    this.passwordConfirmation
  });

  PasswordResetForm.fromJson(Map<String, dynamic> json) {
    authToken = json['auth_token'];
    passcode = json['passcode'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['auth_token'] = authToken;
    data['passcode'] = passcode;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    return data;
  }
}
