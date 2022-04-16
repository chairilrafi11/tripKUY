class ResponseTransaction {
  int? id;
  String? messages;
  int? salePrice;
  String? indentifierNumber;
  int? providerId;
  dynamic productId;
  int? userSaldo;
  String? transactionName;
  String? serialNumber;
  String? statusName;
  String? statusCode;
  String? statusDesc;
  int? createdAt;
  int? updatedAt;
  int? bankId;
  String? description;
  String? messagesToShow;

  ResponseTransaction(
      {this.id,
      this.messages,
      this.salePrice,
      this.indentifierNumber,
      this.providerId,
      this.productId,
      this.userSaldo,
      this.transactionName,
      this.serialNumber,
      this.statusName,
      this.statusCode,
      this.statusDesc,
      this.createdAt,
      this.updatedAt,
      this.bankId,
      this.description,
      this.messagesToShow});

  ResponseTransaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    messages = json['messages'];
    salePrice = json['sale_price'];
    indentifierNumber = json['indentifier_number'];
    providerId = json['provider_id'];
    productId = json['product_id'];
    userSaldo = json['user_saldo'];
    transactionName = json['transaction_name'];
    serialNumber = json['serial_number'];
    statusName = json['status_name'];
    statusCode = json['status_code'];
    statusDesc = json['status_desc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bankId = json['bank_id'];
    description = json['description'];
    messagesToShow = json['messages_to_show'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['messages'] = messages;
    data['sale_price'] = salePrice;
    data['indentifier_number'] = indentifierNumber;
    data['provider_id'] = providerId;
    data['product_id'] = productId;
    data['user_saldo'] = userSaldo;
    data['transaction_name'] = transactionName;
    data['serial_number'] = serialNumber;
    data['status_name'] = statusName;
    data['status_code'] = statusCode;
    data['status_desc'] = statusDesc;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['bank_id'] = bankId;
    data['description'] = description;
    data['messages_to_show'] = messagesToShow;
    return data;
  }
}
