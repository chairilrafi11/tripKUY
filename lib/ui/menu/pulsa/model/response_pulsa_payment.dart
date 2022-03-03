class ResponsePulsaPayment {
  int? id;
  String? transactionName;
  String? statusName;
  String? messages;
  int? statusId;
  String? statusDescription;
  int? totalBalance;
  String? authToken;

  ResponsePulsaPayment(
      {this.id,
      this.transactionName,
      this.statusName,
      this.messages,
      this.statusId,
      this.statusDescription,
      this.totalBalance,
      this.authToken});

  ResponsePulsaPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionName = json['transaction_name'];
    statusName = json['status_name'];
    messages = json['messages'];
    statusId = json['status_id'];
    statusDescription = json['status_description'];
    totalBalance = json['total_balance'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transaction_name'] = this.transactionName;
    data['status_name'] = this.statusName;
    data['messages'] = this.messages;
    data['status_id'] = this.statusId;
    data['status_description'] = this.statusDescription;
    data['total_balance'] = this.totalBalance;
    data['auth_token'] = this.authToken;
    return data;
  }
}
