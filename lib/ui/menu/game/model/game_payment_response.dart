class GamePaymentResponse {
  int? id;
  String? transactionName;
  String? statusName;
  String? messages;
  int? statusId;
  String? statusDescription;
  int? cashBalance;
  String? loanBalance;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_name'] = transactionName;
    data['status_name'] = statusName;
    data['messages'] = messages;
    data['status_id'] = statusId;
    data['status_description'] = statusDescription;
    data['cash_balance'] = cashBalance;
    data['loan_balance'] = loanBalance;
    data['auth_token'] = authToken;
    return data;
  }
}
