class TopupRequestModel {
  String? accountName;
  String? accountNumber;
  int? amount;
  int? bankId;
  String? finCardmask;
  String? finCardno;
  String? finCardcvv;
  String? finCardexp;
  int? typeId;
  String? typeName;
  String? authToken;

  TopupRequestModel({
    this.accountName,
    this.accountNumber,
    this.amount,
    this.bankId,
    this.finCardmask,
    this.finCardno,
    this.finCardcvv,
    this.finCardexp,
    this.typeId,
    this.typeName,
    this.authToken
  });

  TopupRequestModel.fromJson(Map<String, dynamic> json) {
    accountName = json['account_name'];
    accountNumber = json['account_number'];
    amount = json['amount'];
    bankId = json['bank_id'];
    finCardmask = json['fin_cardmask'];
    finCardno = json['fin_cardno'];
    finCardcvv = json['fin_cardcvv'];
    finCardexp = json['fin_cardexp'];
    typeId = json['type_id'];
    typeName = json['type_name'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_name'] = accountName;
    data['account_number'] = accountNumber;
    data['amount'] = amount;
    data['bank_id'] = bankId;
    data['fin_cardmask'] = finCardmask;
    data['fin_cardno'] = finCardno;
    data['fin_cardcvv'] = finCardcvv;
    data['fin_cardexp'] = finCardexp;
    data['type_id'] = typeId;
    data['type_name'] = typeName;
    data['auth_token'] = authToken;
    data.removeWhere((key, value) => value == null);
    return data;
  }
}
