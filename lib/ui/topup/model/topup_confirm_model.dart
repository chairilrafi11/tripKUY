class TopupConfirmModel {
  int? id;
  String? transactionCode;
  String? authToken;

  TopupConfirmModel({this.id, this.transactionCode, this.authToken});

  TopupConfirmModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionCode = json['transaction_code'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_code'] = transactionCode;
    data['auth_token'] = authToken;
    return data;
  }
}
