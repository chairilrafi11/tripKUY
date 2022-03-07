class TopupRequestResponse {
  int? id;
  int? salePrice;
  String? paymentCode;
  String? transactionName;
  String? serialNumber;
  String? statusCode;
  int? transactionTypeId;
  String? messages;
  int? amount;
  int? createdAt;
  int? updatedAt;
  int? bankId;
  String? url;

  TopupRequestResponse({
    this.id,
    this.salePrice,
    this.paymentCode,
    this.transactionName,
    this.serialNumber,
    this.statusCode,
    this.transactionTypeId,
    this.messages,
    this.amount,
    this.createdAt,
    this.updatedAt,
    this.bankId,
    this.url
  });

  TopupRequestResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    salePrice = json['sale_price'];
    paymentCode = json['payment_code'];
    transactionName = json['transaction_name'];
    serialNumber = json['serial_number'];
    statusCode = json['status_code'];
    transactionTypeId = json['transaction_type_id'];
    messages = json['messages'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bankId = json['bank_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sale_price'] = salePrice;
    data['payment_code'] = paymentCode;
    data['transaction_name'] = transactionName;
    data['serial_number'] = serialNumber;
    data['status_code'] = statusCode;
    data['transaction_type_id'] = transactionTypeId;
    data['messages'] = messages;
    data['amount'] = amount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['bank_id'] = bankId;
    data['url'] = url;
    return data;
  }
}
