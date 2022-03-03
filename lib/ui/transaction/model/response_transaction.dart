class ResponseTransaction {
  int? id;
  String? messages;
  int? salePrice;
  String? indentifierNumber;
  int? providerId;
  int? productId;
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
      this.description});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['messages'] = this.messages;
    data['sale_price'] = this.salePrice;
    data['indentifier_number'] = this.indentifierNumber;
    data['provider_id'] = this.providerId;
    data['product_id'] = this.productId;
    data['user_saldo'] = this.userSaldo;
    data['transaction_name'] = this.transactionName;
    data['serial_number'] = this.serialNumber;
    data['status_name'] = this.statusName;
    data['status_code'] = this.statusCode;
    data['status_desc'] = this.statusDesc;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['bank_id'] = this.bankId;
    data['description'] = this.description;
    return data;
  }
}
