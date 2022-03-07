class BankResponse {
  int? id;
  String? name;
  dynamic accountNumber;
  String? bankName;
  String? logo;
  int? typeAccount;

  BankResponse({
    this.id,
    this.name,
    this.accountNumber,
    this.bankName,
    this.logo,
    this.typeAccount
  });

  BankResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    accountNumber = json['account_number'];
    bankName = json['bank_name'];
    logo = json['logo'];
    typeAccount = json['type_account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['account_number'] = accountNumber;
    data['bank_name'] = bankName;
    data['logo'] = logo;
    data['type_account'] = typeAccount;
    return data;
  }
}
