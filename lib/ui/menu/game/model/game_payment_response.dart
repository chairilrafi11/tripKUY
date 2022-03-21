class GamePaymentResponse {
  int? id;
  String? transactionName;
  String? statusName;
  String? messages;
  String? statusId;
  String? statusDescription;
  int? cashBalance;
  int? loanBalance;
  String? authToken;

  GamePaymentResponse({
    this.id,
    this.transactionName,
    this.statusName,
    this.messages,
    this.statusId,
    this.statusDescription,
    this.cashBalance,
    this.loanBalance,
    this.authToken
  });

  GamePaymentResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionName = json['transaction_name'];
    statusName = json['status_name'];
    messages = json['messages'];
    statusId = json['status_id'];
    statusDescription = json['status_description'];
    cashBalance = json['cash_balance'];
    loanBalance = json['loan_balance'];
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
    data['cash_balance'] = this.cashBalance;
    data['loan_balance'] = this.loanBalance;
    data['auth_token'] = this.authToken;
    return data;
  }
}
